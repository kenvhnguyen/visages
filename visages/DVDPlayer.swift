//
//  DVDPlayer.swift
//  visages
//
//  Created by Hoang Nguyen on 10/24/22.
//

import SwiftUI
import AVKit

struct DVDPlayer: View {
    private let player = AVPlayer(url:  URL(string: "https://vod-progressive.akamaized.net/exp=1639690218~acl=%2Fvimeo-prod-skyfire-std-us%2F01%2F4047%2F11%2F295238750%2F1123020046.mp4~hmac=f65c0f2ca7cd1a8cee5efd11a00b305682cbfc03e5999c1b948e9cc47788b6b9/vimeo-prod-skyfire-std-us/01/4047/11/295238750/1123020046.mp4?filename=What+Star+Wars+Can+Teach+Us+About+Swift.mp4")!)

  var body: some View {
    VStack {
      VideoPlayer(player: player)
        .frame(height: 228)
      Spacer()
      Button {
        player.play()     // << here !!
      } label: {
        Text("Play")
          .font(.system(size: 26))
      }
    }
    .padding(.vertical, 16)
  }
}

struct DVDPlayer_Previews: PreviewProvider {
    static var previews: some View {
        DVDPlayer()
    }
}

