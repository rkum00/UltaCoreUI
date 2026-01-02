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

public enum UBTextFieldSize {
    case compact
    case regular
    case large

    var height: CGFloat {
        switch self {
        case .compact: return 44
        case .regular: return 48
        case .large: return 56
        }
    }

    /// Offset keeps floating label INSIDE border
    var floatingOffset: CGFloat {
        switch self {
        case .compact: return -14
        case .regular: return -16
        case .large: return -18
        }
    }

    /// Top padding to reserve space for label
    var topPadding: CGFloat {
        switch self {
        case .compact: return 8
        case .regular: return 12
        case .large: return 14
        }
    }
}
