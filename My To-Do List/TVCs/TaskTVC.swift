//
//  TaskTVC.swift
//  My To-Do List
//
//  Created by O'ral Nabiyev on 22/11/22.
//

import UIKit

class TaskTVC: UITableViewCell {

    static let identifier: String = "TaskTVC"
    
    static func nib() -> UINib {
        UINib(nibName: "TaskTVC", bundle: nil)
    }
    

    @IBOutlet weak var subTitleLbl: UILabel!
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var priorityV: UIView!
    @IBOutlet weak var typeView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        selectionStyle = .none
        
    }

    func updateCell(task: TaskDM, groupType: GroupTypeEnum) {
        
        titleLbl.text = task.title
        subTitleLbl.text = task.subTitle
        priorityV.backgroundColor = task.priority.setPriorityColor()
        
        switch groupType {
        case .new:
            typeView.backgroundColor = .systemGray6
        case .archived:
            typeView.backgroundColor = .systemGray5
        case .finished:
            typeView.backgroundColor = .systemGray4
        case .unArchived:
            print("unArchived")
        case .unFinishied:
            print("unFinished")
        case .deleted:
            print("deleted")
        }
        
    }
    

}
