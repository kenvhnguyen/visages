//
//  ListView.swift
//  visages
//
//  Created by Hoang Nguyen on 10/24/22.
//

import SwiftUI

struct ListView: View {
    @ObservedObject var loadedData = JSONFileLoader()
    var body: some View {
        List {
            ForEach(loadedData.visages) {visage in
                HStack {
                    ImageTile(url: visage.visage)
                        .frame(width: 50, height: 50)
                    Text(visage.title)
                }
            }
        }
    }
}

struct ListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ListView()
    }
}
