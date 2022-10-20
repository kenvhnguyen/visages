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
    let url = "https://s3.amazonaws.com/criterion-production/films/3617f85843446f8f78cc7ef44941a4c6/85USK613thTL36zAFZ4x1HtUfOG9NB_large.jpg"
    let urls = [
        "https://s3.amazonaws.com/criterion-production/films/3617f85843446f8f78cc7ef44941a4c6/85USK613thTL36zAFZ4x1HtUfOG9NB_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/587c8a3258addd59d3aa60ab4ab9e56b/zsEuDiXVAiOpAnXK08QtV7PfqZGbfX_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/1461a0f7c135c79d89c6b20be956acaf/5WLjJmxnJwyZDlSormyyidLLosShkT_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/323c56a13b44f5ded3b7b0117a6dc08d/o7l2a4KSto1HXIf7DxvRcPVn2sMRvl_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/aacbf709cba74e607ae657b7ea6ff1cf/2jsGvFmN8GvcK82SeP32fOu0YpUx1i_large.jpg",
//        "https://cdn.posteritati.com/posters/000/000/060/465/fitzcarraldo-md-web.jpg",
        
    ]
    var body: some View {
        
        VStack {
            ScrollView(.horizontal) {
                LazyHGrid(rows: [GridItem(.adaptive(minimum: 300))]
                          //, spacing: 100
                ) {
                    ForEach(urls, id: \.self) { url in
                        ImageTile(url: url)
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
                image.resizable()
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
    static var url = "https://s3.amazonaws.com/criterion-production/films/3617f85843446f8f78cc7ef44941a4c6/85USK613thTL36zAFZ4x1HtUfOG9NB_large.jpg"
    static var previews: some View {
        ContentView()
        ZoomableImageTile(url: url)
    }
}
