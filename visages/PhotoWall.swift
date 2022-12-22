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
    @State var visible = true
    @State var visibility = 0.1
    @State var showActionSheet = false
    var body: some View {
        ZStack {
            ScrollView(scrolled) {
                LazyHGrid(rows: [GridItem(.adaptive(minimum: CGFloat(score)))]
                          //, spacing: 100
                ) {
                    ForEach(imageUrls.storedUrls, id: \.self) { url in
                        ZStack {
                            Button(action: {
                                showActionSheet = visible
                            }) {
                                ImageTile(url: url.imageUrl)
                                .actionSheet(isPresented: $showActionSheet) {
                                    ActionSheet(
                                        title: Text("Actions"),
                                        message: Text("Available actions"),
                                        buttons: [
                                            .cancel { print(self.showActionSheet) },
                                            .default(Text("Action")),
                                            .destructive(Text("Delete")) {
                                                withAnimation { () -> () in
                                                    let idx = imageUrls.storedUrls.firstIndex(of: url)
                                                    imageUrls.storedUrls.remove(at: idx!)
                                                    imageUrls.saveImageUrls()
                                                }
                                            }
                                        ]
                                    )
                                }
                           }
                        }
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
                    ButtonAppearance(opaque: visibility, text: " * Freeze * ")
                }
                Spacer()
                IntSlider(range: $score)
                    .padding()
                .opacity(visibility)
                Spacer()
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
                                ButtonAppearance(opaque: 0.3, text: "  Insert  ")
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
