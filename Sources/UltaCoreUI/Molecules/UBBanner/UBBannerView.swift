//
//  UBBannerView.swift
//
//
//  Created by Rakesh Kumar on 15/12/25.
//

import SwiftUI

/*
@available(iOS 15.0, *)
public struct UBBannerView: View {
    let title: String
    let message: String?
    let type: UBBannerType
    let textColor: TextColorType
    let duration: TimeInterval?
    let theme: UBTheme
    let onClose: ((UBBannerType) -> Void)?
    
    @State private var isVisible: Bool = true
    
    public init(
        title: String,
        message: String?,
        type: UBBannerType,
        textColor: TextColorType,
        duration: TimeInterval? = nil,
        theme: UBTheme = .current,
        onClose: ((UBBannerType) -> Void)?
    ) {
        self.title = title
        self.message = message
        self.type = type
        self.textColor = textColor
        self.duration = duration
        self.theme = theme
        self.onClose = onClose
    }
    
    public var body: some View {
        if isVisible {
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
                        dismissBanner()
                    } label: {
                        ZStack {
                            Image(systemName: type.crossicon)
                                .renderingMode(.template)
                                .resizable()
                                .scaledToFit()
                                .frame(
                                    width: UBGlobal.sizeWidth400,
                                    height: UBGlobal.sizeHeight400
                                )
                                .scaleEffect(UBGlobal.fontLineHeight25)
                                .foregroundColor(.white)
                        }
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
            .onAppear {
                if let duration {
                    DispatchQueue.main.asyncAfter(deadline: .now() + duration) {
                        dismissBanner()
                    }
                }
            }
        }
    }
    
    private func dismissBanner() {
        withAnimation {
            isVisible = false
            onClose?(type)
        }
    }
}
*/
@available(iOS 15.0, *)
public struct UBBannerView: View {
    let title: String
    let message: String?
    let type: UBBannerType
    let textColor: TextColorType
    let duration: TimeInterval?
    let theme: UBTheme
    let onClose: ((UBBannerType) -> Void)?
    
    @State private var isVisible = true
    
    public init(
        title: String,
        message: String?,
        type: UBBannerType,
        textColor: TextColorType,
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
    }
    
    public var body: some View {
        if isVisible {
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
            .transition(.slideFadeFromTop)
            .animation(.easeInOut(duration: 0.3), value: isVisible)
            .task {
                await autoDismiss()
            }
        }
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
    
    func autoDismiss() async {
        guard let duration else { return }
        try? await Task.sleep(nanoseconds: UInt64(duration * 1_000_000_000))
        dismissBanner()
    }
    
    func dismissBanner() {
        guard isVisible else { return }
        withAnimation {
            isVisible = false
            onClose?(type)
        }
    }
}

@available(iOS 13.0, *)
private extension AnyTransition {
    static var slideFadeFromTop: AnyTransition {
        .asymmetric(
            insertion: .move(edge: .top).combined(with: .opacity),
            removal: .move(edge: .top).combined(with: .opacity)
        )
    }
}
