//
//  UltaColorsRowView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 18/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaColorsRowView: View {
    let name: String
    let section: Int
    let row: Int
    
    public init(name: String, section: Int, row: Int) {
        self.name = name
        self.section = section
        self.row = row
    }
    
    var body: some View {
        UBText(textAttribute: TextAttributes(text: name))
            .frame(height: 30)
    }
}
