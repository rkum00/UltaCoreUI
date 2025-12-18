//
//  UBLoaderView.swift
//
//
//  Created by Rakesh Kumar on 17/12/25.
//

import SwiftUI

@available(iOS 15.0, *)
/*
public struct UBLoaderView: View {
    // MARK: - Private Properties
    /// This property is used to control the loading state of the loader component.
    @State private var isLoading = false
    
    // MARK: - Private Properties
    /// This property is used to set the theme of the loader component.
    let theme: UBTheme
    /// This property is used to set the color of the loader component.
    let color: UBLoaderColor
    /// This property is used to set the size of the loader component.
    let size: UBLoaderSize
    /// This property is used to set the label of the loader component.
    let loaderLabel: UBText?

    // MARK: - Private Computed Properties
    private var animationDuration: TimeInterval {
        TimeInterval(UBGlobal.animationDuration600 + UBGlobal.animationDuration200).msToSeconds
    }
    
    private var labelSpacing: CGFloat {
        loaderLabel != nil ? UBGlobal.space0 : size.getLabelSpacing()
    }
    
    // MARK: - Initializer
    ///  This init method is used for customizing the loader component. Below are the parameter descriptions:
    /// - Parameters:
    ///   - theme: The theme of the loade. It is used to set color based on the selected theme. Default is `UMATheme.current`.
    ///   - color: The color of the loader. It is used to set the indicator and track color. Default is `.primary`.
    ///   - size: The size of the loader. It is used to set the radius of the loader. Default is `.large`.
    ///   - labelText: Optional text to display below the loader.
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
            loaderLabel = UBText(textAttribute: TextAttributes(
                text: labelText,
                color: color.getTextColor(),
                fontSize: size.getTextSize(),
                textAlign: .center,
                maxlines: 2,
                fontWeight: .semiBold
            ))
        } else {
            loaderLabel = nil
        }
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(spacing: labelSpacing) {
            loaderCircle
            loaderLabel
        }
    }
    
    // MARK: - Private Views
    private var loaderCircle: some View {
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
*/

public struct UBLoaderView: View {
    // MARK: - State
    @State private var isAnimating = false
    
    // MARK: - Properties
    private let theme: UBTheme
    private let color: UBLoaderColor
    private let size: UBLoaderSize
    private let loaderLabel: UBText?
    
    private let animationDuration: TimeInterval =
    TimeInterval(UBGlobal.animationDuration600 + UBGlobal.animationDuration200).msToSeconds
    
    // MARK: - Init
    public init(
        theme: UBTheme = .current,
        color: UBLoaderColor = .primary,
        size: UBLoaderSize = .large,
        labelText: String? = nil
    ) {
        self.theme = theme
        self.color = color
        self.size = size
        
        if let labelText, !labelText.isEmpty {
            self.loaderLabel = UBText(
                textAttribute: TextAttributes(
                    text: labelText,
                    color: color.getTextColor(),
                    fontSize: size.getTextSize(),
                    textAlign: .center,
                    maxlines: 2,
                    fontWeight: .semiBold
                )
            )
        } else {
            self.loaderLabel = nil
        }
    }
    
    // MARK: - Body
    public var body: some View {
        VStack(spacing: loaderLabel == nil ? UBGlobal.space0 : size.getLabelSpacing()) {
            loaderCircle
            loaderLabel
        }
        .onAppear {
            isAnimating = true
        }
    }
    
    // MARK: - Loader
    private var loaderCircle: some View {
        let dimension = size.getWidth()
        let lineWidth = size.getBorderWidth()
        
        return ZStack {
            // Track
            Circle()
                .stroke(color.getTrackColor(), lineWidth: lineWidth)
                .frame(width: dimension, height: dimension)
            
            // Indicator
            Circle()
                .trim(from: 0, to: 0.25)
                .stroke(
                    color.getIndicatorColor(theme: theme),
                    style: StrokeStyle(
                        lineWidth: lineWidth,
                        lineCap: .round
                    )
                )
                .frame(width: dimension, height: dimension)
                .rotationEffect(.degrees(isAnimating ? 360 : 0))
                .animation(
                    .linear(duration: animationDuration)
                    .repeatForever(autoreverses: false),
                    value: isAnimating
                )
        }
        .padding()
    }
}

/// An extension of `TimeInterval` to add conversion functionalities.
public extension TimeInterval {
    /// Converts milliseconds to seconds.
    var msToSeconds: Double {
        return (self / 1000)
    }
}
