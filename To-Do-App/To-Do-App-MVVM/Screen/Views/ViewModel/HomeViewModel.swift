//
//  HomeViewModel.swift
//  To-Do-App-MVVM
//
//  Created by Anıl Sezer on 4.10.2023.
//

import Foundation
import RxSwift

class HomeViewModel {
    var toDoItemList = BehaviorSubject<[ToDoModel]>(value: [ToDoModel]())

    var toDoRepository = ToDoDaoRepository()
    init() {
        toDoRepository.copyDataBase()
        toDoItemList = toDoRepository.toDoItemList
    }
    
    func searchToDo(searchName:String) {
        toDoRepository.searchToDo(searchName: searchName)
    }
    
    func deleteToDo(id: Int) {
        toDoRepository.deleteToDo(id: id)
        uploadToDoItems()
    }
    
    func uploadToDoItems() {
        toDoRepository.uploadToDoItems()
    }
    
}
