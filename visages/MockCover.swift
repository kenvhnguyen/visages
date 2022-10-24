//
//  MockCover.swift
//  visages
//
//  Created by Hoang Nguyen on 10/24/22.
//

import SwiftUI

struct MockCover: View {
    var url = "https://cdn.posteritati.com/posters/000/000/060/465/fitzcarraldo-md-web.jpg"
    var body: some View {
        
        AsyncImage(
            url: URL(string: url),
            content: { image in
                ZStack {
                    image.resizable().scaledToFit()
                    VStack {
                        //Rectangle().size(width: 30, height: 100).opacity(0.1)
                        Image(systemName: "moon")
                        //Spacer()
                        Rectangle().size(width: 30, height: 200).opacity(0.5)
                        //Spacer()
                    }
                }
            },
            placeholder: { ProgressView() }
        )
        
    }
}

struct MockCover_Previews: PreviewProvider {
    static var url = "https://cdn.posteritati.com/posters/000/000/060/465/fitzcarraldo-md-web.jpg"
    static var previews: some View {
        MockCover(url: url)
    }
}
