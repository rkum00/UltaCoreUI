//
//  UltaCoreUIExampleApp.swift
//  UltaCoreUIExample
//
//  Created by Rakesh Kumar on 26/11/25.
//

import SwiftUI
import UltaCoreUI


@main
struct UltaCoreUIExampleApp: App {
    init() {
        UBStaticFont.registerFonts()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
