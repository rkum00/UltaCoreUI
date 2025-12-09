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
    case background = "Background"
    case interactive = "Interactive"
    
    func numberOfRows() -> Int {
        switch self {
        case .topDescription:
            return 0
        case .size:
            return UBCardSize.allCases.count
        case .padding:
            return UBCardPadding.allCases.count
        case .background:
            return 4
        case .interactive:
            return UBCardSelectionMode.allCases.count
        }
    }
    
    func getSizeComponent(section: Int, row: Int, theme: UBTheme = .current) -> some View {
        switch UBCardSize.allCases[row] {
        case .small:
            UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .small,
                    type: .outlined,
                    state: .normal,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .small
                ) {
                    UBCardView(icon: Image(systemName: "bolt.fill"),
                               title: "Pick up",
                               subtitle: "Free",
                               description: "Shipping with $35",
                               tintColor: Color(UBTheme.applyBackgroundPrimaryColor(theme: theme)))
                },
                section: section,
                row: row
            )
        case .medium:
            UltaCardContainerRowView(
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
                               tintColor: Color(UBTheme.applyBackgroundPrimaryColor(theme: theme)))
                },
                section: section,
                row: row
            )
            
        case .large:
            UltaCardContainerRowView(
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
                               description: "Delivery over $50",
                               tintColor: Color(UBTheme.applyBackgroundPrimaryColor(theme: theme)))
                },
                section: section,
                row: row
            )
        }
    }
    
    func getPaddingComponent(section: Int, row: Int, theme: UBTheme = .current) -> some View {
        switch UBCardPadding.allCases[row] {
        case .none:
            UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .medium,
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
                               description: "Shipping with $35",
                               tintColor: Color(UBTheme.applyBackgroundPrimaryColor(theme: theme)))
                },
                section: section,
                row: row
            )
        case .xSmall:
            UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .medium,
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
                               tintColor: Color(UBTheme.applyBackgroundPrimaryColor(theme: theme)))
                },
                section: section,
                row: row
            )
            
        case .small:
            UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .medium,
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
                               description: "Delivery over $50",
                               tintColor: Color(UBTheme.applyBackgroundPrimaryColor(theme: theme)))
                },
                section: section,
                row: row
            )
            
        case .medium:
            UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .medium,
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
                               description: "Shipping with $35",
                               tintColor: Color(UBTheme.applyBackgroundPrimaryColor(theme: theme)))
                },
                section: section,
                row: row
            )
        case .large:
            UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .medium,
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
                               tintColor: Color(UBTheme.applyBackgroundPrimaryColor(theme: theme)))
                },
                section: section,
                row: row
            )
        case .xLarge:
            UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .medium,
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
                               description: "Delivery over $50",
                               tintColor: Color(UBTheme.applyBackgroundPrimaryColor(theme: theme)))
                },
                section: section,
                row: row
            )
        }
    }
    
    func getBackgroundColorComponent(section: Int, row: Int, theme: UBTheme = .current) -> some View {
        switch row {
        case 0:
            UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .small,
                    type: .elevated,
                    state: .selectedBackgroundPrimary,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .none
                ) {
                    UBCardView(icon: Image(systemName: "bolt.fill"),
                               title: "Pick up",
                               subtitle: "Free",
                               description: "Shipping",
                               textColor: .neutralHighInverse,
                               tintColor: Color(UBTheme.applyBackgroundBaselineColor(theme: theme)))
                },
                section: section,
                row: row
            )
        case 1:
            UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .medium,
                    type: .elevated,
                    state: .selectedBackgroundPrimary,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .xSmall
                ) {
                    UBCardView(icon: Image(systemName: "wifi"),
                               title: "Secure Mode",
                               subtitle: "Unavailable",
                               description: "Free in store pickup",
                               textColor: .neutralHighInverse,
                               tintColor: Color(UBTheme.applyBackgroundBaselineColor(theme: theme)))
                },
                section: section,
                row: row
            )
        case 2:
            UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .medium,
                    type: .elevated,
                    state: .selectedBackgroundPrimary,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .small
                ) {
                    UBCardView(icon: Image(systemName: "lock.fill"),
                               title: "Same Day",
                               subtitle: "Free same",
                               description: "Delivery over $50",
                               textColor: .neutralHighInverse,
                               tintColor: Color(UBTheme.applyBackgroundBaselineColor(theme: theme)))
                },
                section: section,
                row: row
            )
        default:
            UltaCardContainerRowView(
                ubCardContainer: UBCardContainerView(
                    size: .medium,
                    type: .outlined,
                    state: .disabled,
                    shape: .rounded,
                    axis: .vertical,
                    theme: theme,
                    contentPadding: .medium,
                    outlineColor: .neutralLow
                ) {
                    UBCardView(icon: Image(systemName: "lock.fill"),
                               title: "Out of Stock",
                               subtitle: "Out of store",
                               description: "Delivery over $50",
                               textColor: .neutralLow,
                               tintColor: Color(UBTheme.applyBackgroundPrimaryColor(theme: theme)))
                },
                section: section,
                row: row
            )
        }
    }
    
    func getInteractiveComponent(section: Int, row: Int, theme: UBTheme = .current) -> some View {
        switch UBCardSelectionMode.allCases[row] {
        case .outline:
            InteractiveCardComponent(
                section: section,
                row: row,
                theme: theme,
                selectionMode: .outline
            )
        default:
            InteractiveCardComponent(
                section: section,
                row: row,
                theme: theme,
                selectionMode: .background
            )
        }
    }
    
    struct InteractiveCardComponent: View {
        let section: Int
        let row: Int
        let theme: UBTheme
        let selectionMode: UBCardSelectionMode
        
        @State private var isSelected: Bool = false
        
        var body: some View {
            
            UBCardContainerView(
                size: .small,
                type: .outlined,
                state: cardState,
                shape: .rounded,
                axis: .vertical,
                theme: theme,
                contentPadding: .small,
                outlineColor: outlineColor,
                onTap: { isSelected.toggle() }
            ) {
                UBCardView(
                    icon: Image(systemName: "bolt.fill"),
                    title: "Pick up",
                    subtitle: "Free",
                    description: "Shipping with $35",
                    textColor: textColor,
                    tintColor: tintColor
                )
            }
        }
        
        
        // MARK: - Dynamic Values Based on Mode
        
        private var outlineColor: UBCardOutlineColor {
            switch selectionMode {
            case .outline:
                return isSelected ? .primary : .neutralLow
            case .background:
                return .neutralLow
            }
        }
        
        private var cardState: UBCardState {
            switch selectionMode {
            case .outline:
                return .normal
            case .background:
                return isSelected ? .selectedBackgroundPrimary : .normal
            }
        }
        
        private var textColor: TextColorType {
            switch selectionMode {
            case .outline:
                return .neutralLow
            case .background:
                return isSelected ? .neutralHighInverse : .neutralLow
            }
        }
        
        private var tintColor: Color {
            switch selectionMode {
            case .outline:
                return Color(UBTheme.applyBackgroundPrimaryColor(theme: theme))
            case .background:
                return isSelected
                ? Color(UBTheme.applyBackgroundBaselineColor(theme: theme))
                : Color(UBTheme.applyBackgroundPrimaryColor(theme: theme))
            }
        }
    }
}
