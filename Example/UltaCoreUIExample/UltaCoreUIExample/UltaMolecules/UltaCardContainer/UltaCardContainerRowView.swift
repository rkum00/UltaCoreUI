//
//  UltaCardContainerRowView.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 04/12/25.
//

import SwiftUI
import UltaCoreUI

struct UltaCardContainerRowView: View {
    
    var ubText: UBText
    
    var section: Int
    var row: Int
    
    var shouldRemoveFrameHeight: Bool = false
    
    public init(ubText: UBText,
                section: Int,
                row: Int
    ) {
        if (section == 4) || (section == 7) || (section == 8) {
            shouldRemoveFrameHeight = true
        }
        self.ubText = ubText
        self.section = section
        self.row = row
    }
    
    var delegate: UltaTextRowViewDelegate?
    
    var body: some View {
        VStack {
            if shouldRemoveFrameHeight {
                ubText
            } else {
                ubText.frame(height: 8)
            }
        }
    }
}
