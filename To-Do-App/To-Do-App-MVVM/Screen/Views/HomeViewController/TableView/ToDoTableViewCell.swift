//
//  ToDoTableViewCell.swift
//  To-Do-App-MVVM
//
//  Created by Anıl Sezer on 4.10.2023.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var idNumber: UILabel!
    @IBOutlet weak var toDoTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
