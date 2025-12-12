//
//  UBTraitCollection.swift
//
//
//  Created by Rakesh Kumar on 12/12/25.
//

import UIKit

extension UITraitCollection {
    static func getContentSizeTraitCollection() -> UITraitCollection {
        let preferredContentSizeCategory: UIContentSizeCategory
        switch UIApplication.shared.preferredContentSizeCategory {
        case .extraSmall,
            .small:
            preferredContentSizeCategory = .medium
        case .extraExtraExtraLarge,
            .accessibilityMedium,
            .accessibilityLarge,
            .accessibilityExtraLarge,
            .accessibilityExtraExtraLarge,
            .accessibilityExtraExtraExtraLarge:
            preferredContentSizeCategory = .extraExtraLarge
        default:
            preferredContentSizeCategory = UIApplication.shared.preferredContentSizeCategory
        }
        return UITraitCollection(preferredContentSizeCategory: preferredContentSizeCategory)
    }
}
