//
//  ContentView.swift
//  visages
//
//  Created by Hoang Nguyen on 10/20/22.
//

import SwiftUI

struct ContentView: View {
    
    let scaled: CGFloat = 100
    let scrolled = Axis.Set.horizontal
    let urls = VisageUrls().urls
    
    var body: some View {
        
        NavigationView {
            ScrollView(scrolled) {
                LazyHGrid(rows: [GridItem(.adaptive(minimum: scaled))]
                          //, spacing: 100
                ) {
                    ForEach(urls, id: \.self) { url in
                        NavigationLink(
                            destination: ZoomableImageTile(url: url),
                            label: { ImageTile(url: url) }
                        )
                    }
                }
            }
        }

    }
}

struct ZoomableImageTile: View {
    var url: String
    var body: some View {
        GeometryReader { proxy in
            AsyncImage(url: URL(string: url)) { image in
                image
                    .resizable()
                    .frame(width: proxy.size.width, height: proxy.size.height)
                    .scaledToFit()
                    .clipShape(Rectangle())
                    .modifier(ImageModifier(contentSize: CGSize(width: proxy.size.width, height: proxy.size.height)))
            } placeholder: {
                ProgressView()
            }
        }
    }
}

struct ImageTile: View {
    var url: String
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .padding(-3)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var url = "https://cdn.posteritati.com/posters/000/000/060/465/fitzcarraldo-md-web.jpg"
    static var previews: some View {
        ContentView()
        ImageTile(url: url)
        ZoomableImageTile(url: url)
    }
}
