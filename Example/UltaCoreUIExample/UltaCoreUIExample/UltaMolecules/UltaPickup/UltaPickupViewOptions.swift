//
//  UltaPickupViewOptions.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 05/01/26.
//

import Foundation
import UltaCoreUI
import SwiftUI

enum UltaPickupViewOptions: String, CaseIterable {
    case options = "Pickup Options"
    case deals = "Deals Options"
    case delivery = "Delivery Options"
    
    func numberOfRows() -> Int {
        switch self {
        case .options, .deals, .delivery:
            return cardData.count
        }
    }
    
    var gridSize: CGSize {
        return CGSize(width: (UBGlobal.sizeWidthMinW1200 + UBGlobal.sizeWidthMinW20), height: (UBGlobal.sizeHeightMaxH1800 + UBGlobal.sizeHeightMaxH200))
    }
    
    var cardData: [UltaCardData] {
        return [UltaCardData(title: "Ship", subTitle: "Free", description: "Shipping with $35", imageName: StyleDictionaryGlobalEnumIcons.wifiOutline24.rawValue),
                UltaCardData(title: "Pickup", subTitle: "Free Same", description: "delivery over $50", imageName: StyleDictionaryGlobalEnumIcons.warningOutlined24.rawValue),
                UltaCardData(title: "SameDay", subTitle: "Free", description: "Free instore pickup", imageName: StyleDictionaryGlobalEnumIcons.wifiOutline24.rawValue),
                UltaCardData(title: "Ship", subTitle: "Free", description: "Shipping with $35", imageName: StyleDictionaryGlobalEnumIcons.warningOutlined24.rawValue),
                UltaCardData(title: "Pickup", subTitle: "Free Same", description: "delivery over $50", imageName: StyleDictionaryGlobalEnumIcons.wifiOutline24.rawValue),
                UltaCardData(title: "SameDay", subTitle: "Free", description: "Free instore pickup", imageName: StyleDictionaryGlobalEnumIcons.wifiOutline24.rawValue)]
    }
    
    func getPickupOptionsComponent(section: Int, row: Int, theme: UBTheme = .current) -> some View {
        InteractiveCardComponent(
            section: section,
            row: row,
            theme: theme,
            selectionMode: .outline
        )
    }
    
    struct InteractiveCardComponent: View, UBImages {
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
                    icon: getImageView(name: UltaPickupViewOptions.options.cardData[row].imageName ?? ""),
                    title: UltaPickupViewOptions.options.cardData[row].title,
                    subtitle: UltaPickupViewOptions.options.cardData[row].subTitle,
                    description: UltaPickupViewOptions.options.cardData[row].description,
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
                return isSelected ? Color(UBTheme.applyBackgroundPrimaryColor(theme: theme)) : Color(UBTheme.applyOutlineDisabledColor(theme: theme))
            case .background:
                return isSelected
                ? Color(UBTheme.applyBackgroundBaselineColor(theme: theme))
                : Color(UBTheme.applyBackgroundPrimaryColor(theme: theme))
            }
        }
    }
}

struct UltaCardData {
    let title: String
    let subTitle: String
    let description: String
    let imageName: String?
}
