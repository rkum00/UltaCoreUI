//
//  UltaButtonViewPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 22/12/25.
//

import Foundation
import UltaCoreUI
import SwiftUI

// MARK: - Model
struct ButtonAlert: Identifiable {
    let id: Int
    let title: String
    let message: String
}

class UltaButtonViewPresenter: ObservableObject {
    // State for which alert to show
    @Published var activeAlert: ButtonAlert?
    
    var theme: UBTheme = .current
    
    var numberOfSections: Int {
        return UltaButtonViewOptions.allCases.count
    }
    
    func getRowsCount(for section: Int) -> Int {
        return UltaButtonViewOptions.allCases[section].numberOfRows()
    }
    
    func getComponent(row: Int, section: Int, theme: UBTheme = UBTheme.current, action: @escaping () -> Void) -> UBButton {
        switch UltaButtonViewOptions.allCases[section] {
        case .topDescription:
            return UBButton(label: "", variant: .filledPrimary, action: {})
        case .color:
            return UltaButtonViewOptions.color.getColorComponent(row: row, theme: theme, text: ButtonColorOptions.allCases[row].rawValue.capitalized, image: nil, action: action)
        case .disabled:
            return UltaButtonViewOptions.disabled.getDisabledComponent(row: row, theme: theme, text: ButtonColorOptions.allCases[row].rawValue.capitalized, image: nil, action: action)
        case .size:
            return UltaButtonViewOptions.size.getSizeComponent(row: row, theme: theme, text: ButtonSize.allCases[row].rawValue.capitalized, image: nil, action: action)
        case .buttonWithIcons:
            return UltaButtonViewOptions.size.getButtonWithIcons(row: row, theme: theme, action: action)
        case .width:
            return UltaButtonViewOptions.width.getWidthOptions(row: row, theme: theme, action: action)
        case .ada:
            return UltaButtonViewOptions.ada.getAdaOptions(row: row, theme: theme, action: action)
        }
    }
    
    func getSectionTitle(section: Int) -> String {
        return UltaButtonViewOptions.allCases[section].rawValue
    }
}
