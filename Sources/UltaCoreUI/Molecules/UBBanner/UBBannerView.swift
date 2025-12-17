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
    let duration: TimeInterval
    let autoDismiss: Bool
    let theme: UBTheme
    let onClose: ((UBBannerType) -> Void)?
    
    @State private var isVisible = false
    
    public init(
        title: String,
        message: String?,
        type: UBBannerType,
        textColor: TextColorType,
        duration: TimeInterval,
        autoDismiss: Bool = false,
        theme: UBTheme = .current,
        onClose: ((UBBannerType) -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.type = type
        self.textColor = textColor
        self.duration = duration
        self.autoDismiss = autoDismiss
        self.theme = theme
        self.onClose = onClose
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: UBGlobal.space300) {
            iconView
            textContent
            Spacer()
            closeButton
        }
        .padding()
        .background(type.backgroundColor)
        .cornerRadius(UBGlobal.borderRadius300)
        .shadow(radius: UBGlobal.borderRadius100)
        .padding(.horizontal)
        .onAppear{
            withAnimation(.bannerSpring) {
                isVisible = true
            }
            if autoDismiss {
                Task {
                    await scheduleAutoDismiss()
                }
            }
        }
        .offset(y: isVisible ? UBGlobal.space0 : -(UBGlobal.space2000))
        .opacity(Double(isVisible ? UBGlobal.opacity1000 : UBGlobal.opacity0))
    }
}

@available(iOS 15.0, *)
private extension UBBannerView {
    
    var iconView: some View {
        Image(systemName: type.iconName)
            .resizable()
            .scaledToFit()
            .frame(
                width: UBGlobal.sizeWidth600,
                height: UBGlobal.sizeHeight600
            )
            .foregroundColor(.white)
    }
    
    var textContent: some View {
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
    }
    
    @ViewBuilder
    var closeButton: some View {
        if onClose != nil {
            Button(action: dismissBanner) {
                Image(systemName: type.crossicon)
                    .resizable()
                    .scaledToFit()
                    .frame(
                        width: UBGlobal.sizeWidth400,
                        height: UBGlobal.sizeHeight400
                    )
                    .scaleEffect(UBGlobal.fontLineHeight25)
                    .foregroundColor(.white)
            }
            .buttonStyle(.plain)
        }
    }
}

@available(iOS 15.0, *)
private extension UBBannerView {
    func showBanner() {
        withAnimation(.bannerSpring) {
            isVisible = true
        }
    }
    
    func scheduleAutoDismiss() async {
        try? await Task.sleep(
            nanoseconds: UInt64(duration * 1_000_000_000)
        )
        dismissBanner()
    }
    
    func dismissBanner() {
        guard isVisible else { return }
        withAnimation(.bannerSpring) {
            isVisible = false
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.45) {
            onClose?(type)
        }
    }
}

@available(iOS 13.0, *)
private extension Animation {
    static let bannerSpring = Animation.spring(
        response: 0.45,
        dampingFraction: 0.85,
        blendDuration: 0.25
    )
}
