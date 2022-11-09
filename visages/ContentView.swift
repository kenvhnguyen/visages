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
            MovieList()
                .badge(2)
                .tabItem {
                    Label("All", systemImage: "tray.and.arrow.down.fill")
                }
            PhotoWall()
                .tabItem {
                    Label("Seen", systemImage: "tray.and.arrow.up.fill")
                }
            WallView()
                .badge("!")
                .tabItem {
                    Label("Store", systemImage: "person.crop.circle.fill")
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

