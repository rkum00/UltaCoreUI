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
    let type: UBBannerType
    let iconName: String
    let textColor: TextColorType
    let backgroundColor: Color
    let theme: UBTheme
    let onClose: ((UBBannerType) -> Void)?

    public init(
        title: String,
        message: String?,
        type: UBBannerType,
        iconName: String,
        textColor: TextColorType,
        backgroundColor: Color,
        theme: UBTheme = .current,
        onClose: ((UBBannerType) -> Void)?
    ) {
        self.title = title
        self.message = message
        self.type = type
        self.iconName = iconName
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.theme = theme
        self.onClose = onClose
    }

    public var body: some View {
        HStack(alignment: .top, spacing: UBGlobal.space300) {
            Image(systemName: iconName)
                .foregroundColor(.white)
                .font(.title)

            VStack(alignment: .leading, spacing: UBGlobal.space100) {
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
                Button {
                    onClose(type)
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding(UBGlobal.space200)
                }
                .buttonStyle(.plain)
            }
        }
        .contentShape(Rectangle())
        .padding()
        .background(backgroundColor)
        .cornerRadius(UBGlobal.borderRadius300)
        .shadow(radius: UBGlobal.borderRadius100)
        .padding(.horizontal)
    }
}

