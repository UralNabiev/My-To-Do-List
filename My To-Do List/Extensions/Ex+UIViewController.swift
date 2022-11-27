//
//  Extensions.swift
//  My To-Do List
//
//  Created by O'ral Nabiyev on 27/11/22.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert( groupType: GroupTypeEnum?, title: String?, message: String?, type: UIAlertController.Style, completion: @escaping ((GroupTypeEnum?)->Void)) {
        
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: type)
        
        guard let groupType = groupType else {
            let okBtn = UIAlertAction(title: "Ok", style: .default) { _ in
                completion(nil)
            }
            alertVC.addAction(okBtn)
            self.present(alertVC, animated: true, completion: nil)
            return
        }

        let finishedBtn = UIAlertAction(title: "Finish", style: .default) { _ in
            completion(.finished)
        }
        
        let unFinishedBtn = UIAlertAction(title: "UnFinish", style: .default) { _ in
            completion(.unFinishied)
        }
        
        let archivedBtn = UIAlertAction(title: "Archive", style: .default) { _ in
            completion(.archived)
        }
        
        let unArchivedBtn = UIAlertAction(title: "UnArchive", style: .default) { _ in
            completion(.unArchived)
        }
        
        let deleteBtn = UIAlertAction(title: "Delete", style: .destructive) { _ in
            completion(nil)
        }
        
        let cancelBtn = UIAlertAction(title: "Cancel", style: .cancel)
        
        switch groupType {
        case .new:
            
            alertVC.addAction(finishedBtn)
            alertVC.addAction(archivedBtn)
            
        case .archived:
            
            alertVC.addAction(unArchivedBtn)
            
        case .finished:
            
            alertVC.addAction(unFinishedBtn)
            alertVC.addAction(archivedBtn)
            
        case .unArchived:
            print("unArchived")
        case .unFinishied:
            print("unFinishied")
        case .deleted:
            print("deleted")
        }
        
        alertVC.addAction(deleteBtn)
        alertVC.addAction(cancelBtn)
        self.present(alertVC, animated: true, completion: nil)
        
    }
    
}
