//
//  DetailViewController.swift
//  To-Do-App-MVVM
//
//  Created by Anıl Sezer on 4.10.2023.
//

import UIKit

class DetailsViewController: UIViewController {

    @IBOutlet weak var toDoTextField: UITextField!
    
    var toDoItem:ToDoModel?
    var viewModel = DetailsViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = toDoItem {
            toDoTextField.text = item.text
            toDoItem?.id = item.id
        }
    }
    
    @IBAction func updateButton(_ sender: Any) {
        if let item = toDoTextField.text, let id = toDoItem?.id {
            viewModel.updateToDo(id:id,text: item)
        }
    }
}
