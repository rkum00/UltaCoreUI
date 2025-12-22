//
//  UBButtonConstants.swift
//
//
//  Created by Rakesh Kumar on 22/12/25.
//

import Foundation
import SwiftUI

//MARK: - Slot

/// Slot to add leading/trailing image in UB components
public struct Slot {
    // To add leading/trailing image
    public var imageName: String?
    
    public init(imageName: String?) {
        self.imageName = imageName
    }
}

//MARK: - UBButton Constants

// To add the Button background and text color
public enum UBButtonColor {
    // Primary button color
    case primary
    // Neutral button color
    case neutral
}

// This is used for selecting the button variant
public enum ButtonVariant {
    /// Button with filled background
    case filled
    /// Button with outlined background
    case outlined
    /// Button with outlined inverse background
    case outlinedInverse
    /// Button with outlined background and primary icon color
    case subtle
    /// Button with transparent background
    case transparent
}

// For customizing the button width and height
public enum ButtonSize: String, CaseIterable {
    case small
    case medium
    case large
    
    // Provides the default button height
    func getButtonHeight() -> CGFloat {
        switch self {
        case .small:
            return UBGlobal.sizeHeightMinH600
        case .medium:
            return UBGlobal.sizeHeightMinH800
        case .large:
            return UBGlobal.sizeHeightMinH1000
        }
    }
    
    // Provides the default button width when fullWidth parameter is set to false
    func getButtonWidth() -> CGFloat {
        switch self {
        case .small:
            return UBGlobal.sizeWidthMinW1000
        case .medium, .large:
            return UBGlobal.sizeWidthMinW1100
        }
    }
    
    @available(iOS 13.0, *)
    func getContentInsets() -> EdgeInsets {
        switch self {
        case .small:
            return EdgeInsets(top: UBGlobal.space50, leading: UBGlobal.space300, bottom: UBGlobal.space50, trailing: UBGlobal.space300)
        case .medium:
            return EdgeInsets(top: UBGlobal.space200, leading: UBGlobal.space500, bottom: UBGlobal.space200, trailing: UBGlobal.space500)
        case .large:
            return EdgeInsets(top: UBGlobal.space300, leading: UBGlobal.space500, bottom: UBGlobal.space300, trailing: UBGlobal.space500)
        }
    }
    
    @available(iOS 13.0, *)
    func getVerticalContentInsets() -> EdgeInsets {
        switch self {
        case .small:
            return EdgeInsets(top: UBGlobal.space50, leading: 0, bottom: UBGlobal.space50, trailing: 0)
        case .medium:
            return EdgeInsets(top: UBGlobal.space200, leading: 0, bottom: UBGlobal.space200, trailing: 0)
        case .large:
            return EdgeInsets(top: UBGlobal.space300, leading: 0, bottom: UBGlobal.space300, trailing: 0)
        }
    }
    
    @available(iOS 13.0, *)
    func getHorizontalContentInsets() -> EdgeInsets {
        switch self {
        case .small:
            return EdgeInsets(top: 0, leading: UBGlobal.space300, bottom: 00, trailing: UBGlobal.space300)
        case .medium:
            return EdgeInsets(top: 0, leading: UBGlobal.space500, bottom: 0, trailing: UBGlobal.space500)
        case .large:
            return EdgeInsets(top: 0, leading: UBGlobal.space500, bottom: 0, trailing: UBGlobal.space500)
        }
    }
    
    func getImagePadding() -> CGFloat {
        switch self {
        case .small:
            return UBGlobal.space100
        case .medium, .large:
            return UBGlobal.space200
        }
    }
}

/// Struct to configure UBButton accessibility
public struct UBButtonAccessibilityInfo {
    var ubButtonAccessibilityHint: String?
    var ubButtonAccessibilityLabel: String?
    var ubButtonAccessibilityTraits: UIAccessibilityTraits?
    var ubButtonIsAccessibilityElement: Bool?
    var ubButtonAccessibilityIdentifier: String?
    
    public init(ubButtonAccessibilityHint: String? = nil,
                ubButtonAccessibilityLabel: String? = nil,
                ubButtonAccessibilityTraits: UIAccessibilityTraits? = nil,
                ubButtonIsAccessibilityElement: Bool? = nil,
                ubButtonAccessibilityIdentifier: String? = nil) {
        self.ubButtonAccessibilityHint = ubButtonAccessibilityHint
        self.ubButtonAccessibilityLabel = ubButtonAccessibilityLabel
        self.ubButtonAccessibilityTraits = ubButtonAccessibilityTraits
        self.ubButtonIsAccessibilityElement = ubButtonIsAccessibilityElement
        self.ubButtonAccessibilityIdentifier = ubButtonAccessibilityIdentifier
    }
}

//MARK: - UBIconButtonView Constants

public enum UBIconButtonVariants: String, CaseIterable {
    case filledPrimary
    case outlinedPrimary
    case subtlePrimary
    case transparentPrimary
    case elevatedPrimary
    
    case filledNeutral
    case outlinedNeutral
    case transparentNeutral
    case elevatedNeutral
    
    case transparentInverseNeutral
}

@available(iOS 13.0, *)
public struct ShadowStruct {
    
    let color: Color
    let radius: CGFloat
    let x: CGFloat
    let y: CGFloat
    
    public init(color: Color, radius: CGFloat, x: CGFloat, y: CGFloat) {
        self.color = color
        self.radius = radius
        self.x = x
        self.y = y
    }
}

//MARK: - UBButton Constants

/// Different variants for UBButton
public enum UBButtonVariants: String, CaseIterable {
    // Primary variants
    case filledPrimary
    case outlinedPrimary
    case subtlePrimary
    case transparentPrimary
    
    // Neutral variants
    case filledNeutral
    case outlinedNeutral
    case transparentNeutral
    case outlinedInverseNeutral
    
    public func getForegroundColor(theme: UBTheme, disabled: Bool) -> TextColorType {
        switch self {
        case .filledPrimary:
            return .onPrimary
        case .outlinedPrimary:
            return disabled ? .muted : .primary
        case .subtlePrimary:
            return disabled ? .neutralHighInverse : .primary
        case .transparentPrimary:
            return disabled ? .muted : .primary
        case .filledNeutral:
            return disabled ? .neutralHighInverse : .neutralHigh
        case .outlinedNeutral:
            return disabled ? .muted : .neutralHigh
        case .transparentNeutral:
            return disabled ? .muted : .neutralHigh
        case .outlinedInverseNeutral:
            return disabled ? .muted : .neutralHighInverse
        }
    }
    
    @available(iOS 13.0, *)
    public func getBackgroundColor(theme: UBTheme, disabled: Bool) -> Color {
        switch self {
        case .filledPrimary:
            return disabled ? Color(UBTheme.applyBackgroundDisabledColor(theme: theme)) : Color(UBTheme.applyBackgroundPrimaryColor(theme: theme))
        case .outlinedPrimary:
            return Color(UBTheme.applyBackgroundTransparentColor(theme: theme))
        case .subtlePrimary:
            return disabled ? Color(UBTheme.applyBackgroundDisabledColor(theme: theme)) : Color(UBTheme.applyBackgroundBaselineColor(theme: theme))
        case .transparentPrimary:
            return Color(UBTheme.applyBackgroundTransparentColor(theme: theme))
        case .filledNeutral:
            return disabled ? Color(UBTheme.applyBackgroundDisabledColor(theme: theme)) : Color(UBTheme.applyBackgroundBaselineColor(theme: theme))
        case .outlinedNeutral:
            return Color(UBTheme.applyBackgroundTransparentColor(theme: theme))
        case .transparentNeutral:
            return Color(UBTheme.applyBackgroundTransparentColor(theme: theme))
        case .outlinedInverseNeutral:
            return Color(UBTheme.applyBackgroundTransparentColor(theme: theme))
        }
    }
    
    @available(iOS 13.0, *)
    public func getPressedBackgroundColor(theme: UBTheme) -> Color {
        switch self {
        case .filledPrimary:
            return Color(UBTheme.applyBackgroundPrimaryColor(theme: theme))
                .opacity(Double(UBTheme.getPressedOpacity(theme: theme)))
        case .outlinedPrimary:
            return Color(UBTheme.applyPrimaryColor(theme: theme))
                .opacity(Double(UBTheme.getPressedOpacity(theme: theme)))
        case .subtlePrimary:
            return Color(UBTheme.applyPrimaryColor(theme: theme))
                .opacity(Double(UBTheme.getPressedOpacity(theme: theme)))
        case .transparentPrimary:
            return Color(UBTheme.applyPrimaryColor(theme: theme))
                .opacity(Double(UBTheme.getPressedOpacity(theme: theme)))
        case .filledNeutral:
            return Color(UBTheme.applyNeutralHighColor(theme: theme))
                .opacity(Double(UBTheme.getPressedOpacity(theme: theme)))
        case .outlinedNeutral:
            return Color(UBTheme.applyNeutralHighColor(theme: theme))
                .opacity(Double(UBTheme.getPressedOpacity(theme: theme)))
        case .transparentNeutral:
            return Color(UBTheme.applyNeutralHighColor(theme: theme))
                .opacity(Double(UBTheme.getPressedOpacity(theme: theme)))
        case .outlinedInverseNeutral:
            return Color(UBTheme.applyNeutralHighInverseColor(theme: theme))
                .opacity(Double(UBTheme.getPressedOpacity(theme: theme)))
        }
    }
    
    @available(iOS 13.0, *)
    public func getBorderColor(theme: UBTheme, disabled: Bool) -> Color {
        switch self {
        case .filledPrimary:
            return Color.clear
        case .outlinedPrimary:
            return disabled ? Color(UBTheme.applyOutlineDisabledColor(theme: theme)) : Color(UBTheme.applyPrimaryColor(theme: theme))
        case .subtlePrimary:
            return disabled ? Color(UBTheme.applyOutlineDisabledColor(theme: theme)) : Color(UBTheme.applyOutlineNeutralLowColor(theme: theme))
        case .transparentPrimary:
            return Color.clear
        case .filledNeutral:
            return disabled ? Color.clear : Color(UBTheme.applyOutlineNeutralLowColor(theme: theme))
        case .outlinedNeutral:
            return disabled ? Color(UBTheme.applyOutlineDisabledColor(theme: theme)) : Color(UBTheme.applyOutlineNeutralHighColor(theme: theme))
        case .transparentNeutral:
            return Color.clear
        case .outlinedInverseNeutral:
            return Color(UBTheme.applyOutlineNeutralHighInverseColor(theme: theme))
        }
    }
}
