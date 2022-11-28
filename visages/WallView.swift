//
//  WallView.swift
//  visages
//
//  Created by Hoang Nguyen on 10/24/22.
//

import SwiftUI

struct WallView: View {
    let scrolled = Axis.Set.horizontal
    @ObservedObject var all = VisageUrls()
    @State var score: Int = 130
    @State var presentPopup = false
    @State var newUrl: String = ""
    @State var visible = true
    @State var visibility = 0.3
    var body: some View {
        ZStack {
            ScrollView(scrolled) {
                LazyHGrid(rows: [GridItem(.adaptive(minimum: CGFloat(score)))]
                          //, spacing: 100
                ) {
                    ForEach(all.urls, id: \.self) { url in
                        ImageTile(url: url)
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
            VStack {
                Button(action: {
                    visible = !visible
                    if visible == true {
                        visibility = 0.3
                    } else {
                        visibility = 0.0
                    }
                }) {
                    ButtonAppearance(opaque: visibility, text: " + Add New")
                }
                IntSlider(range: $score)
                    .padding()
                .opacity(visibility)
                Button(action: {
                  presentPopup = true
                }) {
                    ButtonAppearance(opaque: visibility, text: " + Add New")
                }
                .popover(isPresented: $presentPopup, arrowEdge: .bottom) {
                    VStack {
                        if newUrl != "" {ImageTile(url: newUrl)}
                        TextField("URL to new visage", text: $newUrl).padding()
                            .textFieldStyle(.roundedBorder)
                        HStack(spacing: 50) {
                            Button(action: {
                                newUrl = ""
                                presentPopup = false
                            }) {
                                ButtonAppearance(opaque: 0.3, text: " Cancel ")
                            }
                            Button(action: {
                                if (all.urls.contains(newUrl)) {
                                    newUrl = ""
                                } else {
                                    all.urls.insert(newUrl, at: 0)
                                    presentPopup = false
                                    newUrl = ""
                                }
                            }) {
                                ButtonAppearance(opaque: 0.3, text: "  Insert  ")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ButtonAppearance: View {
    var opaque: Double
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.medium)
            .foregroundColor(.black)
            .padding()
            .overlay(
                Capsule(style: .continuous)
                    .stroke(.black, lineWidth: 2)
            ).opacity(opaque)
    }
}

struct WallView_Previews: PreviewProvider {
    static var previews: some View {
        WallView()
    }
}
