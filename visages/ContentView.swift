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
    let url = "https://cdn.posteritati.com/posters/000/000/060/465/fitzcarraldo-md-web.jpg"
    let urls = [
        "https://s3.amazonaws.com/criterion-production/films/50601e2e6d31f2758588c3375c856abe/Mij0GgpVEQDG55eQGe1juUCJWRmy9f_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/b64d8d6785c12ae24b029f8b625c3c1a/PMLyOniHrRG3nyansZSwJxghltbxsC_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/4886db5d9452d2247ff729d35aa839a6/rXjMmW28vBI3WW7qEj2gO6X7NKmq6A_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/323c56a13b44f5ded3b7b0117a6dc08d/o7l2a4KSto1HXIf7DxvRcPVn2sMRvl_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/3467090198c948e9fe375d217ce8a10f/nsKgsPFKsXYHSq1dakh5q0P2MUwFel_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/5d825de608ea6993b42be3c972bab02f/O4mn7lXmAaCzdLtUmSqBHAKHJBQW3P_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/2d3c65e2a96df118ecf3a20d12ae720a/vZCph6mUDbPoW4VN0IXuAaVXDhRjnE_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/4f5175b5c0e1c0619b482a9650356cc8/AHoTWP6XqNreD4aGRUKfGB3ASi3IVz_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/dfdd32ea78dc954d8cef1b54e34acbf0/sCfUtouYZPKwTEfBNRMEntUVk572AT_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/ef45f7fd0ccef1e881abc80c6b24ff60/GgZDqyYrxCYlRn5FxwXi15SB4qyUTU_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/31b8ddf4b7224294e1c323968e5edcae/ZnvrX36fSxtqKKg2do5VnPKSusWgp1_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/801e84275fd24d65ca5c0f42aac9d3e6/7Cd0pGdJRCLCu2KTtuANf8lBDlSPbs_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/e47f71ec6b32e658b605b0597069d746/mb6Gef7oSB6XGh8TMxthVmUFHIWMtb_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/c467c2b736aa487917e683bda0f5fee9/9csB0WnD265jEpvyTxJq5K2An80Ry5_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/23b95546eb76fe0bd9c69678c5130f60/Gicsoj0cO0g4i7a78Otic6zVhZKTv7_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/7079cc7071f8240ee1b25ec22d552a18/ORGd2T0IZlsrN9YI2xeRZwQU7bWuWt_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/3bf165588ec7faf206e9d0ec5b64bd78/0tGumi5LOfL32hMHGxu40FFvFiTgOT_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/07df7def14b7ea66469042b2081510e1/koE5Fml5n41PPDb8ABgwu7ZgZ20Skv_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/1283a2e6f60a395e2afb5f75a72b160f/Innqqmp9vKKQMgQnrzkyHERGrs480H_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/b935a8eaff6f0e92d17b18a1cd19fdf6/5ZrsCMJikkq6bPNmWjofhZswbi544L_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/ea84da2f72396fc583c54892b92a5f10/4pVQR8QuPFQdZsErceEzrLlaCI48EL_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/8968996394900a7ff0de5a53d03ac392/mCvLwTDCAXEVyMHp4om3piFvSm2nzL_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/dc6376f090e305a122db1a855a025892/5i7NGnwsubXRYF6luLdSi6iC9ICn5O_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/e19847dc2f6f1689e5970ef13e094ea9/Mf9UMErynympJPguOrU1pChuPtgBJ5_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/b415e7735c3b593f2fb714c2c6831a26/So0yJBlzFXZG1ganHAXLtpJPhBnmg4_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/c1cb7c7c93760075005158d586b67d45/ace3Y8tk9zZ6RU58hIflxVsxZUIA2B_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/85ebb0e5781f605179432d071eb3b340/Ayry8QwcAWWRZhyaMkSpzG3TSZ9JoJ_large.jpg",
        "https://s3.amazonaws.com/criterion-production/films/9eb1d91e3a6e2bea22bdd915501aa980/WZ6I1ffhyQomwmWUH54lJ1JgY7StqV_large.jpg",
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
