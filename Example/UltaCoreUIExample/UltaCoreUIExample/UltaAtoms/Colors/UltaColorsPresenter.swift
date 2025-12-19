//
//  UltaColorsPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 18/12/25.
//

import Foundation
import UltaCoreUI
import SwiftUI

class UltaColorsPresenter: ObservableObject {
    var theme: UBTheme
    
    init(theme: UBTheme = UBTheme.current) {
        self.theme = theme
    }
    
    var numberOfSections: Int {
        return UltaColorsOptions.allCases.count
    }
    
    func getRowsCount(for section: Int, theme: UBTheme) -> Int {
        return UltaColorsOptions.allCases[section].numberOfRows(theme: theme)
    }
    
    func getComponentName(row: Int, section: Int, theme: UBTheme) -> String {
        switch UltaColorsOptions.allCases[section] {
        case .option:
            return UltaColorsOptions.option.getColorName(row: row, section: section, theme: theme)
        default:
            return ""
        }
    }
    
    func getComponentBackgroundColor(row: Int, section: Int, theme: UBTheme) -> Color {
        switch UltaColorsOptions.allCases[section] {
        case .option:
            return UltaColorsOptions.option.getBackgroundColor(row: row, section: section, theme: theme)
        default:
            return .white
        }
    }
    
    /// Returns the title for a specific row in a section.
    /// - Parameter section: The index of the section.
    /// - Returns: The title of the specified row in the section.
    func getSectionTitle(section: Int) -> String {
        return UltaColorsOptions.allCases[section].rawValue
    }
}
