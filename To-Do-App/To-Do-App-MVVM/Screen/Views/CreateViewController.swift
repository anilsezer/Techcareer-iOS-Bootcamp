//
//  CreateViewController.swift
//  To-Do-App-MVVM
//
//  Created by Anıl Sezer on 4.10.2023.
//

import UIKit

class CreateViewController: UIViewController {

    @IBOutlet weak var toDoTextField: UITextField!
        var viewModel = CreateViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func createToDo(_ sender: Any) {
        if let item = toDoTextField.text {
            viewModel.saveTodo(text: item)
        }
    }
}
