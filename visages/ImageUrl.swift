//
//  ImageUrl.swift
//  visages
//
//  Created by Hoang Nguyen on 11/9/22.
//

import SwiftUI
import os.log

class ImageUrl: NSObject, NSCoding {
    
    //MARK: Archiving paths
    static let DocumentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("imageUrls")
    
    var imageUrl: String
    
    //MARK: Initialization
    init?(imageUrl: String) {
        guard !imageUrl.isEmpty else {
            return nil
        }
        // Initialize stored properties
        self.imageUrl = imageUrl
    }
    
    //MARK: Properties
    struct PropertyKey {
        static let imageUrl = "imageUrl"
    }
    
    //MARK: NSCoding required
    func encode(with coder: NSCoder) {
        coder.encode(imageUrl, forKey: PropertyKey.imageUrl)
    }
    
    //MARK: NSCoding required
    required convenience init?(coder decoder: NSCoder) {
        guard let imageUrl = decoder.decodeObject(forKey: PropertyKey.imageUrl) as? String else {
            os_log("Unable to decode the imageUrl for a ImageUrl object", log: OSLog.default, type: .debug)
            return nil
        }
        // must call designated initiliazer
        self.init(imageUrl: imageUrl)
    }
}
