//
//  UltaFontsRowView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 19/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaFontsRowView: View {
    let title: AttributedString
    let familyName: String
    let fontSize: CGFloat
    let textColor: Color
    let section: Int
    let row: Int
    
    public init(title: AttributedString, familyName: String, fontSize: CGFloat, textColor: Color, section: Int, row: Int) {
        self.title = title
        self.familyName = familyName
        self.fontSize = fontSize
        self.textColor = textColor
        self.section = section
        self.row = row
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30) {
            Text(title)
                .font(.custom(familyName, size: fontSize))
                .foregroundColor(textColor)
            Text("\(familyName)" + ", \(fontSize)")
        }
    }
}
