//
//  UBTheme.swift
//
//
//  Created by Rakesh Kumar on 03/12/25.
//

import SwiftUI

public enum UBTheme: String, CaseIterable {
    case theme1
    case theme2
    case theme3
}

public extension UBTheme {
    static var current: UBTheme {
        let theme: UBTheme = .theme1
        return theme
    }
    
    private static func getConfigFileName(theme: UBTheme = .current) -> String {
        switch theme {
        case .theme1:
            return "Theme1"
        case .theme2:
            return "Theme2"
        case .theme3:
            return "Theme3"
        }
    }
    
    static func getColorFor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundPrimary
        case .theme2:
            return Theme2.ubThemeColorForegroundPrimary
        case .theme3:
            return Theme3.ubThemeColorForegroundPrimary
        }
    }
    
    static func applyThemeColorForTitle(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundNeutralHigh
        case .theme2:
            return Theme2.ubThemeColorForegroundNeutralHigh
        case .theme3:
            return Theme3.ubThemeColorForegroundNeutralHigh
        }
    }
    
    static func applyThemeColorForSubTitleTitle(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundNeutralMedium
        case .theme2:
            return Theme2.ubThemeColorForegroundNeutralMedium
        case .theme3:
            return Theme3.ubThemeColorForegroundNeutralMedium
        }
    }
    
    static func applyThemeColorForBackground(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorBackgroundBaselineInverse
        case .theme2:
            return Theme2.ubThemeColorBackgroundBaselineInverse
        case .theme3:
            return Theme3.ubThemeColorBackgroundBaselineInverse
        }
    }
    
    static func applyWhiteBackgroundTheme(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorBackgroundBaseline
        case .theme2:
            return Theme2.ubThemeColorBackgroundBaseline
        case .theme3:
            return Theme3.ubThemeColorBackgroundBaseline
        }
    }
    
    static func applyNeutralHighColor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundNeutralHigh
        case .theme2:
            return Theme2.ubThemeColorForegroundNeutralHigh
        case .theme3:
            return Theme3.ubThemeColorForegroundNeutralHigh
        }
    }
    
    static func applyNeutralMediumColor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundNeutralMedium
        case .theme2:
            return Theme2.ubThemeColorForegroundNeutralMedium
        case .theme3:
            return Theme3.ubThemeColorForegroundNeutralMedium
        }
    }
    
    static func applyNeutralLowColor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundNeutralLow
        case .theme2:
            return Theme2.ubThemeColorForegroundNeutralLow
        case .theme3:
            return Theme3.ubThemeColorForegroundNeutralLow
        }
    }
    
    static func applyNeutralHighInverseColor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundNeutralHighInverse
        case .theme2:
            return Theme2.ubThemeColorForegroundNeutralHighInverse
        case .theme3:
            return Theme3.ubThemeColorForegroundNeutralHighInverse
        }
    }
    
    static func applyPrimaryColor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundPrimary
        case .theme2:
            return Theme2.ubThemeColorForegroundPrimary
        case .theme3:
            return Theme3.ubThemeColorForegroundPrimary
        }
    }
    
    static func applyOnPrimaryColor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundOnPrimary
        case .theme2:
            return Theme2.ubThemeColorForegroundOnPrimary
        case .theme3:
            return Theme3.ubThemeColorForegroundOnPrimary
        }
    }
    
    static func applyErrorColor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundError
        case .theme2:
            return Theme2.ubThemeColorForegroundError
        case .theme3:
            return Theme3.ubThemeColorForegroundError
        }
    }
    
    static func applyWarningColor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundWarning
        case .theme2:
            return Theme2.ubThemeColorForegroundWarning
        case .theme3:
            return Theme3.ubThemeColorForegroundWarning
        }
    }
    
    static func applyPositiveColor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundPositive
        case .theme2:
            return Theme2.ubThemeColorForegroundPositive
        case .theme3:
            return Theme3.ubThemeColorForegroundPositive
        }
    }
    
    static func applyInfoColor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundInfo
        case .theme2:
            return Theme2.ubThemeColorForegroundInfo
        case .theme3:
            return Theme3.ubThemeColorForegroundInfo
        }
    }
    
    static func applyDisabledColor(theme: UBTheme = .current) -> UIColor {
        switch theme {
        case .theme1:
            return Theme1.ubThemeColorForegroundDisabled
        case .theme2:
            return Theme2.ubThemeColorForegroundDisabled
        case .theme3:
            return Theme3.ubThemeColorForegroundDisabled
        }
    }
}
