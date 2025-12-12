//
//  UBFontFamily.swift
//
//
//  Created by Rakesh Kumar on 12/12/25.
//

import UIKit

public typealias UBFontConfiguration = (fontType: String, pointSize: CGFloat, lineHeight: CGFloat)

public enum UBFontFamily: CaseIterable {
    /// Semi-bold 32/34 pts
    case xxLargeTitleNS
    /// Semi-bold 28/34 pts
    case xLargeTitleNS
    /// Semi-bold 24/28 pts
    case largeTitleNS
    /// Semi-bold 20/26 pts
    case mediumTitleNS
    /// Bold 20/26 pts
    case mediumBoldTitleNS
    /// Semi-bold 20/24 pts (possible duplicate of `mediumTitleNS`)
    case semiMediumTitleBoldNS
    /// Semi-bold 14/19.1 pts
    case semiBoldTitleBoldNS
    /// Semi-bold 20/28 pts (possible duplicate of `mediumTitleNS`)
    case mediumSemiBoldTitleNS
    /// Semi-bold 16/24 pts (very similar to `smallTitleNS`)
    case semiMediumTitleNS
    /// Semi-bold 16/22 pts
    case smallTitleNS
    /// Regular 28/34 pts
    case xLargeTitleRegularNS
    /// Regular 24/30 pts
    case largeTitleRegularNS
    /// Regular 20/26 pts
    case titleRegularNS
    /// Bold 24/28 pts
    case largeTitleBoldNS
    /// Bold 20/24 pts
    case mediumTitleBoldNS
    /// Bold 16/20 pts
    case smallTitleBoldNS
    /// Semi-bold 16/18 pts
    case mediumTitleSemiBoldNS
    /// Semi-bold 14/18 pts
    case smallTitleSemiBoldNS
    
    /// Bold 16/22 pts
    case largeWordHighlightNS
    /// Bold 12/18 pts
    case smallWordHighlightNS
    /// Semi-bold 12/18 pts
    case freshPassSaveNS
    
    /// Regular 14/20 pts
    case subheadNS
    /// Semi-bold 14/20 pts
    case subheadSemiboldNS
    /// Bold 14/20 pts
    case subheadBoldNS
    /// Regular 14/17 pts
    case subheadNormalNS
    
    /// Regular 16/20 pts
    case linkNS
    /// Regular 12/16 pts
    case smallLinkNS
    
    /// Regular 12/16 pts
    case footnoteNS
    /// Regular 9/14 pts
    case smallFootnoteNS
    /// Regular 14/18 pts
    case footerRegularNS

    /// Semi-bold 16/20 pts
    case buttonLabelNS
    /// Semi-bold 12/16 pts
    case smallButtonLabelNS
    
    /// Regular 20/24 pts
    case mediumLinkBannerTitleNS
    /// Regular 18/24 pts
    case mediumHeaderTitleNS
    
    /// Regular 16/22 pts
    case bodyTextNS
    /// Regular 12/20 pts
    case bodySmallNS
    /// Regular 10/15 pts
    case smallbodyTextNS
    /// Regular 15/20 pts
    case subTextNS
    /// Semi-bold 15/20 pts
    case mediumSubTextNS
    /// Regular 14/16 pts
    case smallHighlightNS
    /// Bold 9/14 pts
    case navBarNS

    /// Regular 12/18 pts
    case dealCardDescriptionNS
    /// Bold 12/16 pts
    case dealCardExpiryNS
    /// Bold 16/24 pts
    case priceSmallTitleBoldNS
    /// Regular 9/14 pts
    case approxText
    /// Semi-bold 10/18 pts
    case cartIconText
    /// ExtraBold 14/20 pts
    case searchCategoryNS
    /// Semi-bold 14/22 pts
    case noResultHeaderText
    /// Bold 22/26 pts
    case searchErrorHeadingNS
    /// Regular 14/22 pts
    case driverTipDescriptionNS
    /// Semi-bold 14/26 pts
    case successSemiboldNS
    /// Bold 11/16 pts
    case saveTextNS
    /// Bold 14/22 pts
    case viewDetailsTextNS

    /// Regular 16/25 pts
    case annualSaveTextNS
    /// Bold 16/25 pts
    case annualSavePriceNS
    
    /// Light 24/30 pts
    case largeTitleLightNS
    /// Light 20/24 pts
    case mediumTitleLightNS
    /// Regular 10/16 pts
    case smallTitleRegularNS
    /// Semi-bold 16/20 pts
    case mediumOfferNS
    /// Regular 16/24 pts
    case subTextRegularNS
    /// Light 32/36 pts
    case sellerListBanner
    /// SemiBold 12/14 pts
    case subTextSemiBold
    /// SemiBold 14/21 pts
    case titleSemiBold
    /// SemiBold 14/24 pts
    case titleSemiBold1424
    /// SemiBold 24/30 pts
    case largeTitleSemiBoldNS
    /// Regular 14/21 pts
    case paragraphRegularNS
    /// Regular 28/34 pts
    case xLargeTitleLightNS
    /// Bold 12/14 pts
    case subTextBoldNS
    /// Bold 14/21 pts
    case subheadSmallBoldNS
    /// Regular 14/24 pts
    case descriptionRegularNS
    /// SemiBold 18/22 pts
    case titleSemiBoldNS
    /// SemiBold 14/16.8 pts
    case titleSemiBoldNS14
    /// ExtraBold 12/14 pts
    case extraBoldNS12
    /// Regular 6.8/10.2 pts
    case descriptionRegularNS6
    /// SemiBold 6.8/10.2 pts
    case semiBoldTitleBoldNS6
    /// NunitoSans SemiBold 10/14.5 pts
    case nunitoSansSemiBold10145
    /// NunitoSans SemiBold 10/14.5 pts
    case nunitoSansBold10145
    /// NunitoSans SemiBold 22/6.8 pts
    case nunitoSansMedium2268
    /// NunitoSans SemiBold 23/6.8 pts
    case nunitoSansMedium2368

}

public extension UBFontFamily {
    
    var configuration: UBFontConfiguration {
        let configuration: UBFontConfiguration
        switch self {
        case .xxLargeTitleNS:
            configuration = ("NunitoSans-SemiBold", 32, 34)
        case .xLargeTitleNS:
            configuration = ("NunitoSans-SemiBold", 28, 34)
        case .largeTitleNS:
            configuration = ("NunitoSans-SemiBold", 24, 28)
        case .mediumTitleNS:
            configuration = ("NunitoSans-SemiBold", 20, 26)
        case .mediumBoldTitleNS:
            configuration = ("NunitoSans-Bold", 20, 26)
        case .mediumSemiBoldTitleNS:
            configuration = ("NunitoSans-SemiBold", 20, 28)
        case .semiMediumTitleBoldNS:
            configuration = ("NunitoSans-SemiBold", 20, 24)
        case .semiMediumTitleNS:
            configuration = ("NunitoSans-SemiBold", 16, 24)
        case .smallTitleNS:
            configuration = ("NunitoSans-SemiBold", 16, 22)
        case .xLargeTitleRegularNS:
            configuration = ("NunitoSans-Regular", 28, 34)
        case .largeTitleRegularNS:
            configuration = ("NunitoSans-Regular", 24, 30)
        case .titleRegularNS:
            configuration = ("NunitoSans-Regular", 20, 26)
        case .largeTitleBoldNS:
            configuration = ("NunitoSans-Bold", 24, 28)
        case .mediumTitleBoldNS:
            configuration = ("NunitoSans-Bold", 20, 24)
        case .smallTitleBoldNS:
            configuration = ("NunitoSans-Bold", 16, 20)
        case .mediumTitleSemiBoldNS:
            configuration = ("NunitoSans-SemiBold", 16, 18)
        case .smallTitleSemiBoldNS:
            configuration = ("NunitoSans-SemiBold", 14, 18)
        case .titleSemiBold:
            configuration = ("NunitoSans-SemiBold", 14, 21)
        case .titleSemiBold1424:
            configuration = ("NunitoSans-SemiBold", 14, 24)
        case .largeWordHighlightNS:
            configuration = ("NunitoSans-Bold", 16, 22)
        case .smallWordHighlightNS:
            configuration = ("NunitoSans-Bold", 12, 18)
        case .freshPassSaveNS:
            configuration = ("NunitoSans-SemiBold", 12, 18)

        case .subheadNS:
            configuration = ("NunitoSans-Regular", 14, 20)
        case .subheadSemiboldNS:
            configuration = ("NunitoSans-SemiBold", 14, 20)
        case .subheadBoldNS:
            configuration = ("NunitoSans-Bold", 14, 20)
        case .subheadNormalNS:
            configuration = ("NunitoSans-Regular", 14, 17)
            
        case .linkNS:
            configuration = ("NunitoSans-Regular", 16, 20)
        case .smallLinkNS:
             configuration = ("NunitoSans-Regular", 12, 16)

        case .footnoteNS:
            configuration = ("NunitoSans-Regular", 12, 16)
        case .smallFootnoteNS:
             configuration = ("NunitoSans-Regular", 9, 14)
        case .footerRegularNS:// TODO: This typography is not available in design system 2
            configuration = ("NunitoSans-Regular", 14, 18)
            
        case .buttonLabelNS:
            configuration = ("NunitoSans-SemiBold", 16, 20)
        case .smallButtonLabelNS:
            configuration = ("NunitoSans-SemiBold", 12, 16)

        case .mediumLinkBannerTitleNS:
            configuration = ("NunitoSans-Regular", 20, 24)
        case .mediumHeaderTitleNS:
            configuration = ("NunitoSans-Regular", 18, 24)

        case .bodyTextNS:// TODO: This typography is not available in design system
            configuration = ("NunitoSans-Regular", 16, 22)
        case .bodySmallNS:// TODO: This typography is not available in design system
            configuration = ("NunitoSans-Regular", 12, 20)
        case .smallbodyTextNS:
            configuration = ("NunitoSans-Regular", 10, 15)
        case .subTextNS:
            configuration = ("NunitoSans-Regular", 15, 20)
        case .mediumSubTextNS:
            configuration = ("NunitoSans-SemiBold", 15, 20)
        case .smallHighlightNS:
            configuration = ("NunitoSans-Regular", 14, 16)
        case .navBarNS:
            configuration = ("NunitoSans-Bold", 9, 14)

        case .dealCardDescriptionNS:
            configuration = ("NunitoSans-Regular", 12, 18)
        case .dealCardExpiryNS: // TODO: This typography is not available in design system
            configuration = ("NunitoSans-Bold", 12, 16)
        case .priceSmallTitleBoldNS:
            configuration = ("NunitoSans-Bold", 16, 24)
        case .approxText:
            configuration = ("NunitoSans-Regular", 9, 14)
        case .cartIconText:
            configuration = ("NunitoSans-SemiBold", 10, 18)
        case .searchCategoryNS:
            configuration = ("NunitoSans-ExtraBold", 14, 20)
        case .noResultHeaderText:
            configuration = ("NunitoSans-SemiBold", 14, 22)
        case .searchErrorHeadingNS:
            configuration = ("NunitoSans-Bold", 22, 26)
        case .driverTipDescriptionNS:
            configuration = ("NunitoSans-Regular", 14, 22)
        case  .successSemiboldNS:
            configuration = ("NunitoSans-SemiBold", 14, 26)
        case .saveTextNS:
            configuration = ("NunitoSans-Bold", 11, 16)
        case .viewDetailsTextNS:
            configuration = ("NunitoSans-Bold", 14, 22)
        case .annualSaveTextNS:
            configuration = ("NunitoSans-Regular", 16, 25)
        case .annualSavePriceNS:
            configuration = ("NunitoSans-Bold", 16, 25)
            
        case .largeTitleLightNS:
            configuration = ("NunitoSans-Light", 24, 30)
        case .mediumTitleLightNS:
            configuration = ("NunitoSans-Light", 20, 24)
        case .smallTitleRegularNS:
            configuration = ("NunitoSans-Regular", 10, 16)
        case .mediumOfferNS:
            configuration = ("NunitoSans-SemiBold", 16, 20)
        case .subTextRegularNS:
            configuration = ("NunitoSans-Regular", 16, 24)
        case .sellerListBanner:
            configuration = ("NunitoSans-Light", 32, 36)
        case .subTextSemiBold:
            configuration = ("NunitoSans-SemiBold", 12, 14)
        case .largeTitleSemiBoldNS:
            configuration = ("NunitoSans-SemiBold", 24, 30)
        case .paragraphRegularNS:
            configuration = ("NunitoSans-Regular", 14, 21)
        case .xLargeTitleLightNS:
            configuration = ("NunitoSans-Light", 28, 34)
        case .subTextBoldNS:
            configuration = ("NunitoSans-Bold", 12, 14)
        case .subheadSmallBoldNS:
            configuration = ("NunitoSans-Bold", 14, 21)
        case .descriptionRegularNS:
            configuration = ("NunitoSans-Regular", 14, 24)
        case .titleSemiBoldNS:
            configuration = ("NunitoSans-SemiBold", 18, 22)
        case .titleSemiBoldNS14:
            configuration = ("NunitoSans-SemiBold", 14, 16.8)
        case .extraBoldNS12:
            configuration = ("NunitoSans-ExtraBold", 12, 14)
        case  .semiBoldTitleBoldNS:
            configuration = ("NunitoSans-SemiBold", 14, 19.1)
        case .descriptionRegularNS6:
            configuration = ("NunitoSans-Regular", 6.8, 10.2)
        case  .semiBoldTitleBoldNS6:
            configuration = ("NunitoSans-SemiBold", 6.8, 10.2)
        case .nunitoSansSemiBold10145:
            configuration = ("NunitoSans-SemiBold", 10, 14.5)
        case .nunitoSansBold10145:
            configuration = ("NunitoSans-Bold", 10, 14.5)
        case .nunitoSansMedium2268:
            configuration = ("NunitoSans-Medium", 22, 6.8)
        case .nunitoSansMedium2368:
            configuration = ("NunitoSans-Medium", 23, 6.8)
        }
        return configuration
    }
    
    var font: UIFont {
        UIFont(name: configuration.fontType, size: configuration.pointSize) ?? UIFont.systemFont(ofSize: configuration.pointSize)
    }
    
    var dynamicFont: UIFont {
        return self
            .toTypography(isDynamic: true)
            .generateLayout(compatibleWith: UITraitCollection.getContentSizeTraitCollection())
            .font
    }
    
    // Sets dynamic fonts dependent on our defined UIContentSizeCategory
    var setDynamicFont: UIFont {
        let fontModel = FontModel(fontSize: configuration.pointSize, fontFamily: configuration.fontType, fontDecoration: nil, title: nil)
        return UIFont(name: fontModel.fontFamily ?? configuration.fontType, size: fontModel.getScaledFontSize()) ?? self.font
    }
}

extension UBFontFamily {
    
    /// Convert UBFontFamily enum into UBTypography
    /// - Parameter isDynamic: whether font should be scaled using Dynamic Type
    /// - Returns: Typography info for this font
    public func toTypography(isDynamic: Bool) -> UBTypography {
        let config: UBFontConfiguration = self.configuration
        let components = config.fontType.split(separator: "-")
        let font = String(components.first ?? "")
        let suffix = String(components.last ?? "")
        let weight = UBFontWeight.allCases.first(where: { $0.name == suffix }) ?? .regular
        return UBTypography(
            fontFamilyName: font,
            fontWeight: weight,
            fontSize: config.pointSize,
            lineHeight: config.lineHeight,
            textStyle: .body,
            isDynamic: isDynamic
        )
    }
}

public struct UBStaticFont {
    public static let xxLargeTitleNS           = UBFontFamily.xxLargeTitleNS.font
    public static let xLargeTitleNS            = UBFontFamily.xLargeTitleNS.font
    public static let largeTitleNS             = UBFontFamily.largeTitleNS.font
    public static let mediumTitleNS            = UBFontFamily.mediumTitleNS.font
    public static let mediumBoldTitleNS        = UBFontFamily.mediumBoldTitleNS.font
    public static let semiMediumTitleBoldNS    = UBFontFamily.semiMediumTitleBoldNS.font
    public static let mediumSemiBoldTitleNS    = UBFontFamily.mediumSemiBoldTitleNS.font
    public static let semiMediumTitleNS        = UBFontFamily.semiMediumTitleNS
    public static let smallTitleNS             = UBFontFamily.smallTitleNS.font
    public static let xLargeTitleRegularNS     = UBFontFamily.xLargeTitleRegularNS.font
    public static let largeTitleRegularNS      = UBFontFamily.largeTitleRegularNS.font
    public static let titleRegularNS           = UBFontFamily.titleRegularNS.font
    public static let largeTitleBoldNS         = UBFontFamily.largeTitleBoldNS.font
    public static let mediumTitleBoldNS        = UBFontFamily.mediumTitleBoldNS.font
    public static let smallTitleBoldNS         = UBFontFamily.smallTitleBoldNS.font
    public static let mediumTitleSemiBoldNS    = UBFontFamily.mediumTitleSemiBoldNS.font
    public static let smallTitleSemiBoldNS     = UBFontFamily.smallTitleSemiBoldNS.font

    public static let largeWordHighlightNS     = UBFontFamily.largeWordHighlightNS.font
    public static let smallWordHighlightNS     = UBFontFamily.smallWordHighlightNS.font
    public static let freshPassSaveNS          = UBFontFamily.freshPassSaveNS.font
    
    public static let subheadNS                = UBFontFamily.subheadNS.font
    public static let subheadSemiboldNS        = UBFontFamily.subheadSemiboldNS.font
    public static let subheadBoldNS            = UBFontFamily.subheadBoldNS.font
    public static let subheadNormalNS          = UBFontFamily.subheadNormalNS.font

    public static let linkNS                   = UBFontFamily.linkNS.font
    public static let smallLinkNS              = UBFontFamily.smallLinkNS.font
    
    public static let footnoteNS               = UBFontFamily.footnoteNS.font
    public static let smallFootnoteNS          = UBFontFamily.smallFootnoteNS.font
    public static let footerRegularNS          = UBFontFamily.footerRegularNS.font

    public static let buttonLabelNS            = UBFontFamily.buttonLabelNS.font
    public static let smallButtonLabelNS       = UBFontFamily.smallButtonLabelNS.font

    public static let mediumLinkBannerTitleNS  = UBFontFamily.mediumLinkBannerTitleNS.font

    public static let bodyTextNS               = UBFontFamily.bodyTextNS.font
    public static let bodySmallNS              = UBFontFamily.bodySmallNS.font
    public static let smallbodyText            = UBFontFamily.smallbodyTextNS.font
    public static let subTextNS                = UBFontFamily.subTextNS.font
    public static let mediumSubTextNS          = UBFontFamily.mediumSubTextNS.font
    public static let smallHighlightNS         = UBFontFamily.smallHighlightNS.font
    public static let navBarNS                 = UBFontFamily.navBarNS.font

    public static let dealCardDescriptionNS    = UBFontFamily.dealCardDescriptionNS.font
    public static let dealCardExpiryNS         = UBFontFamily.dealCardExpiryNS.font
    public static let priceSmallTitleBoldNS    = UBFontFamily.priceSmallTitleBoldNS.font
    public static let approxText               = UBFontFamily.approxText.font
    public static let cartIconText             = UBFontFamily.cartIconText.font
    public static let searchCategoryNS         = UBFontFamily.searchCategoryNS.font
    public static let noResultHeaderText       = UBFontFamily.noResultHeaderText.font
    public static let searchErrorHeadingNS     = UBFontFamily.searchErrorHeadingNS.font
    public static let driverTipDescriptionNS   = UBFontFamily.driverTipDescriptionNS.font
    public static let successSemiboldNS        = UBFontFamily.successSemiboldNS.font
    public static let saveTextNS               = UBFontFamily.saveTextNS.font
    public static let viewDetailsTextNS        = UBFontFamily.viewDetailsTextNS.font

    public static let annualSaveTextNS         = UBFontFamily.annualSaveTextNS.font
    public static let annualSavePriceNS        = UBFontFamily.annualSavePriceNS.font
    
    public static let largeTitleLightNS        = UBFontFamily.largeTitleLightNS.font
    public static let mediumTitleLightNS       = UBFontFamily.mediumTitleLightNS.font
    public static let smallTitleRegularNS      = UBFontFamily.smallTitleRegularNS.font
    public static let mediumOfferNS            = UBFontFamily.mediumOfferNS.font
    public static let subTextRegularNS         = UBFontFamily.subTextRegularNS.font
    public static let sellerListBanner         = UBFontFamily.sellerListBanner.font
    public static let subTextSemiBold          = UBFontFamily.subTextSemiBold.font
    public static let titleSemiBold           = UBFontFamily.titleSemiBold.font
    public static let largeTitleSemiBoldNS     = UBFontFamily.largeTitleSemiBoldNS.font
    public static let paragraphRegularNS       = UBFontFamily.paragraphRegularNS.font
    public static let xLargeTitleLightNS       = UBFontFamily.xLargeTitleLightNS.font
    public static let subTextBoldNS            = UBFontFamily.subTextBoldNS.font
    public static let subheadSmallBoldNS    = UBFontFamily.subheadSmallBoldNS.font
    public static let descriptionTitleRegularNS    = UBFontFamily.descriptionRegularNS.font
    public static let titleSemiBoldNS14    = UBFontFamily.titleSemiBoldNS14.font
    public static let extraBoldNS12 = UBFontFamily.extraBoldNS12.font
    public static let semiBoldTitleBoldNS = UBFontFamily.semiBoldTitleBoldNS.font
    public static let descriptionRegularNS6 = UBFontFamily.descriptionRegularNS6.font
    public static let semiBoldTitleBoldNS6 = UBFontFamily.semiBoldTitleBoldNS6.font
    public static let nunitoSansMedium2268 = UBFontFamily.nunitoSansMedium2268.font
    public static let nunitoSansMedium2368 = UBFontFamily.nunitoSansMedium2368.font

    public static func registerFonts() {

    let resourceBundle = UBConfig.resourceBundle()

    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-Black", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-BlackItalic", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-Light", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-ExtraLight", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-LightItalic", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-ExtraLightItalic", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-Regular", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-SemiBold", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-Bold", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-ExtraBold", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-Italic", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-SemiBoldItalic", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-BoldItalic", fontExtension: "ttf")
    UIFont.registerFont(bundle: resourceBundle, fontName: "NunitoSans-ExtraBoldItalic", fontExtension: "ttf")
    }
}


extension UIFont {
    
    @discardableResult
    
    static func registerFont(bundle: Bundle, fontName: String, fontExtension: String) -> Bool {
        guard let fontURL = bundle.url(forResource: fontName, withExtension: fontExtension) else {
            fatalError("Couldn't find font \(fontName)")
        }
        
        guard let fontDataProvider = CGDataProvider(url: fontURL as CFURL) else {
            fatalError("Couldn't load data from the font \(fontName)")
        }
        
        guard let font = CGFont(fontDataProvider) else {
            fatalError("Couldn't create font from data")
        }
        
        var error: Unmanaged<CFError>?
        let success = CTFontManagerRegisterGraphicsFont(font, &error)
        guard success else {
            debugPrint(error.debugDescription)
            return false
        }
        return true
    }
}
