//
//  ContentView.swift
//  visages
//
//  Created by Hoang Nguyen on 10/20/22.
//

import SwiftUI

struct ContentView: View {
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
        }
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

struct Plaque: View {
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
        Plaque(url: url)
        IntSlider(score: $score)
    }
}
