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
    // MARK: - State
    @State private var rotation: Double = 0
    
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
            startAnimation()
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
                .rotationEffect(.degrees(rotation))
                .animation(
                    .linear(duration: animationDuration)
                    .repeatForever(autoreverses: false),
                    value: rotation
                )
        }
        .padding()
    }
    
    // MARK: - Animation
    private func startAnimation() {
        rotation = 0
        rotation = 360
    }
}
*/

public struct UBLoaderView: View {
    
    private let theme: UBTheme
    private let color: UBLoaderColor
    private let size: UBLoaderSize
    private let loaderLabel: UBText?
    
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
    
    public var body: some View {
        VStack(spacing: loaderLabel == nil ? UBGlobal.space0 : size.getLabelSpacing()) {
            loaderCircle
            loaderLabel
        }
    }
    
    private var loaderCircle: some View {
        let dimension = size.getWidth()
        let lineWidth = size.getBorderWidth()
        
        return TimelineView(.animation) { timeline in
            let angle = timeline.date.timeIntervalSinceReferenceDate * 360
            
            ZStack {
                // Track (perfect circle)
                Circle()
                    .stroke(color.getTrackColor(), lineWidth: lineWidth)
                
                // Indicator (perfect circle)
                Circle()
                    .trim(from: 0, to: 0.25)
                    .stroke(
                        color.getIndicatorColor(theme: theme),
                        style: StrokeStyle(
                            lineWidth: lineWidth,
                            lineCap: .round
                        )
                    )
                    .rotationEffect(.degrees(angle))
            }
            .frame(width: dimension, height: dimension)
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
