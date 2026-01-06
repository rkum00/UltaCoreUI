//
//  UltaPickupView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 05/01/26.
//

import SwiftUI
import UltaCoreUI

struct UltaPickupView: View {
    
    let presenter: UltaPickupPresenter
    let optionType: OptionsPageType
    let theme: UBTheme
    
    // MARK: - Layout Constants
    private let cardWidth: CGFloat = UltaPickupViewOptions.options.gridSize.width
    private let cardHeight: CGFloat = UltaPickupViewOptions.options.gridSize.height
    
    init(theme: UBTheme = UBTheme.current, optionType: OptionsPageType) {
        self.theme = theme
        self.presenter = UltaPickupPresenter(theme: theme)
        self.optionType = optionType
    }
    
    var body: some View {
        ScrollView(.vertical) {
            LazyVStack(alignment: .leading, spacing: UBGlobal.space200) {
                
                ForEach(0..<presenter.numberOfSections, id: \.self) { section in
                    Section(header: sectionHeader(section: section)) {
                        
                        ScrollView(.horizontal, showsIndicators: false) {
                            LazyVGrid(
                                columns: presenter.getColumns(for: section),
                                spacing: UBGlobal.space600
                            ) {
                                ForEach(
                                    0..<presenter.getRowsCount(for: section),
                                    id: \.self
                                ) { row in
                                    UltaPickupRowView(
                                        ubCardContainer: presenter.getComponent(
                                            row: row,
                                            section: section
                                        ),
                                        section: section,
                                        row: row
                                    )
                                    .frame(
                                        width: cardWidth,
                                        height: cardHeight
                                    )
                                }
                            }
                            .padding(UBGlobal.space400)
                        }
                        .frame(
                            height: cardHeight + (UBGlobal.space600)
                        )
                        .background(Color.white)
                    }
                }
            }
            .padding(.vertical, UBGlobal.space400)
        }
        .background(Color(.systemGroupedBackground))
        .navigationTitle("\(optionType.rawValue) Options")
    }
    
    // MARK: - Section Header
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
