//
//  PhotoWall.swift
//  visages
//
//  Created by Hoang Nguyen on 11/9/22.
//

import SwiftUI
import os.log

struct PhotoWall: View {
    let scrolled = Axis.Set.horizontal
    @ObservedObject var imageUrls = ImageUrls()
    @State var score: Int = 130
    @State var presentPopup = false
    @State var newUrl: String = ""

    var body: some View {
        ZStack {
            ScrollView(scrolled) {
                LazyHGrid(rows: [GridItem(.adaptive(minimum: CGFloat(score)))]
                          //, spacing: 100
                ) {
                    ForEach(imageUrls.storedUrls, id: \.self) { url in
                        ImageTile(url: url.imageUrl)
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
                                let newImageUrl = ImageUrl(imageUrl: newUrl)
                                let existed = imageUrls.storedUrls.contains(where: { $0.imageUrl == newUrl })
                                if existed {
                                    newUrl = ""
                                } else {
                                    imageUrls.storedUrls.insert(newImageUrl!, at: 0)
                                    imageUrls.saveImageUrls()
                                    newUrl = ""
                                    presentPopup = false
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

struct PhotoWall_Previews: PreviewProvider {
    static var previews: some View {
        PhotoWall()
    }
}
