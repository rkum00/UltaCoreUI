//
//  UltaTextViewOptions.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 03/12/25.
//

import Foundation
import UltaCoreUI
import SwiftUI

public enum UltaTextViewOptions: String, CaseIterable {
    case topDescription = "Text displays a string and is used to show text throughout the app, including standalone paragraphs and within other components. Color, font weight, font size, alignment, line through, and max lines can be customized. See TextTokens for color, size, and weight options."
    case color = "All color options"
    case weight = "All weight options"
    case size = "All size options"
    case alignment = "All alignment options"
    case textDecoration = "All Font Style and Text decoration options"
    case maxLines = "Max lines option"
    case lineHeightOptions = "All line height options"
    case textVariations = "Link Support"
    case updateTextOption = "Update Text Option"
    case substringStyles = "Substring styles"
    
    func numberOfRows() -> Int {
        switch self {
        case .topDescription:
            return 0
        case .color:
            return TextColorType.allCases.count
        case .weight:
            return TextFontWeight.allCases.count
        case .size:
            return TextFontSize.allCases.count
        case .alignment:
            return TextAlign.allCases.count
        case .lineHeightOptions, .textVariations:
            return 3
        case .textDecoration:
            return 4
        case .maxLines, .updateTextOption:
            return 1
        case .substringStyles:
            return 2
        }
    }
    
    func getColorComponent(row: Int, theme: UBTheme) -> UBText {
        switch TextColorType.allCases[row] {
        case .neutralHigh:
            return UBText(theme: theme, textAttribute: TextAttributes(text: "NeutralHigh"))
        case .neutralMedium:
            return UBText(theme: theme, textAttribute: TextAttributes(text: "NeutralMedium", color: .neutralMedium))
        case .neutralLow:
            return UBText(theme: theme, textAttribute: TextAttributes(text: "NeutralLow", color: .neutralLow))
        case .neutralHighInverse:
            return UBText(theme: theme, textAttribute: TextAttributes(text: "NeutralHighInverse", color: .neutralHighInverse))
        case .primary:
            return UBText(theme: theme, textAttribute: TextAttributes(text: "Primary", color: .primary))
        case .onPrimary:
            return UBText(theme: theme, textAttribute: TextAttributes(text: "OnPrimary", color: .onPrimary))
        case .error:
            return UBText(theme: theme, textAttribute: TextAttributes(text: "Error", color: .error))
        case .warning:
            return UBText(theme: theme, textAttribute: TextAttributes(text: "Warning", color: .warning))
        case .positive:
            return UBText(theme: theme, textAttribute: TextAttributes(text: "Positive", color: .positive))
        case .info:
            return UBText(theme: theme, textAttribute: TextAttributes(text: "Info", color: .info))
        }
    }
    
    func getBackgroundColor(row: Int, theme: UBTheme) -> Color {
        switch TextColorType.allCases[row] {
        case .neutralHighInverse:
            return Color(UBTheme.applyBackgroundBaselineInverseColor(theme: theme))
        case .onPrimary:
            return Color(UBTheme.applyBackgroundPrimaryColor(theme: theme))
        default:
            return Color(UBTheme.applyBackgroundBaselineColor(theme: theme))
        }
    }
    
    func getWeightComponent(row: Int) -> UBText {
        switch TextFontWeight.allCases[row] {
        case .regular:
            return UBText(textAttribute: TextAttributes(text: "Regular"))
        case .semiBold:
            return UBText(textAttribute: TextAttributes(text: "SemiBold", fontWeight: .semiBold))
        case .bold:
            return UBText(textAttribute: TextAttributes(text: "Bold", fontWeight: .bold))
        case .medium:
            return UBText(textAttribute: TextAttributes(text: "Medium", fontWeight: .medium))
        }
    }
    
    func getStyledSubstringComponent(row: Int) -> UBText {
        if row == 0 {
            return UBText(
                textAttribute: TextAttributes(text: "Weight: Bold, Regular, SemiBold, Medium."),
                substringTextAttributes: [
                    TextAttributes(text: "Bold", fontWeight: .bold),
                    TextAttributes(text: "Regular"),
                    TextAttributes(text: "SemiBold", fontWeight: .semiBold),
                    TextAttributes(text: "Medium", fontWeight: .medium),
                ]
            )
        } else {
            return UBText(
                textAttribute: TextAttributes(text: "Decorations: StrikeThrough, Underline, Italic, None"),
                substringTextAttributes: [
                    TextAttributes(text: "StrikeThrough", textDecoration: .strikethrough),
                    TextAttributes(text: "Underline", textDecoration: .underline),
                    TextAttributes(text: "Italic", textDecoration: .italic),
                    TextAttributes(text: "None", textDecoration: .none)
                ]
            )
        }
    }
    
    func getSizeComponent(row: Int) -> UBText {
        switch TextFontSize.allCases[row] {
        case .xsmall:
            return UBText(textAttribute: TextAttributes(text: "XSmall", fontSize: .xsmall))
        case .small:
            return UBText(textAttribute: TextAttributes(text: "Small", fontSize: .small))
        case .medium:
            return UBText(textAttribute: TextAttributes(text: "Medium", fontSize: .medium))
        case .large:
            return UBText(textAttribute: TextAttributes(text: "Large", fontSize: .large))
        case .xlarge:
            return UBText(textAttribute: TextAttributes(text: "XLarge", fontSize: .xlarge))
        case .xxlarge:
            return UBText(textAttribute: TextAttributes(text: "XXLarge", fontSize: .xxlarge))
        }
    }
        
    func getAlignmentComponent(row: Int) -> UBText {
        switch TextAlign.allCases[row] {
        case .start:
            return UBText(textAttribute: TextAttributes(text: "UBText supports left alignment"))
        case .center:
            return UBText(textAttribute: TextAttributes(text: "UBText supports center alignment", textAlign: .center))
        case .end:
            return UBText(textAttribute: TextAttributes(text: "UBText supports right alignment", textAlign: .end))
        }
    }
    
    func getLineThroughComponent(row: Int) -> UBText {
        switch TextDecoration.allCases[row] {
        case .none:
            return UBText(textAttribute: TextAttributes(text: "None", textDecoration: .none))
        case .strikethrough:
            return UBText(textAttribute: TextAttributes(text: "StrikeThrough", textDecoration: .strikethrough))
        case .underline:
            return UBText(textAttribute: TextAttributes(text: "Underline", textDecoration: .underline))
        case .italic:
            return UBText(textAttribute: TextAttributes(text: "Italic", textDecoration: .italic))
        }
        
    }
    
    func getLineHeightComponent(row: Int) -> UBText {
        let sampleString = "Style Dictionary is a build system that allows you to define styles once, in a way for any platform or language to consume \n"
        switch LineHeight.allCases[row] {
        case .small:
            return UBText(textAttribute: TextAttributes(text: sampleString, lineHeight: .small))
        case .medium:
            return UBText(textAttribute: TextAttributes(text: sampleString, lineHeight: .medium))
        case .large:
            return UBText(textAttribute: TextAttributes(text: sampleString, lineHeight: .large))
        }
    }
    
    func getMaxLinesComponent() -> UBText {
        return UBText(textAttribute: TextAttributes(text: "Text can have a max line number. Overflow text may not show in one line", maxlines: 1))
    }
    
    func getTextVariations(row: Int) -> UBText {
        switch row {
        case 0:
            let text = UBText(textAttribute: TextAttributes(text: "Text can support single link in it"), linkAttributes: [LinkAttributes(text: "link", url: "Row 0")])
            return text
        case 1:
            let text = UBText(textAttribute: TextAttributes(text: "Text can supprot Link1 and Link2."), linkAttributes: [LinkAttributes(text: "Link1", url: "Row 0"), LinkAttributes(text: "Link2", url: "https://www.google.com/about-us/our-policies/terms-of-use.html")])
            return text
        case 2:
            let text = UBText(textAttribute: TextAttributes(text: "Text can support links in multiple lines.Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat: Link1"), linkAttributes: [LinkAttributes(text: "support", url: "https://www.google.com/about-us/our-policies/terms-of-use.html"), LinkAttributes(text: "veniam", url: "veniam"), LinkAttributes(text: "Link1", url: "Link1")])
            return text
        default:
            let text = UBText(textAttribute: TextAttributes(text: "The link can be regular"), linkAttributes: [LinkAttributes(text: "link", url: "Row 4")])
            return text
        }
    }
    
    func getUpdateTextOption(text: String, theme: UBTheme) -> UBText {
        return UBText(theme: theme, textAttribute: TextAttributes(text: text, color: .primary))
    }
    
}
