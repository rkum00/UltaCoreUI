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
    
    public init(icon: Image?, title: String, subtitle: String, description: String) {
        self.icon = icon
        self.title = title
        self.subtitle = subtitle
        self.description = description
    }
    
    public var body: some View {
        if let icon {
            icon
                .resizable()
                .scaledToFit()
                .frame(width: UBGlobal.sizeWidth600, height: UBGlobal.sizeHeight600)
        }
        UBText(textAttribute: TextAttributes(text: title,
                                             color: .neutralHighInverse,
                                             fontSize: .small,
                                             textAlign: .center))
        UBText(textAttribute: TextAttributes(text: subtitle,
                                             color: .neutralHighInverse,
                                             fontSize: .medium,
                                             textAlign: .center))
        UBText(textAttribute: TextAttributes(text: description,
                                             color: .neutralHighInverse,
                                             fontSize: .large,
                                             textAlign: .center))
    }
}
