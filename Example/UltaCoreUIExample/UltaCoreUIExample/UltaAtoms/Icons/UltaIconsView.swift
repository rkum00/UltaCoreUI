//
//  UltaIconsView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 20/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaIconsView: View {
    
    let presenter: UltaIconsPresenter
    let optionType: OptionsPageType
    let theme: UBTheme
    
    init(theme: UBTheme = UBTheme.current, optionType: OptionsPageType) {
        self.theme = theme
        self.presenter = UltaIconsPresenter(theme: theme)
        self.optionType = optionType
    }
    
    private let columns = [
        GridItem(.adaptive(minimum: UBGlobal.sizeWidthMinW700), spacing: UBGlobal.space400)
    ]
    
    var body: some View {
        ScrollView {
            LazyVStack(alignment: .leading, spacing: UBGlobal.space200) {
                ForEach(0..<presenter.numberOfSections, id: \.self) { section in
                    Section(
                        header: sectionHeader(section: section)) {
                            LazyVGrid(columns: columns, spacing: UBGlobal.space600) {
                                ForEach(0..<presenter.getRowsCount(for: section), id: \.self) { row in
                                    UltaIconsRowView(
                                        iconName: presenter.getComponentName(row: row, section: section),
                                        icon: presenter.getIcon(row: row, section: section),
                                        tintColor: presenter.getTintColor(row: row, section: section),
                                        section: section,
                                        row: row
                                    )
                                }
                            }
                            .padding(UBGlobal.space200)
                            .background(section == 0 ? Color.clear : Color.white)
                        }
                }
            }
            .padding(.vertical, UBGlobal.space400)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("\(optionType.rawValue) Options")
    }
    
    private func sectionHeader(section: Int) -> some View {
        Text(presenter.getSectionTitle(section: section))
            .font(.footnote)
            .fontWeight(.semibold)
            .foregroundColor(Color(.secondaryLabel))
            .textCase(.uppercase)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal, UBGlobal.space400)
            .padding(.vertical, UBGlobal.space200)
    }
}
