//
//  PriorityVC.swift
//  My To-Do List
//
//  Created by O'ral Nabiyev on 23/11/22.
//

import UIKit

class PriorityVC: UIViewController {
    
    var choosenPriority: ((PriorityEnum)->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func priorityTapped(_ sender: UIButton) {
        switch sender.tag {
        case 0: choosenPriority?(.high)
        case 1: choosenPriority?(.medium)
        case 2: choosenPriority?(.low)
        case 3: choosenPriority?(.none)
        default:
            choosenPriority?(.none)
        }
        
        self.dismiss(animated: true)
        
    }
    

}
