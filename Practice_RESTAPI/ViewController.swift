//
//  ViewController.swift
//  Practice_RESTAPI
//
//  Created by Abraham on 10/10/20.
//  Copyright © 2020 Abraham Shenghur. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var apiService = APIService()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiService.getPopularMoviesData { (result, error) in
            guard let result = result else {
                print(error!)
                return
            }
            
            print("Result: \(result.movies)")
        }
    }


}

