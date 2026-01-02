//
//  UltaTextFieldViewOptions.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 29/12/25.
//

import Foundation
import UltaCoreUI
import SwiftUI

/// This enum defines the options available for the UBTextField component.
public enum UltaTextFieldViewOptions: String, CaseIterable {
    case topDescription = "A Text Field is an input component that allows users to enter and edit a single line of text. It supports user input such as names, email addresses, numbers, or short messages and provides real-time feedback while typing."
    case shape = "Shape Options"
    case icons = "Icon Options"
    
    /// Returns the number of rows for each option.
    /// - Returns: The number of rows for the current option.
    func numberOfRows() -> Int {
        switch self {
        case .topDescription:
            return 0
        case .shape:
            return TextFieldVariant.allCases.count
        case .icons:
            return 2
        }
    }
    
    /// - Parameters:
    ///   - row: the row index for which the component is required.
    ///   - theme: it is used for selecting the color based on the theme selected from UBTheme options
    /// - Returns: Returns the UBTextField component based on the row selected.
    func getShapeOptions(row: Int, text: Binding<String>, theme: UBTheme) -> UBTextField {
        switch TextFieldVariant.allCases[row] {
        case .rounded:
            UBTextField(text: text, helperText: "Mandatory field*", maxCharacters: 20, placeHolderText: "Mandatory Test", variant: .rounded, textFieldAccessibility: "", theme: theme)
        default:
            UBTextField(text: text, helperText: "Testing field", maxCharacters: 10, placeHolderText: "Test", variant: .flat, textFieldAccessibility: "", theme: theme)
        }
    }
    
    /// - Parameters:
    ///   - row: the row index for which the component is required.
    ///   - theme: it is used for selecting the color based on the theme selected from UBTheme options
    /// - Returns: Returns the UBTextField component based on the row selected.
    func getIconsOptions(row: Int, text: Binding<String>, theme: UBTheme) -> UBTextField {
        switch row {
        case 0:
            UBTextField(text: text, helperText: "User Name*", maxCharacters: 20, placeHolderText: "Enter username", variant: .rounded, leading: Slot(imageName: StyleDictionaryGlobalEnumIcons.userOutline24.rawValue), textFieldAccessibility: "", keyboardType: .email, theme: theme)
        default:
            UBTextField(text: text, maxCharacters: 10, placeHolderText: "Empty bin", variant: .rounded, trailing: Slot(imageName: StyleDictionaryGlobalEnumIcons.trashOutline24.rawValue), textFieldAccessibility: "", theme: theme)
        }
    }
}
