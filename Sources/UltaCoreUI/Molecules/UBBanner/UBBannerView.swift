//
//  UBBannerView.swift
//
//
//  Created by Rakesh Kumar on 15/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
public struct UBBannerView: View {
    let title: String
    let message: String?
    let iconName: String
    let textColor: TextColorType
    let backgroundColor: Color
    let theme: UBTheme
    let onClose: (() -> Void)?
    
    public init(title: String,
                message: String?,
                iconName: String,
                textColor: TextColorType,
                backgroundColor: Color,
                theme: UBTheme = .current,
                onClose: (() -> Void)?) {
        self.title = title
        self.message = message
        self.iconName = iconName
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.theme = theme
        self.onClose = onClose
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: iconName)
                .foregroundColor(.white)
                .font(.title)
            
            VStack(alignment: .leading, spacing: 4) {
                UBText(textAttribute: TextAttributes(
                    text: title,
                    color: textColor,
                    fontSize: .xlarge,
                    fontWeight: .bold
                ))
                
                if let message {
                    UBText(textAttribute: TextAttributes(
                        text: message,
                        color: textColor,
                        fontSize: .small,
                        fontWeight: .regular
                    ))
                }
            }
            
            Spacer()
            
            if let onClose {
                Button(action: onClose) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding(8)
                }
                .buttonStyle(.plain)
            }
        }
        .contentShape(Rectangle())
        .onTapGesture {
            print("Banner tapped")
        }
        .padding()
        .background(backgroundColor)
        .cornerRadius(14)
        .shadow(radius: 5)
        .padding(.horizontal)
    }
}
