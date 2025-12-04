//
//  StyleDictionaryFonts.swift
//
//
//  Created by Rakesh Kumar on 04/12/25.
//

import UIKit

public class FontModel {
    public var fontSize: CGFloat?
    public var fontFamily: String?
    public var fontDecoration: String?
    public var title: String?
    var dynamicFontSize = 0.0
    
    public init(fontSize: CGFloat?, fontFamily: String?, fontDecoration: String?, title: String?) {
        self.fontSize = fontSize
        self.fontFamily = fontFamily
        self.fontDecoration = fontDecoration
        self.title = title
    }
    
    public init() {
        updateFontSizes(category: UIApplication.shared.preferredContentSizeCategory)
    }
    
    public func getFontSize(for category: UIContentSizeCategory = UIApplication.shared.preferredContentSizeCategory) -> CGFloat {
        (fontSize ?? 0) + FontManager.getSizeFor(category: category)
    }
    
    // Retrieves the calculated font size for the views (except headers) based on the user's preferred contentsize category
    public func getScaledFontSize(for category: UIContentSizeCategory = UIApplication.shared.preferredContentSizeCategory) -> CGFloat {
        (fontSize ?? 0) + FontManager.getFontScaleFor(category: category)
    }
    
    public func getDefaultFontSize() -> CGFloat {
        fontSize ?? 0
    }
    
    public func updateFontSizes(category: UIContentSizeCategory) {
        switch category {
        case .extraSmall:
            dynamicFontSize = -2
        case .small:
            dynamicFontSize = -1
        case .medium:
            dynamicFontSize = 0
        case .large:
            dynamicFontSize = 2
        case .extraLarge:
            dynamicFontSize = 4
        case .extraExtraLarge:
            dynamicFontSize = 6
        case .extraExtraExtraLarge, .accessibilityMedium, .accessibilityLarge, .accessibilityExtraLarge, .accessibilityExtraExtraLarge, .accessibilityExtraExtraExtraLarge:
            dynamicFontSize = 8
        default:
            dynamicFontSize = 0
        }
    }
}

public extension FontModel {
    class var display40: FontModel {
        FontModel(fontSize: UBGlobal.space1000, fontFamily: UBGlobal.fontFamilyPoppins + "-Medium", fontDecoration: nil, title: "Display40")
    }
    
    class var display32: FontModel {
        FontModel(fontSize: UBGlobal.space800, fontFamily: UBGlobal.fontFamilyPoppins + "-Medium", fontDecoration: nil, title: "Display32")
    }
    
    class var display28: FontModel {
        FontModel(fontSize: UBGlobal.fontSize600, fontFamily: UBGlobal.fontFamilyPoppins + "-Medium", fontDecoration: nil, title: "Display28")
    }
    
    class var display24: FontModel {
       FontModel(fontSize: UBGlobal.space600, fontFamily: UBGlobal.fontFamilyPoppins + "-Medium", fontDecoration: nil, title: "Display24")
    }
    
    class var heading: FontModel {
       FontModel(fontSize: UBGlobal.fontSize500, fontFamily: UBGlobal.fontFamilyPoppins + "-Medium", fontDecoration: nil, title: "Heading")

    }
    
    class var headingH1: FontModel {
       FontModel(fontSize: UBGlobal.fontSize500, fontFamily: UBGlobal.fontFamilyPoppins + "-Medium", fontDecoration: nil, title: "Headline1")

    }
    
    class var headingH2: FontModel {
       FontModel(fontSize: UBGlobal.fontSize400, fontFamily: UBGlobal.fontFamilyPoppins + "-Medium", fontDecoration: nil, title: "Headline2")
    }
    
    class var headingH3: FontModel {
       FontModel(fontSize: UBGlobal.fontSize300, fontFamily: UBGlobal.fontFamilyPoppins + "-Medium", fontDecoration: nil, title: "Headline3")
    }
    class var headingH4: FontModel {
        FontModel(fontSize: UBGlobal.fontSize200, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: nil, title: "Headline4")
    }
    class var headingH5: FontModel {
       FontModel(fontSize: UBGlobal.fontSize100, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: nil, title: "Headline5")
    }
    
    class var body20: FontModel {
       FontModel(fontSize: UBGlobal.space500, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-Regular", fontDecoration: nil, title: "Body20")
    }
    
    class var body20Emphasis: FontModel {
       FontModel(fontSize: UBGlobal.space500, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: nil, title: "Body20_Emphasis")
    }
    
    class var body20Strikethrough: FontModel {
       FontModel(fontSize: UBGlobal.space500, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: UltaStyleFontsGlobal .fontTextDecorationLineThrough, title: "Body20_StrikeThrough")
    }
    
    class var body20Link: FontModel {
       FontModel(fontSize: UBGlobal.space500, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: UltaStyleFontsGlobal .fontTextDecorationUnderline, title: "Body20_Link")
    }
    
    class var body16: FontModel {
       FontModel(fontSize: UBGlobal.fontSize300, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-Regular", fontDecoration: nil, title: "Body16")
    }
    
    class var body16Emphasis: FontModel {
       FontModel(fontSize: UBGlobal.fontSize300, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: nil, title: "Body16_Emphasis")
    }
    
    class var body16Strikethrough: FontModel {
       FontModel(fontSize: UBGlobal.fontSize300, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: UltaStyleFontsGlobal .fontTextDecorationLineThrough, title: "Body16_StrikeThrough")
    }
    
    class var body16Link: FontModel {
       FontModel(fontSize: UBGlobal.fontSize300, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: UltaStyleFontsGlobal .fontTextDecorationUnderline, title: "Body16_Link")
    }
    
    
    class var body14: FontModel {
       FontModel(fontSize: UBGlobal.fontSize200, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-Regular", fontDecoration: nil, title: "Body14")
    }
    
    class var body14Emphasis: FontModel {
       FontModel(fontSize: UBGlobal.fontSize200, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: nil, title: "Body14_Emphasis")
    }
    
    class var body14Strikethrough: FontModel {
       FontModel(fontSize: UBGlobal.fontSize200, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: UltaStyleFontsGlobal .fontTextDecorationLineThrough, title: "Body14_StrikeThrough")
    }
    
    class var body14Link: FontModel {
       FontModel(fontSize: UBGlobal.fontSize200, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: UltaStyleFontsGlobal .fontTextDecorationUnderline, title: "Body14_Link")
    }
    
    class var body12: FontModel {
        FontModel(fontSize: UBGlobal.fontSize100, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-Regular", fontDecoration: nil, title: "Body12")
    }
    
    class var body12Emphasis: FontModel {
       FontModel(fontSize: UBGlobal.fontSize100, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: nil, title: "Body12_Emphasis")
    }
    
    class var body12Strikethrough: FontModel {
       FontModel(fontSize: UBGlobal.fontSize100, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: UltaStyleFontsGlobal .fontTextDecorationLineThrough, title: "Body12_StrikeThrough")
    }
    
    class var body12Link: FontModel {
       FontModel(fontSize: UBGlobal.fontSize100, fontFamily: UBGlobal.fontFamilyNunitoSans.removeWhitespace() + "-SemiBold", fontDecoration: UltaStyleFontsGlobal .fontTextDecorationUnderline, title: "Body12_Link")
    }
    
    class func getFontModels() -> [FontModel] {
        return [display40, display32, display28, display24, heading, headingH1, headingH2, headingH3, headingH4, headingH5, body20, body20Link, body20Emphasis, body20Strikethrough, body16,
                body16Link, body16Emphasis, body16Strikethrough, body14, body14Link, body14Emphasis, body14Strikethrough, body12, body12Link, body12Emphasis, body12Strikethrough]
        
    }
}

extension String {
    func replace(string:String, replacement:String) -> String {
        return self.replacingOccurrences(of: string, with: replacement, options: NSString.CompareOptions.literal, range: nil)
    }
    
    func removeWhitespace() -> String {
        return self.replace(string: " ", replacement: "")
    }
}
