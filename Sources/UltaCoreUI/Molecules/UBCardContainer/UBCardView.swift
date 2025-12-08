//
//  UBCardView.swift
//
//
//  Created by Rakesh Kumar on 05/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
public struct UBCardView: View {
    let icon: Image?
    let title: String
    let subtitle: String
    let description: String
    let textColor: TextColorType
    let tintColor: Color
    
    
    public init(icon: Image?, title: String, subtitle: String, description: String, textColor: TextColorType = .neutralLow, tintColor: Color) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.description = description
        self.tintColor = tintColor
        self.textColor = textColor
    }
    
    public var body: some View {
        if let icon {
            icon
                .resizable()
                .renderingMode(.template)
                .foregroundColor(tintColor)
                .scaledToFit()
                .frame(width: UBGlobal.sizeWidth600, height: UBGlobal.sizeHeight600)
        }
        UBText(textAttribute: TextAttributes(text: title,
                                             color: textColor,
                                             fontSize: .medium,
                                             textAlign: .center,
                                             fontWeight: .bold))
        UBText(textAttribute: TextAttributes(text: subtitle,
                                             color: textColor,
                                             fontSize: .small,
                                             textAlign: .center,
                                             fontWeight: .regular))
        UBText(textAttribute: TextAttributes(text: description,
                                             color: textColor,
                                             fontSize: .small,
                                             textAlign: .center,
                                             fontWeight: .regular))
    }
}
