//
//  SayfaYViewController.swift
//  17SeptemberBootcampAssignment
//
//  Created by Anıl Sezer on 18.09.2023.
//

import UIKit

class SayfaYViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
 
    @IBAction func backToAnaysayfaButton(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)
    }
    
}
