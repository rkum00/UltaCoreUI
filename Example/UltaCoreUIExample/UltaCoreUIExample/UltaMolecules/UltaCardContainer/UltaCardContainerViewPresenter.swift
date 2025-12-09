//
//  UltaCardContainerViewPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 04/12/25.
//

import UltaCoreUI
import Foundation
import SwiftUI

class UltaCardContainerViewPresenter: ObservableObject {
    
    var theme: UBTheme
    
    public init(theme: UBTheme = UBTheme.current) {
        self.theme = theme
    }
    
    var numberOfSections: Int {
        return UltaCardContainerViewOptions.allCases.count
    }
    
    func getRowsCount(for section: Int) -> Int {
        return UltaCardContainerViewOptions.allCases[section].numberOfRows()
    }
    
    @ViewBuilder
    func getComponent(row: Int, section: Int) -> some View {
        switch UltaCardContainerViewOptions.allCases[section] {
        case .size:
            UltaCardContainerViewOptions.size.getSizeComponent(
                section: section,
                row: row,
                theme: theme
            )
        case .padding:
            UltaCardContainerViewOptions.size.getPaddingComponent(
                section: section,
                row: row,
                theme: theme
            )
        case .background:
            UltaCardContainerViewOptions.size.getBackgroundColorComponent(
                section: section,
                row: row,
                theme: theme
            )
        case .interactive:
            UltaCardContainerViewOptions.size.getInteractiveComponent(
                section: section,
                row: row,
                theme: theme
            )
        default:
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
                    UBText(
                        textAttribute: TextAttributes(
                            text: "Card Container",
                            color: .neutralHighInverse,
                            fontSize: .medium,
                            textAlign: .center,
                            fontWeight: .regular
                        )
                    )
                },
                section: section,
                row: row
            )
        }
    }
    
    func getSectionTitle(section: Int) -> String {
        return UltaCardContainerViewOptions.allCases[section].rawValue
    }
}
