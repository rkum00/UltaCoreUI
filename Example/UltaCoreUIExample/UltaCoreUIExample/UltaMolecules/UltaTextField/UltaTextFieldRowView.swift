//
//  UltaTextFieldRowView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 29/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaTextFieldRowView: View {
    let textFieldView: UBTextField
    
    public init(textFieldView: UBTextField) {
        self.textFieldView = textFieldView
    }
    
    var body: some View {
        VStack {
            textFieldView
        }
        .padding(UBGlobal.space400)
    }
}
