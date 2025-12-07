//
//  UBCardContainerConstants.swift
//
//
//  Created by Rakesh Kumar on 05/12/25.
//

import UIKit
import SwiftUI

/// Represents the possible outline widths for a card component.
/// Used to specify small, medium, or large outline thickness.
public enum UBCardSize: String, CaseIterable {
    case small = "Small"
    case medium = "Medium"
    case large = "Large"

    /// Returns the width value associated with the current card size.
    ///
    /// - Returns: A `CGFloat` representing the width for the card size (`small`, `medium`, or `large`).
    /// - Note: The returned value is determined by the card size case and corresponds to a predefined global border width constant.
    func getWidth() -> CGFloat {
        switch self {
        case .small:
            return UBGlobal.sizeWidth1400
        case .medium:
            return UBGlobal.sizeWidth1750
        case .large:
            return UBGlobal.sizeWidth2000
        }
    }
    
    /// Returns the height value associated with the current card size.
    ///
    /// - Returns: A `CGFloat` representing the width for the card size (`small`, `medium`, or `large`).
    /// - Note: The returned value is determined by the card size case and corresponds to a predefined global border width constant.
    func getHeight() -> CGFloat {
        switch self {
        case .small:
            return UBGlobal.sizeHeight1400
        case .medium:
            return UBGlobal.sizeHeight1750
        case .large:
            return UBGlobal.sizeHeight2000
        }
    }
}


public enum UBCardStateLayerColor: String, CaseIterable {
    case primary
    case neutralHigh
    
    func getStateLayerColor(theme: UBTheme = .current) -> UIColor {
        switch self {
        case .primary:
            return UBTheme.applyPrimaryColor(theme: theme)
        case .neutralHigh:
            return UBTheme.applyNeutralHighColor(theme: theme)
        }
    }
}

public enum UBCardAlignment: String, CaseIterable {
    case middleLeft
    case topLeft
    case middleCenter
    case middleTop
}

public enum UBCardPaddingEdge {
    case top
    case bottom
    case leading
    case trailing
    case horizontal
    case vertical
    case all
}

public enum UBCardPadding: String, CaseIterable {
    case none
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    /// Returns the padding value as a `CGFloat` based on the current case of the enumeration.
    ///
    /// - Returns: A `CGFloat` representing the padding value for the corresponding case.
    /// - Note: The returned value is determined by mapping each case to a specific spacing constant from `UBGlobal`.
    var value: CGFloat {
        switch self {
        case.none:
            return UBGlobal.space0
        case .xSmall:
            return UBGlobal.space100
        case .small:
            return UBGlobal.space200
        case .medium:
            return UBGlobal.space300
        case .large:
            return UBGlobal.space400
        case .xLarge:
            return UBGlobal.space500
        }
    }
}

@available(iOS 13.0, *)
public extension UBCardPadding {
    static func insets(
        edge: UBCardPaddingEdge,
        size: UBCardPadding
    ) -> EdgeInsets {
        
        switch edge {
        case .all:
            return EdgeInsets(
                top: size.value,
                leading: size.value,
                bottom: size.value,
                trailing: size.value
            )
            
        case .horizontal:
            return EdgeInsets(
                top: 0,
                leading: size.value,
                bottom: 0,
                trailing: size.value
            )
            
        case .vertical:
            return EdgeInsets(
                top: size.value,
                leading: 0,
                bottom: size.value,
                trailing: 0
            )
            
        case .top:
            return EdgeInsets(top: size.value, leading: 0, bottom: 0, trailing: 0)
            
        case .bottom:
            return EdgeInsets(top: 0, leading: 0, bottom: size.value, trailing: 0)
            
        case .leading:
            return EdgeInsets(top: 0, leading: size.value, bottom: 0, trailing: 0)
            
        case .trailing:
            return EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: size.value)
        }
    }
}


public enum UBCardAxis {
    case horizontal
    case vertical
}

@available(iOS 13.0, *)
public enum UBCardType {
    case elevated
    case outlined
    case flat
    
    public var shadowRadius: CGFloat {
        switch self {
        case .elevated: 4
        default: 0
        }
    }
    
    public var lineWidth: CGFloat {
        switch self {
        case .elevated, .outlined: 1
        default: 0
        }
    }
}

@available(iOS 13.0, *)
public enum UBCardState: String, CaseIterable {
    case selectedBackgroundPrimary
    case selectedOutlinePrimary
    case normal
    case disabled
    
    func getBackgroundColor(theme: UBTheme = .current) -> Color {
        switch self {
        case .selectedBackgroundPrimary:
            return Color(UBTheme.applyBackgroundPrimaryColor(theme: theme))
        default:
            return Color(UBTheme.applyBackgroundTransparentColor(theme: theme))
        }
    }
    
    var opacityValue: Double {
        switch self {
        case .disabled: return 0.5
        default:
            return 1.0
        }
    }
}

public enum UBCardShape {
    case rounded
    case capsule
    case circle
    case sharp
    
    public var cornerRadius: CGFloat {
        switch self {
        case .rounded: 16
        default: 0
        }
    }
}

@available(iOS 13.0, *)
public enum UBCardOutlineColor: String, CaseIterable {
    case primary
    case neutralLow
    case neutralHigh
    
    /// Returns the corresponding `UIColor` for the current case based on the provided theme.
    ///
    /// - Parameter theme: The `UMATheme` to use for color selection. Defaults to `.current`.
    /// - Returns: A `UIColor` representing the color for the current case and theme.
   
    func getColor(theme: UBTheme = .current) -> Color {
        switch self {
        case .neutralLow:
            return Color(UBTheme.applyOutlineNeutralLowColor(theme: theme))
        case .primary:
            return Color(UBTheme.applyOutlinePrimaryColor(theme: theme))
        case .neutralHigh:
            return Color(UBTheme.applyOutlineNeutralHighColor(theme: theme))
        }
    }
}
