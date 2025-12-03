//
//  UltaTextViewPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 03/12/25.
//

import SwiftUI
import UltaCoreUI

class UltaTextViewPresenter: ObservableObject {
    
    var theme: UBTheme
    
    public init(theme: UBTheme = UBTheme.current) {
        self.theme = theme
    }
    
    var numberOfSections: Int {
        return UltaTextViewOptions.allCases.count
    }
    
    func getRowsCount(for section: Int) -> Int {
        return UltaTextViewOptions.allCases[section].numberOfRows()
    }
    
    func getComponent(row: Int, section: Int, isTapped: Bool = false) -> UBText {
        switch UltaTextViewOptions.allCases[section] {
        case .color:
            return UltaTextViewOptions.color.getColorComponent(row: row, theme: theme)
        case .weight:
            return UltaTextViewOptions.weight.getWeightComponent(row: row)
        case .size:
            return UltaTextViewOptions.size.getSizeComponent(row: row)
        case .alignment:
            return UltaTextViewOptions.alignment.getAlignmentComponent(row: row)
        case .textDecoration:
            return UltaTextViewOptions.textDecoration.getLineThroughComponent(row: row)
        case .maxLines:
            return UltaTextViewOptions.maxLines.getMaxLinesComponent()
        case .textVariations:
            return UltaTextViewOptions.textVariations.getTextVariations(row: row)
        case .lineHeightOptions:
            return UltaTextViewOptions.lineHeightOptions.getLineHeightComponent(row: row)
        case .updateTextOption:
            return UltaTextViewOptions.updateTextOption.getUpdateTextOption(text: getText(isTapped: isTapped), theme: theme)
        case .substringStyles:
            return UltaTextViewOptions.substringStyles.getStyledSubstringComponent(row: row)
        default:
            return UBText(
                theme: theme, textAttribute: TextAttributes(
                    text: "This is a sample text with a link",
                    color: .neutralHigh,
                    fontSize: .medium,
                    textAlign: .center,
                    maxlines: 2,
                    fontWeight: .regular,
                    lineHeight: .medium,
                    textDecoration: .underline
                ),
                linkAttributes: [
                    LinkAttributes(
                        text: "link",
                        color: .neutralHigh,
                        fontSize: .medium,
                        fontWeight: .semiBold,
                        textAlign: .center,
                        url: "https://www.example.com"
                    )
                ]
            )
        }
    }
    
    func getText(isTapped: Bool) -> String {
        return isTapped ? "Updated text" : "Default text"
    }
    
    func getUpdatedTextAttribute(isTapped: Bool) -> TextAttributes {
        return TextAttributes(text: getText(isTapped: isTapped), color: .primary)
    }
    
    func getBackgroundColor(row: Int, section: Int) -> Color {
        switch UltaTextViewOptions.allCases[section] {
        case .color:
            return Color(uiColor: .init(UltaTextViewOptions.color.getBackgroundColor(row: row, theme: theme)))
        default:
            return Color(uiColor: UBTheme.applyBackgroundBaselineColor(theme: theme))
        }
    }
    
    func getGreyBackgroundColor() -> Color {
        return Color(UBGlobal.colorGeneralGrey30)
    }
    
    func getSectionTitle(section: Int) -> String {
        return UltaTextViewOptions.allCases[section].rawValue
    }
}
