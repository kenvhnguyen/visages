//
//  ImageUrls.swift
//  visages
//
//  Created by Hoang Nguyen on 11/9/22.
//

import Foundation
import os.log

class ImageUrls : ObservableObject {
    @Published var storedUrls: [ImageUrl] = []
    
    init() {
        if let savedMovies = loadImageUrls() {
            os_log("Loaded all image urls from store.", log: OSLog.default, type: .debug)
            storedUrls.append(contentsOf: savedMovies)
        } else {
            storedUrls.append(contentsOf: loadSampleImageUrls()!)
        }
    }
    
    private func loadImageUrls() -> [ImageUrl]? {
        if let nsData = NSData(contentsOf: ImageUrl.ArchiveURL) {
            do {
                let data = Data(referencing:nsData)
                if let loadedMovies = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<ImageUrl> {
                    return loadedMovies
                }
                os_log("Stored image urls successfully loaded.", log: OSLog.default, type: .debug)
            } catch {
                os_log("Couldn't read file.", log: OSLog.default, type: .debug)
                return nil
            }
        }
        os_log("There are no image urls in store.", log: OSLog.default, type: .debug)
        return nil
    }
    
    private func loadSampleImageUrls() -> [ImageUrl]? {
        let imageUrl = "https://cdn.posteritati.com/posters/000/000/060/465/fitzcarraldo-md-web.jpg"
        guard let sampleMovie = ImageUrl(
            imageUrl: imageUrl
        ) else {
            fatalError("Unabled to instantiate sample image.")
        }
        return [sampleMovie]
    }
    
    func saveImageUrls() {
        do {
            let data = try NSKeyedArchiver.archivedData(withRootObject: storedUrls, requiringSecureCoding: false)
            try data.write(to: ImageUrl.ArchiveURL)
            os_log("Successfully saved all image urls.", log: OSLog.default, type: .debug)
        } catch {
            os_log("Failed to save image urls.", log: OSLog.default, type: .error)
        }
    }
    
}
