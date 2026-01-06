//
//  UltaPickupPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 05/01/26.
//

import Foundation
import UltaCoreUI
import SwiftUI

class UltaPickupPresenter: ObservableObject {
    var theme: UBTheme
    
    init(theme: UBTheme = UBTheme.current) {
        self.theme = theme
    }
    
    var numberOfSections: Int {
        return UltaPickupViewOptions.allCases.count
    }
    
    func getColumns(for section: Int) -> [GridItem] {
        return Array(
            repeating: GridItem(.fixed(UltaPickupViewOptions.options.gridSize.width), spacing: UBGlobal.space400),
            count: getRowsCount(for: section)
        )
    }
    
    func getRowsCount(for section: Int) -> Int {
        return UltaPickupViewOptions.allCases[section].numberOfRows()
    }
    
    func getComponent(row: Int, section: Int, selectedItem: Binding<[Int: Int]>) -> some View {
        switch UltaPickupViewOptions.allCases[section] {
        case .options, .deals, .delivery:
            return UltaPickupViewOptions.options.getPickupOptionsComponent(section: section, row: row, theme: theme, selectedItem: selectedItem)
        }
    }
    
    /// Returns the title for a specific row in a section.
    /// - Parameter section: The index of the section.
    /// - Returns: The title of the specified row in the section.
    func getSectionTitle(section: Int) -> String {
        return UltaPickupViewOptions.allCases[section].rawValue
    }
}
