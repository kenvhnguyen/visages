//
//  NetworkImage.swift
//  visages
//
//  Created by Hoang Nguyen on 10/24/22.
//

import SwiftUI
import CachedAsyncImage

struct ImageTile: View {
    var url: String
    var body: some View {
        CachedAsyncImage(url: URL(string: url)) { image in
            image.resizable()
                .scaledToFit()
//            print(Date().formatted() + " - Logged from View ImageTile: retrieve image: " + url)
        } placeholder: {
            ProgressView()
        }
        .padding(-3)
    }
}

struct NetworkImageView_Previews: PreviewProvider {
    static var url = "https://cdn.posteritati.com/posters/000/000/060/465/fitzcarraldo-md-web.jpg"
    static var previews: some View {
        ImageTile(url: url)
    }
}
