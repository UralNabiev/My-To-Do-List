//
//  HomeVC.swift
//  My To-Do List
//
//  Created by O'ral Nabiyev on 22/11/22.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var groupTasks: [TaskGroupDM] = [
        TaskGroupDM(tasks: [], groupType: .new),
        TaskGroupDM(tasks: [], groupType: .archived),
        TaskGroupDM(tasks: [], groupType: .finished),
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpTableView()
        
    }
    
    @IBAction func addTapped(_ sender: Any) {
        
        let vc = NewTaskVC(nibName: "NewTaskVC", bundle: nil)
        vc.modalPresentationStyle = .overFullScreen
        vc.addNewTask = { task in
            self.groupTasks[0].tasks.append(task)
            self.tableView.reloadData()
        }
        self.present(vc, animated: false)
        
    }
    


}

//MARK: - UITableViewDelegate
extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let group = groupTasks[indexPath.row]
        showAlert(groupType: group.groupType, title: "Choose what to do", message: nil, type: .actionSheet) { groupType in
            
            guard let groupType = groupType else { return }
            print("type = ", groupType.rawValue)
            
        }
    }
    
}

//MARK: - UITableViewDataSource
extension HomeVC: UITableViewDataSource {
    
    func setUpTableView() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.register(TaskTVC.nib(), forCellReuseIdentifier: TaskTVC.identifier)
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return groupTasks.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return groupTasks[section].tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTVC.identifier, for: indexPath) as? TaskTVC else { return UITableViewCell() }
        
        cell.updateCell(task: groupTasks[indexPath.section].tasks[indexPath.row], groupType: groupTasks[indexPath.section].groupType)
        
        return cell
    }
    
}
