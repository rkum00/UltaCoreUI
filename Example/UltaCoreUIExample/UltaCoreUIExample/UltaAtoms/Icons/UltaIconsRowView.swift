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
    let icon: Image
    let section: Int
    let row: Int
    
    public init(iconName: String, icon: Image, section: Int, row: Int) {
        self.iconName = iconName
        self.icon = icon
        self.section = section
        self.row = row
    }
    
    var body: some View {
        VStack(alignment: .center, spacing: 30) {
            icon
            UBText(textAttribute: TextAttributes(text: iconName))
        }
    }
}
