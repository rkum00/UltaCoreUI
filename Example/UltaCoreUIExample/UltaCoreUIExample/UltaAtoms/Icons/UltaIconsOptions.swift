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
    case icons = "Icons Options"
    
    func numberOfRows() -> Int {
        switch self {
        case .icons:
            return StyleDictionaryGlobalEnumIcons.allCases.count
        }
    }
    
    func getIconName(index: Int) -> String {
        return StyleDictionaryGlobalEnumIcons.allCases[index].rawValue
    }
    
    func getIconTintColor(theme: UBTheme) -> Color {
        switch self {
        case .icons:
            return Color(UBTheme.applyBackgroundPrimaryColor(theme: theme))
        }
    }
}

extension UltaIconsOptions: UBImages {
    func getIcon(index: Int) -> Image? {
        return getImageView(name: getIconName(index: index))
    }
}
