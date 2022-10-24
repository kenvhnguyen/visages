//
//  JSONFileLoader.swift
//  visages
//
//  Created by Hoang Nguyen on 10/24/22.
//

import Foundation

class JSONFileLoader: ObservableObject {
    @ Published var visages = [Visage]()
    
    init() {
        visages = loadJSONFile("films")
    }
    
    func loadJSONFile(_ filename: String) -> [Visage] {
        let data: Data
        guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
        else {
            fatalError("Could't find \(filename) in resource bundle.")
        }
        
        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Could't load data from the content of \(filename): \n\(error)")
        }
        
        do {
            let decoder = JSONDecoder()
            return try decoder.decode([Visage].self, from: data)
        } catch {
            fatalError("Could't decode data from the content of \(filename): \n\(error)")
        }
    }
}
