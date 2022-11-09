//
//  Movie.swift
//  visages
//
//  Created by Hoang Nguyen on 11/8/22.
//

import SwiftUI
import os.log

class Movie: NSObject, NSCoding {
    
    //MARK: Archiving paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("movies")
    
    var name: String
    var year: String?
    var photo: UIImage?
    var rating: Int
    var note: String?
    var imdbId: String?
    var imageUrl: String?
    
    //MARK: Initialization
    init?(name: String, year: String, photo: UIImage?, rating: Int, note: String?, posterUrl: String?, imdbId: String?) {
        // The name must not be empty
        guard !name.isEmpty else {
            return nil
        }
        
        // The rating must be between 0 and 5 inclusively
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // Initialize stored properties
        self.name = name
        self.year = year
        self.photo = photo
        self.rating = rating
        self.note = note
        self.imdbId = imdbId
        self.imageUrl = posterUrl
    }
    
    //MARK: Properties
    struct PropertyKey {
        static let name = "name"
        static let year = "year"
        static let photo = "photo"
        static let rating = "rating"
        static let note = "note"
        static let imdbId = "imdbId"
    }
    
    //MARK: NSCoding required
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: PropertyKey.name)
        coder.encode(year, forKey: PropertyKey.year)
        coder.encode(photo, forKey: PropertyKey.photo)
        coder.encode(rating, forKey: PropertyKey.rating)
        coder.encode(note, forKey: PropertyKey.note)
        coder.encode(imdbId, forKey: PropertyKey.imdbId)
    }
    
    //MARK: NSCoding required
    required convenience init?(coder decoder: NSCoder) {
        guard let name = decoder.decodeObject(forKey: PropertyKey.name) as? String else {
            os_log("Unable to decode the name for a Movie object", log: OSLog.default, type: .debug)
            return nil
        }
        
        let year = decoder.decodeObject(forKey: PropertyKey.year) as? String
        let photo = decoder.decodeObject(forKey: PropertyKey.photo) as? UIImage
        let rating = decoder.decodeInteger(forKey: PropertyKey.rating)
        let note = decoder.decodeObject(forKey: PropertyKey.note) as? String
        let imdbId = decoder.decodeObject(forKey: PropertyKey.imdbId) as? String
        
        // must call designated initiliazer
        self.init(name: name, year: year ?? "2011", photo: photo, rating: rating, note: note, posterUrl: "", imdbId: imdbId)
    }
}
