//
//  ContentView.swift
//  visages
//
//  Created by Hoang Nguyen on 10/20/22.
//

import SwiftUI

struct ContentView: View {
    let zoomed: CGFloat = 400
    let scrolled = Axis.Set.horizontal
    let url = "https://cdn.posteritati.com/posters/000/000/060/465/fitzcarraldo-md-web.jpg"
    let urls = [
        "https://s3.amazonaws.com/criterion-production/films/bd9c06388d59cfc3807d2d978d9b3113/1VhiMSCjj2iWXG4MW3xKDYZqO8sWc7_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/46014912ca0c20592c472f5bbe33e4f8/L9AQ95Y7z2vOIUf1ntwvpZsZx3kp8B_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/b7b640ae4949894b55998ff4983fc6e5/Et6yCL7xxsExwtRPO2aqmUHj1SnZcT_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/64093139506eeea73f973aee07e3f9ec/ZTvHQrwEUsJIjlvtHztiZ6g0UCH85m_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/8682fec5356a2cff41d1e090662f8a02/pvQjxjt452yR9hjwgX5DJ4UZeCraAL_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/5e58f4effd7ec074436c3cefccc76e6f/Yp6qC4kg4JLjjqcNdK8RAVM8eK2qnR_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/73a39f7f730d789ad75a85052fcb79ec/ctkavyALJzOHlnjyxyKzE5AyYFTLTJ_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/c2dde679e36dd0dd23fd23cdf5d35bce/K48iXCNe4D2noqgK0VAWIIXZIuJShg_large.jpg"
        
    ]
    var body: some View {
        
        NavigationView {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.adaptive(minimum: 100))]
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
                    .scaledToFill()
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
