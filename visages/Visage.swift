//
//  Visage.swift
//  visages
//
//  Created by Hoang Nguyen on 10/24/22.
//

import Foundation

struct Visage: Identifiable, Codable {
    enum CodingKeys: CodingKey {
        case title
        case country
        case year
        case director
        case seen
        case visage
        case extra
        case imdb
        case wiki
    }
    
    var id = UUID()
    
    let title: String
    let country: String
    let year: String
    let director: String
    let seen: Bool
    let visage: String
    let extra: String
    let imdb: String
    let wiki: String
}
