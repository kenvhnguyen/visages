//
//  MovieList.swift
//  visages
//
//  Created by Hoang Nguyen on 11/8/22.
//

import SwiftUI

struct MovieList: View {
    var movies = [Movie]()
    
    init() {
        if let savedMovies = loadMovies() {
            movies += savedMovies
        } else {
            movies += loadSampleMovies()!
        }
    }
    
    var body: some View {
        List {
            ForEach(movies, id: \.self) {movie in
                HStack {
                    ImageTile(url: movie.imageUrl!)
                        .frame(width: 70, height: 70)
                    VStack(alignment:.leading) {
                        Text(movie.name).font(.system(size: 20)).lineLimit(1)
                        Text(movie.year!).font(.system(size: 15))
                        
                    }
                }
            }
        }.listStyle(.insetGrouped)
    }
    
    private func loadMovies() -> [Movie]? {
        if let nsData = NSData(contentsOf: Movie.ArchiveURL) {
            do {
                let data = Data(referencing:nsData)
                if let loadedMovies = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as? Array<Movie> {
                    return loadedMovies
                }
            } catch {
                print("Couldn't read file.")
                return nil
            }
        }
        return nil
    }

    private func loadSampleMovies() -> [Movie]? {
        let photo = UIImage(named: "SamplePhoto")
        guard let sampleMovie = Movie(name: "Foxtrot",
                                      year: "2017",
                                      photo: photo,
                                      rating: 5,
                                      note: "sample note",
                                      posterUrl: "https://cdn.posteritati.com/posters/000/000/060/465/fitzcarraldo-md-web.jpg",
                                      imdbId: "imdbId"
                                      
        ) else {
            fatalError("Unabled to instantiate movie1")
        }
        return [sampleMovie]
    }
}




struct MovieList_Previews: PreviewProvider {
    static var previews: some View {
        MovieList()
    }
}
