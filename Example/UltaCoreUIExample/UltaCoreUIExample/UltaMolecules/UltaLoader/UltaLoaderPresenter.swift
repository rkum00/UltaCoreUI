//
//  UltaLoaderPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 17/12/25.
//

import Foundation
import UltaCoreUI

class UltaLoaderPresenter: ObservableObject {
    var theme: UBTheme
    
    ///  Initializes the presenter with a theme.
    /// - Parameter theme: The theme to be used for the spinner components. Defaults to the current theme.
    init(theme: UBTheme = UBTheme.current) {
        self.theme = theme
    }
    
    /// Returns the number of sections in the spinner options.
    var numberOfSections: Int {
        return UltaLoaderOptions.allCases.count
    }
    
    /// Returns the number of rows for a given section.
    /// - Parameter section: The index of the section for which to get the number of rows.
    /// - Returns: The number of rows in the specified section.
    func getRowsCount(for section: Int) -> Int {
        return UltaLoaderOptions.allCases[section].numberOfRows()
    }
    
    /// - Parameters:
    ///   - row: The index of the row for which to get the component.
    ///   - section: The index of the section for which to get the component.
    /// - Returns: A `UBLoaderView` component corresponding to the specified row and section.
    func getComponent(row: Int, section: Int) -> UBLoaderView {
        switch UltaLoaderOptions.allCases[section] {
        case .color:
            return UltaLoaderOptions.color.getColorOptions(row: row, theme: theme)
        case .size:
            return UltaLoaderOptions.size.getSizeOptions(row: row, theme: theme)
        case .label:
            return UltaLoaderOptions.label.getLabelOptions(row: row, theme: theme)
        default:
            return UBLoaderView()
        }
    }
    
    /// Returns the title for a specific row in a section.
    /// - Parameter section: The index of the section.
    /// - Returns: The title of the specified row in the section.
    func getSectionTitle(section: Int) -> String {
        return UltaLoaderOptions.allCases[section].rawValue
    }
}
