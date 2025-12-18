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
        case .ubText:
            UltaTextView(theme: theme, optionType: .ubText)
        case .ubCardContainer:
            UltaCardContainerView(theme: theme, optionType: .ubCardContainer)
        case .ubBanner:
            UltaBannerView(theme: theme, optionType: .ubBanner)
        case .ubLoader:
            UltaLoaderView(theme: theme, optionType: .ubLoader)
        default:
            Text(theme.rawValue)
        }
    }
}

