//
//  HydrationAppApp.swift
//  HydrationApp
//
//  Created by Nick on 3/22/22.
//

import SwiftUI

@main
struct HydrationApp: App {
    var body: some Scene {
        WindowGroup {
            LaunchView()
                .environmentObject(ContentModel())
        }
    }
}
