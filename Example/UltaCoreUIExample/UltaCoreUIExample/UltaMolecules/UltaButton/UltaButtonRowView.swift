//
//  UltaButtonRowView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 22/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaButtonRowView: View {
    var buttonView: UBButton
    
    public init(buttonView: UBButton) {
        self.buttonView = buttonView
    }
    
    var body: some View {
        HStack {
            buttonView.frame(height: 48)
        }
    }
}
