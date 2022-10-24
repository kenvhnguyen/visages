//
//  ContentView.swift
//  visages
//
//  Created by Hoang Nguyen on 10/20/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    var body: some View {
        TabView {
            ListView()
                .badge(2)
                .tabItem {
                    Label("All", systemImage: "tray.and.arrow.down.fill")
                }
            WallView()
                .tabItem {
                    Label("Seen", systemImage: "tray.and.arrow.up.fill")
                }
            MockCover()
                .badge("!")
                .tabItem {
                    Label("Mock", systemImage: "person.crop.circle.fill")
                }
        }
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

