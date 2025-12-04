//
//  UBFonts.swift
//
//
//  Created by Rakesh Kumar on 04/12/25.
//

import UIKit

public class UBFonts {
    public var fontSize: CGFloat?
    public var dynamicFontSize = 0.0
    
    public init(fontSize: CGFloat?) {
        self.fontSize = fontSize
    }
    
    //TODO: This method should be sunset
    public init() {
        updateFontSizes(category: UIApplication.shared.preferredContentSizeCategory)
    }
    
    public func getFontSize(for category: UIContentSizeCategory = UIApplication.shared.preferredContentSizeCategory) -> CGFloat {
        (fontSize ?? 0) + FontManager.getSizeFor(category: category)
    }
    
    public func getDefaultFontSize() -> CGFloat {
        fontSize ?? 0
    }
    
    //TODO: This method has to be sunset
    public func updateFontSizes(category: UIContentSizeCategory) {
        if !FontScalingFlagManager.localFlag {
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
}

public extension UBFonts {
    class var fontSize25: UBFonts {
        return UBFonts(fontSize: UBGlobal.fontSize25)
    }
    class var fontSize50: UBFonts {
        return UBFonts(fontSize: UBGlobal.fontSize50)
    }
    class var fontSize100: UBFonts {
        return UBFonts(fontSize: UBGlobal.fontSize100)
    }
    
    class var fontSize200: UBFonts {
        return UBFonts(fontSize: UBGlobal.fontSize200)
    }
    
    class var fontSize300: UBFonts {
        return UBFonts(fontSize: UBGlobal.fontSize300)
    }
    
    class var fontSize400: UBFonts {
        return UBFonts(fontSize: UBGlobal.fontSize400)
    }
    
    class var fontSize500: UBFonts {
        return UBFonts(fontSize: UBGlobal.fontSize500)
    }
    
    class var fontSize600: UBFonts {
        return UBFonts(fontSize: UBGlobal.fontSize600)
    }

    
    class func getFonts() -> [UBFonts] {
      return [fontSize25, fontSize50, fontSize100, fontSize200, fontSize300, fontSize400, fontSize500, fontSize600]
    }
}
