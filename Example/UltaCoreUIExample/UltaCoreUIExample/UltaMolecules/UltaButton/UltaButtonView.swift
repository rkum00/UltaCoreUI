//
//  UltaButtonView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 22/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaButtonView: View {
    @StateObject private var presenter: UltaButtonViewPresenter = UltaButtonViewPresenter()
    
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
                            UltaButtonRowView(buttonView: presenter.getComponent(row: row, section: section, theme: theme, action: {
                                presenter.activeAlert = ButtonAlert(id: 0, title: "Title for row: \(row)", message: "Message for section: \(section)")
                            }))
                            .listRowBackground(getListRowBackground(row: row))
                        }
                    }
                    .listRowSeparator(.hidden)
                }
            }
            .listStyle(GroupedListStyle())
        }
        .navigationTitle("\(optionType.rawValue) Options")
        .alert(item: $presenter.activeAlert) { alert in
            Alert(
                title: Text(alert.title),
                message: Text(alert.message),
                dismissButton: .default(Text("OK")) {
                    presenter.activeAlert = nil
                }
            )
        }
    }
    
    private func sectionHeader(section: Int) -> some View {
        return Text(presenter.getSectionTitle(section: section))
    }
    
    private func getListRowBackground(row: Int) -> Color {
        if row == 7 {
            return Color.black
        }
        return Color.white
    }
}
