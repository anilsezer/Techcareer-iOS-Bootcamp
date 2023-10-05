//
//  ViewController.swift
//  To-Do-App-MVVM
//
//  Created by Anıl Sezer on 4.10.2023.
//

import UIKit
import RxSwift

class HomeViewController: UIViewController {
    
    @IBOutlet weak var toDoSearchBar: UISearchBar!
    @IBOutlet weak var toDoTableView: UITableView!
    
    var toDoItemList = [ToDoModel]()
    var viewModel = HomeViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let toDoListSubscription = viewModel.toDoItemList.subscribe(onNext: { [self] list in
            toDoItemList = list
            toDoTableView.reloadData()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        viewModel.uploadToDoItems()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetails" {
            if let toDoItem = sender as? ToDoModel {
                let showDetailsVC = segue.destination as! DetailsViewController
                showDetailsVC.toDoItem = toDoItem
            }
        }
    }
}
extension HomeViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.searchToDo(searchName: searchText)
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoItemList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoTableViewCell") as! ToDoTableViewCell
        let toDoItem = toDoItemList[indexPath.row]
        
        cell.toDoTextLabel.text = toDoItem.text
        cell.idNumber.text = String(toDoItem.id ?? 1)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = toDoItemList[indexPath.row]
        performSegue(withIdentifier: "toDetails", sender: item)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") { contextulAction,view,bool in
           
            let item = self.toDoItemList[indexPath.row]
            
            let alert = UIAlertController(title: "Delete Action", message: "Do you want to remove \(item.text!)?", preferredStyle: .alert)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
            alert.addAction(cancelAction)
            
            let okayAction = UIAlertAction(title: "Yes", style: .destructive) { action in
                self.viewModel.deleteToDo(id: item.id!)
            }
            alert.addAction(okayAction)
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
}

