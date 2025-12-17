//
//  UBLoaderView.swift
//
//
//  Created by Rakesh Kumar on 17/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
public struct UBLoaderView: View {
    // MARK: - Private Properties
    /// This property is used to control the loading state of the spinner component.
    @State private var isLoading = false
    
    // MARK: - Public Properties
    /// This property is used to set the theme of the spinner component.
    public var theme: UBTheme
    /// This property is used to set the color of the spinner component.
    public var color: UBLoaderColor = .primary
    /// This property is used to set the size of the spinner component.
    public var size: UBLoaderSize = .large
    /// This property is used to set the label of the spinner component.
    public var spinnerLabel: UBText?

    // MARK: - Private Computed Properties
    private var animationDuration: TimeInterval {
        TimeInterval(UBGlobal.animationDuration600 + UBGlobal.animationDuration200).msToSeconds
    }
    
    private var labelSpacing: CGFloat {
        spinnerLabel != nil ? UBGlobal.space0 : size.getLabelSpacing()
    }
    
    // MARK: - Initializer
    ///  This init method is used for customizing the spinner component. Below are the parameter descriptions:
    /// - Parameters:
    ///   - theme: The theme of the spinner. It is used to set color based on the selected theme. Default is `UMATheme.current`.
    ///   - color: The color of the spinner. It is used to set the indicator and track color. Default is `.primary`.
    ///   - size: The size of the spinner. It is used to set the radius of the spinner. Default is `.large`.
    ///   - labelText: Optional text to display below the spinner.
    public init(
        theme: UBTheme = UBTheme.current,
        color: UBLoaderColor = .primary,
        size: UBLoaderSize = .large,
        labelText: String? = nil
    ) {
        self.theme = theme
        self.color = color
        self.size = size
        if let labelText, !labelText.isEmpty {
            spinnerLabel = UBText(textAttribute: TextAttributes(
                text: labelText,
                color: color.getTextColor(),
                fontSize: size.getTextSize(),
                textAlign: .center,
                maxlines: 2,
                fontWeight: .semiBold
            ))
        } else {
            spinnerLabel = nil
        }
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(spacing: labelSpacing) {
            spinnerCircle
            spinnerLabel
        }
    }
    
    // MARK: - Private Views
    private var spinnerCircle: some View {
        ZStack {
            // Background track circle
            Circle()
                .stroke(lineWidth: size.getBorderWidth())
                .fill(color.getTrackColor())
                .frame(width: size.getWidth(), height: size.getHeight())
            
            // Animated indicator circle
            Circle()
                .trim(from: 0, to: 0.25)
                .stroke(
                    style: StrokeStyle(
                        lineWidth: size.getBorderWidth(),
                        lineCap: .round,
                        lineJoin: .round
                    )
                )
                .rotationEffect(.degrees(isLoading ? 360 : 0))
                .frame(width: size.getWidth(), height: size.getHeight())
                .foregroundColor(color.getIndicatorColor(theme: theme))
                .onAppear {
                    startAnimation()
                }
                .padding(.horizontal)
                .padding(.vertical)
        }
    }
    
    // MARK: - Private Methods
    private func startAnimation() {
        withAnimation(
            Animation
                .linear(duration: animationDuration)
                .repeatForever(autoreverses: false)
        ) {
            isLoading = true
        }
    }
}

/// An extension of `TimeInterval` to add conversion functionalities.
public extension TimeInterval {
    /// Converts milliseconds to seconds.
    var msToSeconds: Double {
        return (self / 1000)
    }
}
