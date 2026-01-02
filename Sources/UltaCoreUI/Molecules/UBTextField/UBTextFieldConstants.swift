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
    
    var helperTextColor: TextColorType {
        switch self {
        case .flat:
            return .neutralLow
        case .rounded:
            return .primary
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

// MARK: - UBTextFieldSize
public enum UBTextFieldSize {
    case compact
    case regular
    case large
    
    var height: CGFloat {
        switch self {
        case .compact: return UBGlobal.sizeHeightMinH900
        case .regular: return UBGlobal.sizeHeight900
        case .large: return UBGlobal.sizeHeight1000
        }
    }
    
    /// Floating placeholder offset
    var floatingOffset: CGFloat {
        switch self {
        case .compact: return -UBGlobal.space400
        case .regular: return -UBGlobal.space450
        case .large: return -UBGlobal.space500
        }
    }
    
    /// Base top padding for floating label
    var baseTopPadding: CGFloat {
        switch self {
        case .compact: return UBGlobal.space200
        case .regular: return UBGlobal.space300
        case .large: return UBGlobal.space350
        }
    }
    
    /// Extra top padding for rounded variant
    func topPadding(for variant: TextFieldVariant) -> CGFloat {
        switch variant {
        case .rounded:
            return baseTopPadding + UBGlobal.space150
        default:
            return baseTopPadding
        }
    }
    
    var bottomPadding: CGFloat {
        switch self {
        case .compact: return UBGlobal.space150
        case .regular: return UBGlobal.space200
        case .large: return UBGlobal.space200
        }
    }
    
    var horizontalPadding: CGFloat {
        switch self {
        case .compact: return UBGlobal.space300
        case .regular: return UBGlobal.space400
        case .large: return UBGlobal.space400
        }
    }
    
    /// Extra padding between floating label and input text
    var floatingTextPadding: CGFloat {
        switch self {
        case .compact: return UBGlobal.space100
        case .regular: return UBGlobal.space150
        case .large: return UBGlobal.space200
        }
    }
}
