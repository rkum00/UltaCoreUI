//
//  UltaIconsPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 20/12/25.
//

import Foundation
import UltaCoreUI
import SwiftUI

class UltaIconsPresenter: ObservableObject {
    var theme: UBTheme
    
    init(theme: UBTheme = UBTheme.current) {
        self.theme = theme
    }
    
    var numberOfSections: Int {
        return UltaIconsOptions.allCases.count
    }
    
    func getRowsCount(for section: Int) -> Int {
        return UltaIconsOptions.allCases[section].numberOfRows()
    }
    
    func getComponentName(row: Int, section: Int) -> String {
        switch UltaIconsOptions.allCases[section] {
        case .icons:
            return UltaIconsOptions.icons.getIconName(index: row)
        }
    }
    
    func getIcon(row: Int, section: Int) -> Image {
        switch UltaIconsOptions.allCases[section] {
        case .icons:
            return UltaIconsOptions.icons.getIcon(index: row) ?? Image("")
        }
    }
    
    func getTintColor(row: Int, section: Int) -> Color {
        switch UltaIconsOptions.allCases[section] {
        case .icons:
            return UltaIconsOptions.icons.getIconTintColor(theme: theme)
        }
    }
    
    /// Returns the title for a specific row in a section.
    /// - Parameter section: The index of the section.
    /// - Returns: The title of the specified row in the section.
    func getSectionTitle(section: Int) -> String {
        return UltaIconsOptions.allCases[section].rawValue
    }
}
