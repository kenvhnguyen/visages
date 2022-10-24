//
//  ContentView.swift
//  visages
//
//  Created by Hoang Nguyen on 10/20/22.
//

import SwiftUI
import AVKit

struct ContentView: View {
    let scrolled = Axis.Set.horizontal
    let urls = VisageUrls().urls
    @State var score: Int = 90
    
    var body: some View {
        
        VStack {
            NavigationView {
                ScrollView(scrolled) {
                    LazyHGrid(rows: [GridItem(.adaptive(minimum: CGFloat(score)))]
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
            IntSlider(score: $score)
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
        }.frame(height: 500)
    }
}

struct ImageTile: View {
    var url: String
    var body: some View {
        AsyncImage(url: URL(string: url)) { image in
            image.resizable()
                .scaledToFit()
//            print(Date().formatted() + " - Logged from View ImageTile: retrieve image: " + url)
        } placeholder: {
            ProgressView()
        }
        .padding(-3)
    }
}



struct IntSlider: View {
    @Binding var score: Int
    var intProxy: Binding<Double>{
        Binding<Double>(get: {
            //returns the score as a Double
            return Double(score)
        }, set: {
            //rounds the double to an Int
            score = Int($0)
        })
    }
    var body: some View {
        VStack{
            Slider(value: intProxy , in: 10...400, step: 40, onEditingChanged: {_ in
                print(Date().formatted() + " - Logged from View IntSlider: " + score.description)
            })
            .accentColor(.gray)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var score: Int = 10
    static var url = "https://cdn.posteritati.com/posters/000/000/060/465/fitzcarraldo-md-web.jpg"
    static var previews: some View {
        ContentView()
        ImageTile(url: url)
        ZoomableImageTile(url: url)
        IntSlider(score: $score)
    }
}
