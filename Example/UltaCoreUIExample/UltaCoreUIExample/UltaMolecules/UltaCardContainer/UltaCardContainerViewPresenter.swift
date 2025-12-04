//
//  UltaCardContainerViewPresenter.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 04/12/25.
//

import UltaCoreUI
import Foundation

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
    
    func getComponent(row: Int, section: Int, isTapped: Bool = false) -> UBText {
        switch UltaCardContainerViewOptions.allCases[section] {
        default: UBText(textAttribute: TextAttributes(text: "Card Container"))
        }
    }
    
    func getSectionTitle(section: Int) -> String {
        return UltaCardContainerViewOptions.allCases[section].rawValue
    }
}
