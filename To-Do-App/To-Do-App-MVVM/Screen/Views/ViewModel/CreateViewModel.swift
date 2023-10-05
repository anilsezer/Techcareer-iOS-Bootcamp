//
//  CreateViewModel.swift
//  To-Do-App-MVVM
//
//  Created by Anıl Sezer on 4.10.2023.
//

import Foundation

class CreateViewModel {
    
    var toDoRepoStory = ToDoDaoRepository()
    
    func saveTodo(text:String) {
        toDoRepoStory.saveTodo(text: text)
    }
}
