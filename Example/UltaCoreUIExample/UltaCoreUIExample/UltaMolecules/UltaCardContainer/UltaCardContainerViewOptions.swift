//
//  UltaCardContainerViewOptions.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 04/12/25.
//

import Foundation
import UltaCoreUI
import SwiftUI

public enum UltaCardContainerViewOptions: String, CaseIterable {
    case topDescription = "Description for Card Container."
    case size = "All size options"
    case padding = "Padding"
    
    func numberOfRows() -> Int {
        switch self {
        case .topDescription:
            return 0
        case .size:
            return UBCardSize.allCases.count
        case .padding:
            return UBCardPadding.allCases.count
        }
    }
    
    func getSizeComponent(section: Int, row: Int, theme: UBTheme = .current) -> some View {
        switch UBCardSize.allCases[row] {
        case .small:
            return UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .small,
                    type: .elevated,
                    state: .normal,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .medium
                ) {
                    UBCardView(icon: Image(systemName: "bolt.fill"),
                               title: "Pick up",
                               subtitle: "Free",
                               description: "shipping with $35",
                               tintColor: .white)
                },
                section: section,
                row: row
            )
        case .medium:
            return UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .medium,
                    type: .elevated,
                    state: .normal,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .medium
                ) {
                    UBCardView(icon: Image(systemName: "wifi"),
                               title: "Secure Mode",
                               subtitle: "Unavailable",
                               description: "Free in store pickup",
                               tintColor: .white)
                },
                section: section,
                row: row
            )
            
        case .large:
            return UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .large,
                    type: .elevated,
                    state: .normal,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .medium
                ) {
                    UBCardView(icon: Image(systemName: "lock.fill"),
                               title: "Same Day",
                               subtitle: "Free same",
                               description: "delivery over $50",
                               tintColor: .white)
                },
                section: section,
                row: row
            )
        }
    }
    
    func getPaddingComponent(section: Int, row: Int, theme: UBTheme = .current) -> some View {
        switch UBCardPadding.allCases[row] {
        case .none:
            return UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .small,
                    type: .elevated,
                    state: .normal,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .none
                ) {
                    UBCardView(icon: Image(systemName: "bolt.fill"),
                               title: "Pick up",
                               subtitle: "Free",
                               description: "shipping with $35",
                               tintColor: .white)
                },
                section: section,
                row: row
            )
        case .xSmall:
            return UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .small,
                    type: .elevated,
                    state: .normal,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .xSmall
                ) {
                    UBCardView(icon: Image(systemName: "wifi"),
                               title: "Secure Mode",
                               subtitle: "Unavailable",
                               description: "Free in store pickup",
                               tintColor: .white)
                },
                section: section,
                row: row
            )
            
        case .small:
            return UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .small,
                    type: .elevated,
                    state: .normal,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .small
                ) {
                    UBCardView(icon: Image(systemName: "lock.fill"),
                               title: "Same Day",
                               subtitle: "Free same",
                               description: "delivery over $50",
                               tintColor: .white)
                },
                section: section,
                row: row
            )
            
        case .medium:
            return UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .small,
                    type: .elevated,
                    state: .normal,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .medium
                ) {
                    UBCardView(icon: Image(systemName: "bolt.fill"),
                               title: "Pick up",
                               subtitle: "Free",
                               description: "shipping with $35",
                               tintColor: .white)
                },
                section: section,
                row: row
            )
        case .large:
            return UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .small,
                    type: .elevated,
                    state: .normal,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .large
                ) {
                    UBCardView(icon: Image(systemName: "wifi"),
                               title: "Secure Mode",
                               subtitle: "Unavailable",
                               description: "Free in store pickup",
                               tintColor: .white)
                },
                section: section,
                row: row
            )
        case .xLarge:
            return UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .small,
                    type: .elevated,
                    state: .normal,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .xLarge
                ) {
                    UBCardView(icon: Image(systemName: "lock.fill"),
                               title: "Same Day",
                               subtitle: "Free same",
                               description: "delivery over $50",
                               tintColor: .white)
                },
                section: section,
                row: row
            )
        }
    }
}
