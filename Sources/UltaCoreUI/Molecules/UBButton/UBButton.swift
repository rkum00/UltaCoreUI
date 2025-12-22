//
//  UBButton.swift
//
//
//  Created by Rakesh Kumar on 22/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
public struct UBButton: View, UBImages {
    // MARK: Parameters
    var label: String
    var disabled: Bool
    var variant: UBButtonVariants
    var size: ButtonSize
    var fullWidth: Bool
    var leadingIcon: Image? = nil
    var trailingIcon: Image? = nil
    var theme: UBTheme
    var fontSize: TextFontSize
    var accessibilityInfo: UBButtonAccessibilityInfo?
    var accessibilityTraits: AccessibilityTraits = AccessibilityTraits.isButton
    var action: () -> Void
    
    // MARK: State for press animation
    @GestureState private var isPressed = false
    
    public init(
        label: String,
        disabled: Bool = false,
        variant: UBButtonVariants,
        size: ButtonSize = .medium,
        fullWidth: Bool = false,
        leading: Slot? = nil,
        trailing: Slot? = nil,
        theme: UBTheme = .current,
        fontSize: TextFontSize = .large,
        accessibilityInfo: UBButtonAccessibilityInfo? = nil,
        accessibilityTraits: AccessibilityTraits = AccessibilityTraits.isButton,
        action: @escaping () -> Void
    ) {
        self.label = label
        self.disabled = disabled
        self.variant = variant
        self.size = size
        self.fullWidth = fullWidth
        self.theme = theme
        self.fontSize = fontSize
        self.accessibilityInfo = accessibilityInfo
        self.accessibilityTraits = accessibilityTraits
        self.action = action
        if let leadingImage = getSlotImage(slot: leading) {
            leadingIcon = Image(uiImage: leadingImage)
        }
        if let trailingImage = getSlotImage(slot: trailing) {
            trailingIcon = Image(uiImage: trailingImage)
        }
    }
    
    // MARK: - Main View
    public var body: some View {
        let gesture = DragGesture(minimumDistance: 0)
            .updating($isPressed) { _, state, _ in state = true }
        
        Button(action: action) {
            HStack() {
                leadingIcon?
                    .renderingMode(.template)
                    .foregroundColor(variant.getForegroundColor(theme: theme, disabled: disabled).getForegroundColor(theme: theme))
                UBText(theme: theme, textAttribute:
                        TextAttributes(text: label, color: variant.getForegroundColor(theme: theme, disabled: disabled), fontSize: fontSize, textAlign: .start, maxlines: 0, fontWeight: .semiBold))
                .allowsHitTesting(false)
                .fixedSize(horizontal: true, vertical: false)
                .padding(size.getVerticalContentInsets())
                trailingIcon?
                    .renderingMode(.template)
                    .foregroundColor(variant.getForegroundColor(theme: theme, disabled: disabled).getForegroundColor(theme: theme))
            }
            .frame(
                minWidth: fullWidth ? nil : size.getButtonWidth(),
                maxWidth: fullWidth ? .greatestFiniteMagnitude : nil,
                minHeight: size.getButtonHeight()
            )
            .padding(size.getHorizontalContentInsets())
            .background((isPressed ? variant.getPressedBackgroundColor(theme: theme) : variant.getBackgroundColor(theme: theme, disabled: disabled))
                .cornerRadius(cornerRadius)
            )
            .overlay(
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(variant.getBorderColor(theme: theme, disabled: disabled), lineWidth: borderWidth)
            )
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
        .simultaneousGesture(gesture)
        .allowsHitTesting(!disabled)
        .accessibilityElement(children: .ignore)
        .accessibilityLabel(accessibilityInfo?.ubButtonAccessibilityLabel ?? "")
        .accessibilityHint(accessibilityInfo?.ubButtonAccessibilityHint ?? "")
        .accessibilityAddTraits(accessibilityTraits)
    }
    
    private var borderWidth: CGFloat {
        UBGlobal.borderWidth100
    }
    
    private var cornerRadius: CGFloat {
        UBGlobal.borderRadius1000
    }
    
    private func getSlotImage(slot: Slot?) -> UIImage? {
        if let leading = slot?.imageName,
           let uiImage = getImage(name: leading) {
            return uiImage
        }
        return nil
    }
}
