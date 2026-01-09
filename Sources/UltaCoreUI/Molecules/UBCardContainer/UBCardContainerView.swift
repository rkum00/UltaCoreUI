//
//  UBCardContainerView.swift
//
//
//  Created by Rakesh Kumar on 05/12/25.
//

import SwiftUI

@available(iOS 13.0, *)
public struct UBCardContainerView<Content: View>: View {
    
    // MARK: - Stored Properties
    let size: UBCardSize
    let type: UBCardType
    let state: UBCardState
    let shape: UBCardShape
    let axis: UBCardAxis
    let theme: UBTheme
    let contentPadding: UBCardPadding
    let contentPaddingEdge: UBCardPaddingEdge
    let outlineColor: UBCardOutlineColor
    let onTap: (() -> Void)?
    let content: () -> Content
    
    // Highlight state (active only when interactive)
    @GestureState private var isPressed = false
    
    // MARK: - Initializer
    public init(
        size: UBCardSize,
        type: UBCardType,
        state: UBCardState,
        shape: UBCardShape,
        axis: UBCardAxis,
        theme: UBTheme = .current,
        contentPadding: UBCardPadding,
        contentPaddingEdge: UBCardPaddingEdge = .all,
        outlineColor: UBCardOutlineColor = .primary,
        onTap: (() -> Void)? = nil,
        content: @escaping () -> Content
    ) {
        self.size = size
        self.type = type
        self.state = state
        self.shape = shape
        self.axis = axis
        self.theme = theme
        self.contentPadding = contentPadding
        self.contentPaddingEdge = contentPaddingEdge
        self.outlineColor = outlineColor
        self.onTap = onTap
        self.content = content
    }
    
    // MARK: - Shape
    private var shapeView: some InsettableShape {
        RoundedRectangle(cornerRadius: shape.cornerRadius)
    }
    
    // MARK: - Arranged Content
    @ViewBuilder
    private var arrangedContent: some View {
        if axis == .horizontal {
            HStack(spacing: contentPadding.value) { content() }
        } else {
            VStack(spacing: contentPadding.value) { content() }
        }
    }
    
    // MARK: - Interaction Wrapper
    @ViewBuilder
    private func applyInteraction(to view: some View) -> some View {
        if onTap == nil {
            view
        } else {
            view
                .contentShape(shapeView)
                .highPriorityGesture(
                    DragGesture(minimumDistance: 0)
                        .updating($isPressed) { _, pressed, _ in
                            pressed = true
                        }
                        .onEnded { _ in onTap?() }
                )
        }
    }
    
    // MARK: - Body
    public var body: some View {
        applyInteraction(
            to: arrangedContent
                .padding(UBCardPadding.insets(edge: contentPaddingEdge, size: contentPadding))
                .frame(width: size.getWidth())
                .background(
                    shapeView
                        .fill(state.getBackgroundColor(theme: theme))
                        .shadow(radius: type.shadowRadius)
                )
                .overlay(
                    shapeView
                        .stroke(outlineColor.getColor(theme: theme), lineWidth: type.lineWidth)
                )
                .opacity(isPressed && onTap != nil ? state.opacityValue * 0.85 : state.opacityValue)
                .scaleEffect(isPressed && onTap != nil ? 0.97 : 1.0)
                .animation(.easeOut(duration: 0.15), value: isPressed)
        )
    }
}
