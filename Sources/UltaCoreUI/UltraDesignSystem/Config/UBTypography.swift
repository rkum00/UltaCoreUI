//
//  UBTypography.swift
//
//
//  Created by Rakesh Kumar on 12/12/25.
//

import UIKit

/// Represents a font as it appears in design documents
/// (This should replace `UBFontConfiguration` because it captures additional information)
public struct UBTypography {
    public let fontFamilyName: String
    public let fontWeight: UBFontWeight
    public let fontSize: CGFloat
    public let lineHeight: CGFloat
    
    /// The text style (e.g. `.body` or `.largeTitle`) that this font most closely represents.
    /// Used for Dynamic Type scaling of the font
    /// TODO: define the appropriate textStyle for every type face in `UBFontFamily`
    public let textStyle: UIFont.TextStyle
    /// Whether this font should be scaled through Dynamic Type
    public let isDynamic: Bool
    
    public init(
        fontFamilyName: String = "NunitoSans",
        fontWeight: UBFontWeight,
        fontSize: CGFloat,
        lineHeight: CGFloat,
        textStyle: UIFont.TextStyle = .body,
        isDynamic: Bool = false
    ) {
        self.fontFamilyName = fontFamilyName
        self.fontWeight = fontWeight
        self.fontSize = fontSize
        self.lineHeight = lineHeight
        self.textStyle = textStyle
        self.isDynamic = isDynamic
    }
}

extension UBTypography {
    /// Generates the font and auxilliary layout information needed to render the Typography
    /// - Parameters:
    ///   - maximumPointSize: (optional) maximum point size for Dynamic Type, default = nil, means no maximum
    ///   - traitCollection: trait collection to apply (looking for preferredContentSizeCategory and legibilityWeight)
    /// - Returns: Font, line height multiple, and paragraph style to render the Typography
    public func generateLayout(
        maximumPointSize: CGFloat? = nil,
        compatibleWith traitCollection: UITraitCollection?
    ) -> UBTypographyLayout {
        var font = generateFixedFont(compatibleWith: traitCollection)
        
        let lineHeightMultiple = lineHeight / font.lineHeight
        
        if isDynamic {
            let metrics = UIFontMetrics(forTextStyle: textStyle)
            
            if let maximumPointSize = maximumPointSize {
                font = metrics.scaledFont(
                    for: font,
                    maximumPointSize: maximumPointSize,
                    compatibleWith: traitCollection
                )
            } else {
                font = metrics.scaledFont(
                    for: font,
                    compatibleWith: traitCollection
                )
            }
        }
        
        return UBTypographyLayout(font: font, lineHeightMultiple: lineHeightMultiple)
    }
}

private extension UBTypography {
    func generateFixedFont(compatibleWith traitCollection: UITraitCollection?) -> UIFont {
        let name = fontName(for: fontWeight, compatibleWith: traitCollection)
        if let font = UIFont(name: name, size: fontSize) {
            return font
        } else {
            let actualWeight = weight(for: fontWeight, compatibleWith: traitCollection)
            return UIFont(name: "NunitoSans-\(actualWeight.name)", size: fontSize) ?? .systemFont(ofSize: fontSize)
        }
    }
    
    /// Generates a font name that can be used to initialize a `UIFont`.
    /// - Parameter weight: desired font weight
    /// - Parameter traitCollection: trait collection to consider (`UITraitCollection.legibilityWeight`).
    /// If `nil` then `UIAccessibility.isBoldTextEnabled` will be considered instead
    /// - Returns: The font name formulated from `familyName` and `weight`
    func fontName(for weight: UBFontWeight, compatibleWith traitCollection: UITraitCollection?) -> String {
        let actualWeight = self.weight(for: weight, compatibleWith: traitCollection)
        return "\(fontFamilyName)-\(actualWeight.name)"
    }
    
    /// Calculates the font weight to use based on the trait collection passed
    /// - Parameter weight: desired font weight
    /// - Parameter traitCollection: trait collection to consider (`UITraitCollection.legibilityWeight`).
    /// If `nil` then `UIAccessibility.isBoldTextEnabled` will be considered instead
    /// - Returns: the font weight to use
    func weight(for weight: UBFontWeight, compatibleWith traitCollection: UITraitCollection?) -> UBFontWeight {
        let useBoldFont: Bool
        if let traitCollection = traitCollection {
            if #available(iOS 13.0, *) {
                useBoldFont = (traitCollection.legibilityWeight == .bold)
            } else {
                // Fallback on earlier versions
                useBoldFont = UIAccessibility.isBoldTextEnabled
            }
        } else {
            useBoldFont = UIAccessibility.isBoldTextEnabled
        }
        guard useBoldFont else { return weight }
        
        // move to a heavier font weight
        let boldWeight: UBFontWeight
        switch weight {
        case .ultralight:
            boldWeight = .light
        case .light:
            boldWeight = .regular
        case .regular:
            boldWeight = .semibold
        case .medium:
            boldWeight = .semibold
        case .semibold:
            boldWeight = .bold
        case .bold:
            boldWeight = .heavy
        case .heavy, .black:
            boldWeight = .black
        }
        return boldWeight
    }
}
