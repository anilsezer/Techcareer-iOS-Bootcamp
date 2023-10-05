//
//  ToDoDaoRepository.swift
//  To-Do-App-MVVM
//
//  Created by Anıl Sezer on 4.10.2023.
//

import Foundation
import RxSwift

class ToDoDaoRepository {
    
    var toDoItemList = BehaviorSubject<[ToDoModel]>(value: [ToDoModel]())
    
    var db:FMDatabase?
    
    init() {
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let veriTabaniURL = URL(fileURLWithPath: hedefYol).appendingPathComponent("todoitems.db")
        db = FMDatabase(path: veriTabaniURL.path)
    }
    
    func saveTodo(text:String) {
        db?.open()
        do {
            try db!.executeUpdate("INSERT INTO items (text) VALUES (?)", values: [text])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func deleteToDo(id: Int) {
        db?.open()
        do {
            try db!.executeUpdate("DELETE FROM items WHERE id=?", values: [id])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func searchToDo(searchName:String) {
        var list = [ToDoModel]()
        
        db?.open()
        do {
            let result = try db!.executeQuery("SELECT * FROM items WHERE text like '%\(searchName)%'", values: [nil ?? ""])
            while result.next() {
                let item_id = Int(result.string(forColumn: "id"))!
                let item_text = result.string(forColumn: "text")!
                
                let item = ToDoModel(id: item_id, text: item_text)
                list.append(item)
            }
            toDoItemList.onNext(list)

        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func updateToDo(id:Int?, text: String) {
        db?.open()
        do {
            try db!.executeUpdate("UPDATE items SET text=? WHERE id=?", values: [text,id!])
        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func uploadToDoItems() {
        var list = [ToDoModel]()
        
        db?.open()
        do {
            let result = try db!.executeQuery("SELECT * FROM items", values: nil)
            while result.next() {
                let item_id = Int(result.string(forColumn: "id"))!
                let item_text = result.string(forColumn: "text")!
                
                let item = ToDoModel(id: item_id, text: item_text)
                list.append(item)
            }
            toDoItemList.onNext(list)

        }catch {
            print(error.localizedDescription)
        }
        db?.close()
    }
    
    func copyDataBase() {
        let bundleLocation = Bundle.main.path(forResource: "todoitems", ofType: ".db")
        let target = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let existsCopyFiles = URL(fileURLWithPath: target).appendingPathComponent("todoitems.db")
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: existsCopyFiles.path){
        }else{
            do{
                try fileManager.copyItem(atPath: bundleLocation!, toPath: existsCopyFiles.path)
            }catch{}
        }
    }
}
