//
//  UltaFontsOptions.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 19/12/25.
//

import Foundation
import UltaCoreUI
import UIKit
import SwiftUI

enum UltaFontsOptions: String, CaseIterable {
    case topDescription = "The available fonts options are compatible with all components."
    case option = "Fonts Options"
    
    func numberOfRows() -> Int {
        switch self {
        case .topDescription:
            return 0
        case .option:
            return models.count
        }
    }
    
    var models: [FontModel] {
        return FontModel.getFontModels()
    }
    
    func getTitle(at row: Int) -> String {
        let object = models[row]
        return object.title ?? ""
    }
    
    func getFontFamilyName(row: Int, section: Int) -> String {
        switch self {
        case .option:
            return models[row].fontFamily ?? ""
        default:
            return ""
        }
    }
    
    func getFontSize(row: Int, section: Int) -> CGFloat {
        switch self {
        case .option:
            return models[row].fontSize ?? 0.0
        default:
            return 0.0
        }
    }
    
    func getAttributedComponentName(row: Int) -> AttributedString {
        return applyStylesForFontDecoration(at:row, decoration: getFontDecoration(at: row))
    }
    
    func getFontDecoration(at row: Int) -> String {
        return models[row].fontDecoration ?? ""
    }
    
    func applyStylesForFontDecoration(at row: Int, decoration: String) -> AttributedString {
        switch decoration {
        case UltaStyleFontsGlobal.fontTextDecorationUnderline:
            return addUnderlineToText(at: row)
        case UltaStyleFontsGlobal.fontTextDecorationLineThrough:
            return addStrikeThroughToText(at: row)
        case UltaStyleFontsGlobal.fontTextCaseUppercase:
            return AttributedString(getTitle(at: row).uppercased())
        default:
            return AttributedString(getTitle(at: row))
        }
    }
    
    func addUnderlineToText(at row: Int) -> AttributedString {
        var text = AttributedString(getTitle(at: row))
        text.underlineStyle = .single
        return text
    }
    
    func addStrikeThroughToText(at row: Int) -> AttributedString {
        var text = AttributedString(getTitle(at: row))
        text.strikethroughStyle = .single
        return text
    }
    
    func getTextColor(theme: UBTheme) -> Color {
        switch theme {
        case .theme1:
            let totalValue = GlobalTheme1ColorEnum.allCases.count
            let colorIndex = Int.random(in: 0..<totalValue)
            return Color(GlobalTheme1ColorEnum.allCases[colorIndex].associatedColor)
        case .theme2:
            let totalValue = GlobalTheme2ColorEnum.allCases.count
            let colorIndex = Int.random(in: 0..<totalValue)
            return Color(GlobalTheme2ColorEnum.allCases[colorIndex].associatedColor)
        case .theme3:
            let totalValue = GlobalTheme3ColorEnum.allCases.count
            let colorIndex = Int.random(in: 0..<totalValue)
            return Color(GlobalTheme3ColorEnum.allCases[colorIndex].associatedColor)
        }
    }
}
