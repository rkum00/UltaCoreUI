//
//  UBTypographyLayout.swift
//
//
//  Created by Rakesh Kumar on 12/12/25.
//

import UIKit

/// Font and auxiliary information (line height multiple and paragraphyStyle) needed
/// to render text with the specified line height as per design
public struct UBTypographyLayout {
    /// Font to use (potentially scaled and considering Accessibility Bold Text)
    public let font: UIFont
    /// Line height multiple to use with this font (to achieve the desired line height)
    public let lineHeightMultiple: CGFloat
    
    /// Paragraph style with the correct line height multiple (to achieve the desired line height)
    public var paragraphStyle: NSParagraphStyle {
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineHeightMultiple = lineHeightMultiple
        return paragraphStyle
    }
}
