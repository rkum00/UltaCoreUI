//
//  UBTextFieldConstants.swift
//
//
//  Created by Rakesh Kumar on 24/12/25.
//

import Foundation
import SwiftUI

// This is used for selecting the TextField variant
public enum TextFieldVariant: String, CaseIterable {
    case flat
    case rounded
    
    @available(iOS 13.0, *)
    func getBorderColor(theme: UBTheme = .current) -> Color {
        switch self {
        case .flat:
            return Color(UBTheme.applyNeutralHighColor(theme: theme))
        default:
            return Color(UBTheme.applyNeutralLowColor(theme: theme))
        }
    }
    
    @available(iOS 13.0, *)
    func getTextColor(theme: UBTheme = .current) -> Color {
        switch self {
        case .flat:
            return .gray
        default:
            return .red
        }
    }
}

public enum UBKeyboardType {
    case `default`
    case email
    case number
    case phone
    case decimal
    case url
    
    var uiKeyboardType: UIKeyboardType {
        switch self {
        case .default:
            return .default
        case .email:
            return .emailAddress
        case .number:
            return .numberPad
        case .phone:
            return .phonePad
        case .decimal:
            return .decimalPad
        case .url:
            return .URL
        }
    }
}
