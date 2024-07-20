//
//  YoutubeFeedApp.swift
//  YoutubeFeed
//
//  Created by Sopheamen VAN on 12/7/24.
//

import SwiftUI

@main
struct YoutubeFeedApp: App {
    init() {
        configureNavitionBar()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
    
    func configureNavitionBar(){
        // Use UINavigationBarAppearance to change the navigation bar background color
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor.white  // Set the background color to white
        appearance.shadowColor = .clear  // Optionally remove the shadow

        // Apply the appearance to the navigation bar
        UINavigationBar.appearance().standardAppearance = appearance
        if #available(iOS 15.0, *) {
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
}
