//
//  UltaColorsOptions.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 18/12/25.
//

import Foundation
import SwiftUI
import UltaCoreUI

enum UltaColorsOptions: String, CaseIterable {
    case topDescription = "The available color options are compatible with all components."
    case option = "Color Options"
    
    func numberOfRows(theme: UBTheme) -> Int {
        switch self {
        case .topDescription:
            return 0
        case .option:
            switch theme {
            case .theme1:
                return GlobalTheme1ColorEnum.allCases.count
            case .theme2:
                return GlobalTheme2ColorEnum.allCases.count
            case .theme3:
                return GlobalTheme3ColorEnum.allCases.count
            }
        }
    }
    
    func getColorName(row: Int, section: Int, theme: UBTheme) -> String {
        switch self {
        case .option:
            switch theme {
            case .theme1:
                return GlobalTheme1ColorEnum.allCases[row].rawValue
            case .theme2:
                return GlobalTheme2ColorEnum.allCases[row].rawValue
            case .theme3:
                return GlobalTheme3ColorEnum.allCases[row].rawValue
            }
        default:
            return ""
        }
    }
    
    func getBackgroundColor(row: Int, section: Int, theme: UBTheme) -> Color {
        switch self {
        case .option:
            switch theme {
            case .theme1:
                return Color(GlobalTheme1ColorEnum.allCases[row].associatedColor)
            case .theme2:
                return Color(GlobalTheme2ColorEnum.allCases[row].associatedColor)
            case .theme3:
                return Color(GlobalTheme3ColorEnum.allCases[row].associatedColor)
            }
        default:
            return Color(GlobalTheme3ColorEnum.allCases[row].associatedColor)
        }
    }
}
