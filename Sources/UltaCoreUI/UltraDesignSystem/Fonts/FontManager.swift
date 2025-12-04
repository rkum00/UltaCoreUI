//
//  FontManager.swift
//
//
//  Created by Rakesh Kumar on 04/12/25.
//

import UIKit

public class FontManager {
    public static func getSizeFor(category: UIContentSizeCategory = UIApplication.shared.preferredContentSizeCategory) -> CGFloat {
       switch category {
       case .extraSmall:
           return -2
       case .small:
           return -1
       case .medium:
           return 0
       case .large:
           return 2
       case .extraLarge:
           return 4
       case .extraExtraLarge:
           return 6
       case .extraExtraExtraLarge, .accessibilityMedium, .accessibilityLarge, .accessibilityExtraLarge, .accessibilityExtraExtraLarge, .accessibilityExtraExtraExtraLarge:
           return 8
       default:
           return 0
       }
   }
    
    /// Retrieves the custom contentsize category corresponding to the user preferredContentSizeCategory
    /// - Returns: UIContentSizeCategory corresponding to the given font scale
    public static func getSizeCategory(category: UIContentSizeCategory = UIApplication.shared.preferredContentSizeCategory) -> UIContentSizeCategory {
        switch category {
        case .extraSmall, .small:
            return .extraSmall
        case .medium:
            return .small
        case .large:
            return .medium
        case .extraLarge:
            return .large
        case .extraExtraLarge:
            return .extraLarge
        case .extraExtraExtraLarge, .accessibilityMedium, .accessibilityLarge, .accessibilityExtraLarge, .accessibilityExtraExtraLarge, .accessibilityExtraExtraExtraLarge:
            return .extraExtraLarge
        default:
            return .medium
        }
    }

    /// Retrieves the font scale for the user's preferred contentsize category
    /// - Returns: Font scale corresponding to the given UIContentSizeCategory
    public static func getFontScaleFor(category: UIContentSizeCategory = UIApplication.shared.preferredContentSizeCategory) -> CGFloat {
       switch category {
       case .extraSmall, .small:
           return -2
       case .medium:
           return -1
       case .large:
           return 0
       case .extraLarge:
           return 2
       case .extraExtraLarge:
           return 4
       case .extraExtraExtraLarge, .accessibilityMedium, .accessibilityLarge, .accessibilityExtraLarge, .accessibilityExtraExtraLarge, .accessibilityExtraExtraExtraLarge:
           return 6
       default:
           return 0
       }
   }
}
