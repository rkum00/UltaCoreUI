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
            return .red
        default:
            return .red
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
