//
//  DetailViewModel.swift
//  To-Do-App-MVVM
//
//  Created by Anıl Sezer on 4.10.2023.
//

import Foundation

class DetailsViewModel {
    
    var toDoRepoStory = ToDoDaoRepository()
    
    func updateToDo(id:Int, text:String) {
        toDoRepoStory.updateToDo(id: id, text: text)
    }
}
