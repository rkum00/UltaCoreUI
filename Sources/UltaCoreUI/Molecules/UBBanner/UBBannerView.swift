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
    let textColor: TextColorType
    let theme: UBTheme
    let onClose: ((UBBannerType) -> Void)?

    public init(
        title: String,
        message: String?,
        type: UBBannerType,
        textColor: TextColorType,
        theme: UBTheme = .current,
        onClose: ((UBBannerType) -> Void)?
    ) {
        self.title = title
        self.message = message
        self.type = type
        self.textColor = textColor
        self.theme = theme
        self.onClose = onClose
    }

    public var body: some View {
        HStack(alignment: .top, spacing: UBGlobal.space300) {
            Image(systemName: type.iconName)
                .renderingMode(.template)
                .resizable()
                .scaledToFit()
                .frame(
                    width: UBGlobal.sizeWidth600,
                    height: UBGlobal.sizeHeight600
                )
                .foregroundColor(.white)

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
                    Image(systemName: type.crossicon)
                        .renderingMode(.template)
                        .resizable()
                        .scaledToFit()
                        .frame(
                            width: UBGlobal.sizeWidth400,
                            height: UBGlobal.sizeHeight400
                        )
                        .foregroundColor(.white)
                        .fixedSize()
                }
                .buttonStyle(.plain)
            }
        }
        .contentShape(Rectangle())
        .padding()
        .background(type.backgroundColor)
        .cornerRadius(UBGlobal.borderRadius300)
        .shadow(radius: UBGlobal.borderRadius100)
        .padding(.horizontal)
    }
}

