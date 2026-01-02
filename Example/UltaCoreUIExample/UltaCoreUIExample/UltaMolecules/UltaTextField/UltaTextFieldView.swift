//
//  UltaTextFieldView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 29/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaTextFieldView: View {
    @StateObject private var presenter: UltaTextFieldViewPresenter = UltaTextFieldViewPresenter()
    
    let optionType: OptionsPageType
    let theme: UBTheme
    
    init(theme: UBTheme = UBTheme.current, optionType: OptionsPageType) {
        self.theme = theme
        self.optionType = optionType
    }
    
    var body: some View {
        HStack {
            List {
                ForEach(0..<presenter.numberOfSections, id: \.self) { section in
                    Section(header: sectionHeader(section: section)) {
                        ForEach(0..<presenter.getRowsCount(for: section), id: \.self) { row in
                            UltaTextFieldRowView(textFieldView: presenter.getComponent(row: row, section: section, theme: theme))
                                .listRowInsets(EdgeInsets())
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(GroupedListStyle())
            .scrollDismissesKeyboard(.interactively)
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: UBGlobal.space1100)
            }
        }
        .navigationTitle("\(optionType.rawValue) Options")
    }
    
    private func sectionHeader(section: Int) -> some View {
        return Text(presenter.getSectionTitle(section: section))
    }
}
