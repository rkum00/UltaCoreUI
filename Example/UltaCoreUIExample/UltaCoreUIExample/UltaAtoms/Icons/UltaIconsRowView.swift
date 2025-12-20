//
//  UltaIconsRowView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 20/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaIconsRowView: View {
    let iconName: String
    let section: Int
    let row: Int
    
    public init(iconName: String, section: Int, row: Int) {
        self.iconName = iconName
        self.section = section
        self.row = row
    }
    
    var body: some View {
        UBText(textAttribute: TextAttributes(text: iconName))
            .frame(height: 30)
    }
}
