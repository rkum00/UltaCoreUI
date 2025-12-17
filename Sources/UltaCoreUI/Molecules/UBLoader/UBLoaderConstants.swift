//
//  UBLoaderConstants.swift
//
//
//  Created by Rakesh Kumar on 17/12/25.
//

import Foundation
import SwiftUI

/// This enum defines the colors available for the loader component.
public enum UBLoaderColor: String, CaseIterable {
    case primary
    case inverse
    
    ///  This method returns the color of the loader based on the selected theme and color.
    /// - Parameter theme: The theme of the loader. It is used to set color based on the selected theme.
    /// - Returns: The color of the loader based on the selected theme and color.
    @available(iOS 13.0, *)
    func getIndicatorColor(theme: UBTheme) -> Color {
        switch self {
        case .primary:
            return Color(UBTheme.applyPrimaryColor(theme: theme))
        case .inverse:
            return Color(UBTheme.applyNeutralHighInverseColor(theme: theme))
        }
    }
    
    ///  This method returns the track color of the loader based on the selected color.
    /// - Returns: The track color of the loader based on the selected color.
    @available(iOS 13.0, *)
    func getTrackColor() -> Color {
        switch self {
        case .primary:
            return Color(UBGlobal.colorGeneralBlackA10)
        case .inverse:
            return Color(UBGlobal.colorGeneralWhiteA40)
        }
    }
    
    ///  This method returns the text color of the label based on the selected color.
    /// - Returns: The text color of the label based on the selected color.
    func getTextColor() -> TextColorType {
        switch self {
        case .primary:
            return .neutralHigh
        case .inverse:
            return .neutralHighInverse
        }
    }
}

/// This enum defines the sizes available for the loader component.
public enum UBLoaderSize: String, CaseIterable {
    case xSmall
    case small
    case medium
    case large
    case xLarge
    
    /// This method returns the width of the loader based on the selected size.
    /// - Returns: The width of the loader based on the selected size.
    func getWidth() -> CGFloat {
        switch self {
        case .xSmall:
            return UBGlobal.sizeWidth200
        case .small:
            return UBGlobal.sizeWidth400
        case .medium:
            return UBGlobal.sizeWidth600
        case .large:
            return UBGlobal.sizeWidth800
        case .xLarge:
            return UBGlobal.sizeWidth1000
        }
    }
    
    ///  This method returns the height of the loader based on the selected size.
    /// - Returns: The height of the loader based on the selected size.
    func getHeight() -> CGFloat {
        switch self {
        case .xSmall:
            return UBGlobal.sizeHeight200
        case .small:
            return UBGlobal.sizeHeight400
        case .medium:
            return UBGlobal.sizeHeight600
        case .large:
            return UBGlobal.sizeHeight800
        case .xLarge:
            return UBGlobal.sizeHeight1000
        }
    }
    
    ///  This method returns the border width of the loader based on the selected size.
    /// - Returns: The border width of the loader based on the selected size.
    func getBorderWidth() -> CGFloat {
        switch self {
        case .xSmall:
            return UBGlobal.borderWidth150
        case .small:
            return UBGlobal.borderWidth250
        case .medium:
            return UBGlobal.borderWidth350
        case .large:
            return UBGlobal.borderWidth400
        case .xLarge:
            return UBGlobal.borderWidth300 * UBGlobal.borderWidth350
        }
    }
    
    /// This method returns the text size
    func getTextSize() -> TextFontSize {
        switch self {
        case .xSmall:
            return .small
        case .small:
            return .medium
        case .medium, .large, .xLarge:
            return .large
        }
    }
    
    /// This method returns the spacing between the loader and label
    func getLabelSpacing() -> CGFloat {
        switch self {
        case .xSmall, .small:
            return UBGlobal.space200
        case .medium, .large, .xLarge:
            return UBGlobal.space300
        }
    }
}
