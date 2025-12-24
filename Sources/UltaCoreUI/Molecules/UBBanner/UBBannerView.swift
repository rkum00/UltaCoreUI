//
//  UBBannerView.swift
//
//
//  Created by Rakesh Kumar on 15/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
public struct UBBannerView: View, UBImages {
    let title: String
    let message: String?
    let type: UBBannerType
    let textColor: TextColorType
    var leadingIcon: Image? = nil
    var trailingIcon: Image? = nil
    let duration: TimeInterval?
    let theme: UBTheme
    let onClose: ((UBBannerType) -> Void)?
    
    @State private var isVisible = false
    
    public init(
        title: String,
        message: String?,
        type: UBBannerType,
        textColor: TextColorType,
        leading: Slot? = nil,
        trailing: Slot? = nil,
        duration: TimeInterval? = nil,
        theme: UBTheme = .current,
        onClose: ((UBBannerType) -> Void)? = nil
    ) {
        self.title = title
        self.message = message
        self.type = type
        self.textColor = textColor
        self.duration = duration
        self.theme = theme
        self.onClose = onClose
        
        if let leadingImage = getSlotImage(slot: leading) {
            leadingIcon = leadingImage
        }
        if let trailingImage = getSlotImage(slot: trailing) {
            trailingIcon = trailingImage
        }
    }
    
    public var body: some View {
        HStack(alignment: .top, spacing: UBGlobal.space300) {
            iconView
            textContent
            Spacer()
            closeButton
        }
        .padding()
        .background(type.getBackgroundColor(theme: theme))
        .cornerRadius(UBGlobal.borderRadius300)
        .shadow(radius: UBGlobal.borderRadius100)
        .padding(.horizontal)
        .offset(y: isVisible ? UBGlobal.space0 : -(UBGlobal.space2000))
        .opacity(Double(isVisible ? UBGlobal.opacity1000 : UBGlobal.opacity0))
        .animation(.bannerSpring, value: isVisible)
        .task {
            withAnimation(.bannerSpring) {
                isVisible = true
            }
            await autoDismiss()
        }
    }
}

@available(iOS 15.0, *)
private extension UBBannerView {
    var iconView: some View {
        leadingIcon?
            .renderingMode(.template)
            .scaledToFit()
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
                trailingIcon?
                    .renderingMode(.template)
                    .scaledToFit()
                    .scaleEffect(UBGlobal.fontLineHeight25)
                    .foregroundColor(.white)
            }
            .buttonStyle(.plain)
        }
    }
}

@available(iOS 15.0, *)
private extension UBBannerView {
    func autoDismiss() async {
        guard let duration else { return }
        try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
        dismissBanner()
    }
    
    func dismissBanner() {
        guard isVisible else { return }
        withAnimation(.bannerSpring) {
            isVisible = false
            onClose?(type)
        }
    }
    
    private func getSlotImage(slot: Slot?) ->Image? {
        if let leading = slot?.imageName,
           let uiImage = getImageView(name: leading) {
            return uiImage
        }
        return nil
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
