//
//  UBConstants.swift
//
//
//  Created by Rakesh Kumar on 03/12/25.
//

import Foundation
import UIKit
import SwiftUI


/// These all the color types are supported by Text component
public enum TextColorType: CaseIterable {
    case neutralHigh
    case neutralMedium
    case neutralLow
    case neutralHighInverse
    case primary
    case onPrimary
    case muted
    case error
    case warning
    case positive
    case info

    /// Return the UIColor based in the theme for the selected enum value
    public func getColor(theme: UBTheme) -> UIColor {
        switch self {
        case .neutralHigh:
            return UBTheme.applyNeutralHighColor(theme: theme)
        case .neutralMedium:
            return UBTheme.applyNeutralMediumColor(theme: theme)
        case .neutralLow:
            return UBTheme.applyNeutralLowColor(theme: theme)
        case .neutralHighInverse:
            return UBTheme.applyNeutralHighInverseColor(theme: theme)
        case .primary:
            return UBTheme.applyPrimaryColor(theme: theme)
        case .onPrimary:
            return UBTheme.applyOnPrimaryColor(theme: theme)
        case .error:
            return UBTheme.applyErrorColor(theme: theme)
        case .warning:
            return UBTheme.applyWarningColor(theme: theme)
        case .positive:
            return UBTheme.applyPositiveColor(theme: theme)
        case .info:
            return UBTheme.applyInfoColor(theme: theme)
        case .muted:
            return UBTheme.applyDisabledColor(theme: theme)
        }
    }
    
    /// Returns the foreground color for text based on the theme for the selected enum value
    /// - Parameter theme: Theme of the Banner App
    /// - Returns: Returns a Color for SwiftUI
    @available(iOS 13.0, *)
    public func getForegroundColor(theme: UBTheme) -> Color {
        switch self {
        case .neutralHigh:
            return Color(UBTheme.applyNeutralHighColor(theme: theme))
        case .neutralMedium:
            return Color(UBTheme.applyNeutralMediumColor(theme: theme))
        case .neutralLow:
            return Color(UBTheme.applyNeutralLowColor(theme: theme))
        case .neutralHighInverse:
            return Color(UBTheme.applyNeutralHighInverseColor(theme: theme))
        case .primary:
            return Color(UBTheme.applyPrimaryColor(theme: theme))
        case .onPrimary:
            return Color(UBTheme.applyOnPrimaryColor(theme: theme))
        case .error:
            return Color(UBTheme.applyErrorColor(theme: theme))
        case .warning:
            return Color(UBTheme.applyWarningColor(theme: theme))
        case .positive:
            return Color(UBTheme.applyPositiveColor(theme: theme))
        case .info:
            return Color(UBTheme.applyInfoColor(theme: theme))
        case .muted:
            return Color(UBTheme.applyDisabledColor(theme: theme))
        }
    }
    
    /// Returns the background color for text based on the theme for the selected enum value
    /// - Parameter theme: Theme of the Banner App
    /// - Returns: Returns a Color for SwiftUI
    @available(iOS 13.0, *)
    public func getBackgroundColor(theme: UBTheme) -> Color {
        switch self {
        case .neutralHighInverse:
            return Color(UBTheme.applyNeutralHighColor(theme: theme))
        case .onPrimary:
            return Color(UBTheme.applyPrimaryColor(theme: theme))
        default:
            return Color(.clear)
        }
    }
}

public enum UBTextFontFamily: String, CaseIterable {
    case nunitoSans = "Nunito Sans"
}

/// These are the different font sizes options to select for Text, these fonts are scalable dynamically based on the device font sizes
public enum TextFontSize: CaseIterable {
    case xsmall
    case small
    case medium
    case large
    case xlarge
    case xxlarge
    
    func getFontSize(fontFamily: UBTextFontFamily) -> CGFloat {
        switch fontFamily {
        case .nunitoSans:
            getNunitoSansFontSize()
        }
    }
    
    func getNunitoSansFontSize() -> CGFloat {
        switch self {
        case .xsmall:
            return UBGlobal.fontSize50
        case .small:
            return UBGlobal.fontSize100
        case .medium:
            return UBGlobal.fontSize200
        case .large:
            return UBGlobal.fontSize300
        case .xlarge:
            return UBGlobal.fontSize400
        case .xxlarge:
            return UBGlobal.fontSize500
        }
    }
}

/// These are the different line heights available for text component
public enum LineHeight: CaseIterable {
    case small
    case medium
    case large

    func getLineHeight(fontFamily: UBTextFontFamily) -> CGFloat {
        switch fontFamily {
        case .nunitoSans:
            getNunitoSansLineHeight()
        }
    }
    
    func getNunitoSansLineHeight() -> CGFloat {
        switch self {
        case .small:
            return UBGlobal.fontLineHeight50
        case .medium:
            return UBGlobal.fontLineHeight100
        case .large:
            return UBGlobal.fontLineHeight200
        }
    }
    
    func getPalmerLakeLineHeight() -> CGFloat {
        return UBGlobal.fontLineHeight25
    }
}


/// Fonts weights for Text component
public enum TextFontWeight: Int, CaseIterable {
    case regular
    case semiBold
    case bold
    case medium
    
    public func getFontWeight(for family: String) -> String {
        switch self {
        case .regular:
            return getFontName(for: family, weight:UBGlobal.fontWeight400)
        case .semiBold:
            return getFontName(for: family, weight:UBGlobal.fontWeight600)
        case .bold:
            return getFontName(for: family, weight:UBGlobal.fontWeight700)
        case .medium:
            return getFontName(for: family, weight:UBGlobal.fontWeight500)
        }
    }
    
    public func getFontName(for family: String, weight: Int) -> String {
        let fontFamily = family.replacingOccurrences(of: " ", with: "")
        
        if weight == UBGlobal.fontWeight400 {
            return fontFamily + "-" + "Regular"
        } else if weight == UBGlobal.fontWeight600 {
            return fontFamily + "-" + "SemiBold"
        } else if weight == UBGlobal.fontWeight700 {
            return fontFamily + "-" + "Bold"
        } else if weight == UBGlobal.fontWeight500 {
            return fontFamily + "-" + "Medium"
        }
        return ""
    }
}

// Text alignemnts: start(left), center and end(right)
public enum TextAlign: CaseIterable {
    case start
    case center
    case end
    
    /// Sets the text alignment of the text string.
    /// - Returns: Returns the NSTextAlignment for UIKIT.
    func getNSTextAlignment() -> NSTextAlignment {
        switch self {
        case .start:
            return .left
        case .center:
            return .center
        case .end:
            return .right
        }
    }
    
    /// Sets the text alignment of the text string.
    /// - Returns: Returns the Alignment for SwiftUI.
    @available(iOS 13.0, *)
    func getFrameAlignment() -> Alignment {
        switch self {
        case .start:
            return .leading
        case .center:
            return .center
        case .end:
            return .trailing
        }
    }
    
    /// Sets the text alignment of the text string.
    /// - Returns: Returns the Alignment for SwiftUI.
    @available(iOS 13.0, *)
    func getTextAlignment() -> TextAlignment {
        switch self {
        case .start:
            return .leading
        case .center:
            return .center
        case .end:
            return .trailing
        }
    }
}

// These are the different text decorations supported by Text component
public enum TextDecoration: CaseIterable {
    case none
    case strikethrough
    case underline
    case italic
}

/// These all the color types are supported by Link component
public enum LinkColorType: CaseIterable {
    case neutralHigh
    case neutralMedium
    case neutralLow
    case neutralHighInverse
    case primary
    case disabled
    
    func getColor(theme: UBTheme) -> UIColor {
        switch self {
        case .neutralHigh:
            return UBTheme.applyNeutralHighColor(theme: theme)
        case .neutralMedium:
            return UBTheme.applyNeutralMediumColor(theme: theme)
        case .neutralLow:
            return UBTheme.applyNeutralLowColor(theme: theme)
        case .neutralHighInverse:
            return UBTheme.applyNeutralHighInverseColor(theme: theme)
        case .primary:
            return UBTheme.applyPrimaryColor(theme: theme)
        case .disabled:
            return UBTheme.applyDisabledColor(theme: theme)
        }
    }
    
    @available(iOS 13.0, *)
    func getForegroundColor(theme: UBTheme) -> Color {
        switch self {
        case .neutralHigh:
            return Color(UBTheme.applyNeutralHighColor(theme: theme))
        case .neutralMedium:
            return Color(UBTheme.applyNeutralMediumColor(theme: theme))
        case .neutralLow:
            return Color(UBTheme.applyNeutralLowColor(theme: theme))
        case .neutralHighInverse:
            return Color(UBTheme.applyNeutralHighInverseColor(theme: theme))
        case .primary:
            return Color(UBTheme.applyPrimaryColor(theme: theme))
        case .disabled:
            return Color(UBTheme.applyDisabledColor(theme: theme))
        }
    }
}

/// This Intent used for showing the type of inline error and selecting the color and image for the alert
public enum Intent: CaseIterable {
    /// Displys text and respective image in blue color
    case info
    /// Displys text and respective image in green color
    case positive
    /// Displys text and respective image in yellow color
    case warning
    /// Displys text and respective image in red color
    case error
    
    /// Returns for image name for respective Intent
    func getImageName() -> String {
        switch self {
        case .info:
            return "info_filled_16"
        case .positive:
            return "checkmark_circle_filled_16"
        case .warning:
            return "warning_filled_16"
        case .error:
            return "error_filled_16"
        }
    }
    
    /// Returns the color for image to be used in the Inline alert
    func getColor(theme: UBTheme = .current) -> UIColor {
        switch self {
        case .info:
            return UBTheme.applyInfoColor(theme: theme)
        case .positive:
            return UBTheme.applyPositiveColor(theme: theme)
        case .warning:
            return UBTheme.applyWarningColor(theme: theme)
        case .error:
            return UBTheme.applyErrorColor(theme: theme)
        }
    }
    
    /// Returns the color type to be sent to UBText Component for diplaying Inline alert text
    func getTextColorType() -> TextColorType {
        switch self {
        case .info:
            return .info
        case .positive:
            return .positive
        case .warning:
            return .warning
        case .error:
            return .error
        }
    }
}
