//
//  UltaCardContainerViewOptions.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 04/12/25.
//

import Foundation

public enum UltaCardContainerViewOptions: String, CaseIterable {
    case topDescription = "Description for Card Container."
    case size = "All size options"
    case backgroundColor = "Background Color"
    case borderRadius = "Border Radius"
    case padding = "Padding"
    
    func numberOfRows() -> Int {
        switch self {
        case .topDescription:
            return 0
        default: return 1
        }
    }
}
