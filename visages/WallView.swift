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
                Spacer()
                IntSlider(range: $score)
                    .padding()
                .opacity(0.1)
                Spacer()
                Button(action: {
                  presentPopup = true
                }) {
                    ButtonAppearance(text: " + Add New")
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
                                ButtonAppearance(text: " Cancel ")
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
                                ButtonAppearance(text: "  Insert  ")
                            }
                        }
                    }
                }
            }
        }
    }
}

struct ButtonAppearance: View {
    var text: String
    var body: some View {
        Text(text)
            .fontWeight(.medium)
            .foregroundColor(.black)
            .padding()
            .overlay(
                Capsule(style: .continuous)
                    .stroke(.black, lineWidth: 2)
            ).opacity(0.3)
    }
}

struct WallView_Previews: PreviewProvider {
    static var previews: some View {
        WallView()
    }
}
