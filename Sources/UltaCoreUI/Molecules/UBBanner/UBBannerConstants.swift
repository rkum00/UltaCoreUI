//
//  UBBannerConstants.swift
//
//
//  Created by Rakesh Kumar on 15/12/25.
//

import Foundation
import SwiftUI

public enum UBBannerType: String, CaseIterable {
    case success
    case error
    case warning
    case info

    @available(iOS 13.0, *)
    var backgroundColor: Color {
        switch self {
        case .success: return Color(UBTheme.applyPositiveColor())
        case .error: return Color(UBTheme.applyErrorColor())
        case .warning: return Color(UBTheme.applyWarningColor())
        case .info: return Color(UBTheme.applyInfoColor())
        }
    }

    var iconName: String {
        switch self {
        case .success: return "checkmark.circle.fill"
        case .error: return "xmark.octagon.fill"
        case .warning: return "exclamationmark.triangle.fill"
        case .info: return "info.circle.fill"
        }
    }
    
    var crossicon: String {
        return "xmark"
    }
}
