//
//  UltaTextFieldViewPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 29/12/25.
//

import Foundation
import UltaCoreUI
import SwiftUI


class UltaTextFieldViewPresenter: ObservableObject {
    @Published var texts: [IndexPath: String] = [:]
    
    /// Returns the number of sections in the text field options.
    var numberOfSections: Int {
        return UltaTextFieldViewOptions.allCases.count
    }
    
    /// Returns the number of rows for a given section.
    /// - Parameter section: The index of the section for which to get the number of rows.
    /// - Returns: The number of rows in the specified section.
    func getRowsCount(for section: Int) -> Int {
        return UltaTextFieldViewOptions.allCases[section].numberOfRows()
    }
    
    func textBinding(for section: Int, row: Int) -> Binding<String> {
        let key = IndexPath(row: row, section: section)
        return Binding(
            get: {
                self.texts[key, default: ""]
            },
            set: {
                self.texts[key] = $0
            }
        )
    }
    
    /// - Parameters:
    ///   - row: The index of the row for which to get the component.
    ///   - section: The index of the section for which to get the component.
    /// - Returns: A `UBTextField` component corresponding to the specified row and section.
    func getComponent(row: Int, section: Int, theme: UBTheme) -> UBTextField {
        let textBinding = textBinding(for: section, row: row)
        switch UltaTextFieldViewOptions.allCases[section] {
        case .shape:
            return UltaTextFieldViewOptions.shape.getShapeOptions(row: row, text: textBinding, theme: theme)
        case .icons:
            return UltaTextFieldViewOptions.icons.getIconsOptions(row: row, text: textBinding, theme: theme)
        default:
            return UBTextField(text: textBinding, placeHolderText: "Test", variant: .flat, textFieldAccessibility: "")
        }
    }
    
    /// Returns the title for a specific row in a section.
    /// - Parameter section: The index of the section.
    /// - Returns: The title of the specified row in the section.
    func getSectionTitle(section: Int) -> String {
        return UltaTextFieldViewOptions.allCases[section].rawValue
    }
}
