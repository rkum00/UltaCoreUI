//
//  UltaFontsPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 19/12/25.
//

import Foundation
import UltaCoreUI
import SwiftUI

class UltaFontsPresenter: ObservableObject {
    var theme: UBTheme
    
    init(theme: UBTheme = UBTheme.current) {
        self.theme = theme
    }
    
    var numberOfSections: Int {
        return UltaFontsOptions.allCases.count
    }
    
    func getRowsCount(for section: Int) -> Int {
        return UltaFontsOptions.allCases[section].numberOfRows()
    }
    
    func getComponentName(row: Int, section: Int) -> AttributedString {
        switch UltaFontsOptions.allCases[section] {
        case .option:
            return UltaFontsOptions.option.getAttributedComponentName(row: row)
        default:
            return AttributedString()
        }
    }
    
    func getComponentFamilyName(row: Int, section: Int) -> String {
        switch UltaFontsOptions.allCases[section] {
        case .option:
            return UltaFontsOptions.option.getFontFamilyName(row: row, section: section)
        default:
            return ""
        }
    }
    
    func getComponentFontSize(row: Int, section: Int) -> CGFloat {
        switch UltaFontsOptions.allCases[section] {
        case .option:
            return UltaFontsOptions.option.getFontSize(row: row, section: section)
        default:
            return 0.0
        }
    }
    
    func getComponentTextColor(row: Int, section: Int) -> Color {
        switch UltaFontsOptions.allCases[section] {
        case .option:
            return UltaFontsOptions.option.getTextColor(theme: theme)
        default:
            return .white
        }
    }
    
    /// Returns the title for a specific row in a section.
    /// - Parameter section: The index of the section.
    /// - Returns: The title of the specified row in the section.
    func getSectionTitle(section: Int) -> String {
        return UltaFontsOptions.allCases[section].rawValue
    }
}
