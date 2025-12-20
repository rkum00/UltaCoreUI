//
//  UltaIconsOptions.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 20/12/25.
//

import Foundation
import UltaCoreUI
import SwiftUI

enum UltaIconsOptions: String, CaseIterable {
    case topDescription = "The available icons options are compatible with all components."
    case icons = "Icons Options"
    
    func numberOfRows() -> Int {
        switch self {
        case .topDescription:
            return 0
        case .icons:
            return StyleDictionaryGlobalEnumIcons.allCases.count
        }
    }
    
    func getIconName(index: Int) -> String {
        return StyleDictionaryGlobalEnumIcons.allCases[index].rawValue
    }
}

extension UltaIconsOptions: UBImages {
    func getIcon(index: Int) -> Image? {
        return getImageView(name: getIconName(index: index))
    }
}
