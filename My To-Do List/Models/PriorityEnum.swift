//
//  PriorityEnum.swift
//  My To-Do List
//
//  Created by O'ral Nabiyev on 22/11/22.
//

import Foundation
import UIKit

enum PriorityEnum: String {
    
    case high, medium, low, none
    
}

extension PriorityEnum {
    
    func setPriorityColor() -> UIColor {
        switch self {
        case .high:
            return .systemRed
        case .medium:
            return .systemYellow
        case .low:
            return .systemGreen
        case .none:
            return .systemGray3
        }
    }
    
}
