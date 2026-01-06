//
//  UltaThemeOptionsRouter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 03/12/25.
//

import SwiftUI
import UltaCoreUI

final class UltaOptionsThemeRouter {
    @ViewBuilder
    func makeDetailView(selectedPageOption: OptionsPageType, for theme: UBTheme) -> some View {
        switch selectedPageOption {
        case .colors:
            UltaColorsView(theme: theme, optionType: .colors)
        case .fonts:
            UltaFontsView(theme: theme, optionType: .fonts)
        case .icons:
            UltaIconsView(theme: theme, optionType: .icons)
        case .ubText:
            UltaTextView(theme: theme, optionType: .ubText)
        case .ubButton:
            UltaButtonView(theme: theme, optionType: .ubButton)
        case .ubCardContainer:
            UltaCardContainerView(theme: theme, optionType: .ubCardContainer)
        case .ubBanner:
            UltaBannerView(theme: theme, optionType: .ubBanner)
        case .ubLoader:
            UltaLoaderView(theme: theme, optionType: .ubLoader)
        case .ubTextField:
            UltaTextFieldView(theme: theme, optionType: .ubTextField)
        case .ubPickup:
            UltaPickupView(theme: theme, optionType: .ubPickup)
        }
    }
}

