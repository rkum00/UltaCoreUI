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
public enum UBCardSize {
    case small
    case medium
    case large

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
    func getPadding() -> CGFloat {
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

public enum UBCardAxis {
    case horizontal
    case vertical
}

@available(iOS 13.0, *)
public enum UBCardType {
    case elevated
    case outlined
    case flat
    
    public var borderColor: Color {
        switch self {
        case .outlined: Color.gray.opacity(0.4)
        default: .clear
        }
    }
    
    public var shadowRadius: CGFloat {
        switch self {
        case .elevated: 4
        default: 0
        }
    }
}

@available(iOS 13.0, *)
public enum UBCardState: String, CaseIterable {
    case normal
    case selected
    case disabled
    
    func getBackgroundColor(theme: UBTheme = .current) -> Color {
        switch self {
        case .normal:
            return Color(UBTheme.applyBackgroundPrimaryColor(theme: theme))
        case .selected:
            return Color(UBTheme.applyBackgroundBaselineInverseColor(theme: theme))
        case .disabled:
            return Color(UBTheme.applyBackgroundTransparentColor(theme: theme))
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

public enum UBCardPaddingSide: String, CaseIterable {
    case top
    case bottom
    case left
    case right
    case allSides
}
