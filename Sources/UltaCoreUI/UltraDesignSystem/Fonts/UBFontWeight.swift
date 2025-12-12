//
//  UBFontWeight.swift
//
//
//  Created by Rakesh Kumar on 12/12/25.
//

import Foundation

/// The 7 font weights currently supported by our custom font, Nunito Sans
public enum UBFontWeight: CGFloat, CaseIterable {
    case ultralight = 100
    case light = 300
    case regular = 400
    case medium = 500
    case semibold = 600
    case bold = 700
    case heavy = 800
    case black = 900
}

extension UBFontWeight {
    /// Font weight name
    public var name: String {
        let value: String
        switch self {
        case .ultralight:
            value = "ExtraLight"
        case .light:
            value = "Light"
        case .regular:
            value = "Regular"
        case .medium:
            value = "Medium"
        case .semibold:
            value = "SemiBold"
        case .bold:
            value = "Bold"
        case .heavy:
            value = "ExtraBold"
        case .black:
            value = "Black"
        }
        return value
    }
}
