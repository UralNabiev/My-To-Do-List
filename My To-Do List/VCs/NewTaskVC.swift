//
//  NewTaskVC.swift
//  My To-Do List
//
//  Created by O'ral Nabiyev on 22/11/22.
//

import UIKit

class NewTaskVC: UIViewController {
    
    @IBOutlet weak var titleTf: UITextField!
    @IBOutlet weak var descTxtV: UITextView!
    @IBOutlet weak var priorityBtn: UIButton!
    @IBOutlet weak var backView: UIView!
    
    var newTask: TaskDM = TaskDM(title: "", subTitle: "", priority: .none)
    var addNewTask: ((TaskDM)->Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUpView()
        
    }
    
    func setUpView() {
        
        backView.layer.borderWidth = 1
        backView.layer.borderColor = UIColor.systemGreen.cgColor
        
        backView.transform = .init(translationX: 0, y: 1000)
        self.view.backgroundColor = .clear
        
        descTxtV.layer.cornerRadius = 16
        descTxtV.layer.borderColor = UIColor.systemGray3.cgColor
        descTxtV.layer.borderWidth = 1
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseOut) {
            self.backView.transform = .identity
            self.view.backgroundColor = .gray.withAlphaComponent(0.3)
        }

    }


    @IBAction func priorityTapped(_ sender: Any) {
        let vc = PriorityVC(nibName: "PriorityVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.choosenPriority = { pri in
            self.newTask.priority = pri
            self.priorityBtn.setTitle(pri.rawValue.capitalized, for: .normal)
            self.priorityBtn.backgroundColor = pri.setPriorityColor()
        }
        self.present(vc, animated: false)
        
    }
    @IBAction func addTapped(_ sender: Any) {
        
        newTask.title = titleTf.text!
        newTask.subTitle = descTxtV.text!
        
        if newTask.title.isEmpty {
            showAlert(groupType: nil, title: "Please fill the title", message: nil, type: .alert) { _ in
//                
            }
        } else {
            guard let addNewTask = addNewTask else { return }

            addNewTask(newTask)
            dismissVC()
        }
        
    }
    @IBAction func dismissTapped(_ sender: Any) {
        
        dismissVC()
        
    }
    
    func dismissVC() {
        UIView.animate(withDuration: 0.2, delay: 0, options: .curveEaseIn) {
            self.backView.transform = .init(translationX: 0, y: 1000)
            self.view.backgroundColor = .clear
        } completion: { _ in
            self.dismiss(animated: false)
        }
    }
    
    
}
