//
//  ToDoModel.swift
//  To-Do-App-MVVM
//
//  Created by Anıl Sezer on 4.10.2023.
//

import Foundation

class ToDoModel {
    
    var id:Int?
    var text:String?
    
    init(id: Int, text: String) {
        self.id = id
        self.text = text
    }
}
