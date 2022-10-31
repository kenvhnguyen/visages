//
//  WallView.swift
//  visages
//
//  Created by Hoang Nguyen on 10/24/22.
//

import SwiftUI

struct WallView: View {
    let scrolled = Axis.Set.horizontal
    let urls = VisageUrls().urls
    @State var score: Int = 130
    var body: some View {
        VStack {
            NavigationView {
                ScrollView(scrolled) {
                    LazyHGrid(rows: [GridItem(.adaptive(minimum: CGFloat(score)))]
                              //, spacing: 100
                    ) {
                        ForEach(urls, id: \.self) { url in
                            ImageTile(url: url)
                        }
                    }
                }
            }
            IntSlider(range: $score)
                .padding()
        }
    }
}

struct WallView_Previews: PreviewProvider {
    static var previews: some View {
        WallView()
    }
}
