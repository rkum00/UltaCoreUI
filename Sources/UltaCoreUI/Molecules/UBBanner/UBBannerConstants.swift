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
    func getBackgroundColor(theme: UBTheme) -> Color {
        switch self {
        case .success:
            return Color(UBTheme.applyPositiveColor(theme: theme))
        case .error:
            return Color(UBTheme.applyErrorColor(theme: theme))
        case .warning:
            return Color(UBTheme.applyWarningColor(theme: theme))
        case .info:
            return Color(UBTheme.applyInfoColor(theme: theme))
        }
    }
}
