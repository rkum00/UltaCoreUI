//
//  UltaBannerViewPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 15/12/25.
//

import Foundation
import SwiftUI
import UltaCoreUI


class UltaBannerViewPresenter: ObservableObject {
    
    var theme: UBTheme
    
    public init(theme: UBTheme = UBTheme.current) {
        self.theme = theme
    }
    
    var numberOfSections: Int {
        return UltaBannerViewOptions.allCases.count
    }
    
    func getRowsCount(for section: Int) -> Int {
        return UltaBannerViewOptions.allCases[section].numberOfRows()
    }
    
    func getComponent(row: Int, section: Int, onClose: ((UBBannerType)->Void)? = nil) -> UBBannerView {
        switch UltaBannerViewOptions.allCases[section] {
        case .background:
            UltaBannerViewOptions.background.getBackgroundColorComponent(
                section: section,
                row: row,
                theme: theme,
                onClose: onClose
            )
        case .autoDismiss:
            UltaBannerViewOptions.autoDismiss.getAutoDismissalComponent(section: section, row: row, theme: theme, onClose: onClose)
        default:
            UBBannerView(title: "Title", message: "Message", type: .info, textColor: .neutralLow, theme: theme, onClose: nil)
        }
    }
    
    func getSectionTitle(section: Int) -> String {
        return UltaBannerViewOptions.allCases[section].rawValue
    }
}
