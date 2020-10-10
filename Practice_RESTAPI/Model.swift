//
//  Model.swift
//  Practice_RESTAPI
//
//  Created by Abraham on 10/10/20.
//  Copyright © 2020 Abraham Shenghur. All rights reserved.
//

import Foundation

class MoviesData: Decodable {
    
    let movies: [Movie]
    
    
    private enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}


struct Movie: Decodable {
    
    let title: String?
    let year: String?
    let rate: Double?
    let posterImage: String?
    let overview: String?
    
    
    private enum CodingKeys: String, CodingKey {
        case title, overview
        case year = "release_date"
        case rate = "vote_average"
        case posterImage = "poster_path"
    }
}
