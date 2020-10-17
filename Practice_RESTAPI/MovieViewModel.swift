//
//  MovieViewModel.swift
//  Practice_RESTAPI
//
//  Created by Abraham on 10/17/20.
//  Copyright © 2020 Abraham Shenghur. All rights reserved.
//

import Foundation

class MovieViewModel {
    
    private var apiService = APIService()
    private var popularMovies = [Movie]()
    
    
    func fetchPopularMoviesData(completion: @escaping () -> ()) {
        apiService.getPopularMoviesData { (result, error) in
            guard let result = result else {
                print(error!)
                return
            }
            print("Result Count: \(result.movies.count)")
            print("Result: \(result.movies)")
        }
    }
    
    
    func numberOfRowsInSection(section: Int) -> Int {
        if popularMovies.count != 0 {
            return popularMovies.count
        }
        return 0
    }
    
    
    func cellForRowAt(indexPath: IndexPath) -> Movie {
        return popularMovies[indexPath.row]
    }
}

