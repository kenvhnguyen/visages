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
                        .frame(width: 70, height: 70)
                    VStack(alignment:.leading) {
                        Text(visage.title).font(.system(size: 20)).lineLimit(1)
                        Text(visage.director).font(.system(size: 15))
                        Text(visage.year).font(.system(size: 10))
                        Text(visage.country).font(.system(size: 12))
                    }
                }
            }
        }.listStyle(.insetGrouped)
    }
}

struct ListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ListView()
    }
}
