//
//  APIService.swift
//  Practice_RESTAPI
//
//  Created by Abraham on 10/10/20.
//  Copyright © 2020 Abraham Shenghur. All rights reserved.
//

import Foundation

class APIService {
    
    private var dataTask: URLSessionDataTask?
    
    
    func getPopularMoviesData(completion: @escaping (MoviesData?, String?) -> Void) {
        let popularMoviesURL = "https://api.themoviedb.org/3/movie/popular?api_key=4e0be2c22f7268edffde97481d49064a&language=en-US&page=1"
        
        guard let url = URL(string: popularMoviesURL) else { return }
        
        // Create URL Session - work on the background
        dataTask = URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            // Handle Error
            if let _ = error {
                completion(nil, error?.localizedDescription)
                print("DataTask Error: \(String(describing: error?.localizedDescription))")
                return
            }
            
            guard let response = response as? HTTPURLResponse else {
                // Handle empty resource
                print("Empty Response")
                return
            }
            print("Response status code: \(response.statusCode)")
            
            guard let data = data else {
                // Handle empty data
                print("Empty Data")
                return
            }
            
            do {
                // Parse the data
                let decoder = JSONDecoder()
                let jsonData = try decoder.decode(MoviesData.self, from: data)
                
                DispatchQueue.main.async {
                    completion(jsonData, "Error in Data")
                }
            } catch {
                completion(nil, "No Data")
            }
        }
        
        dataTask?.resume()
    }
}
