//
//  Genre.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/3/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import UIKit

class Genre: NSObject {
    var genreId : String!
    var name    : String!
    var url     : String!
    init?(genre: [String: Any]){
        
        guard let genreId = genre["genreId"] as? String,
            let name = genre["name"] as? String,
            let url = genre["url"] as? String
            else {
                return nil
        }
        self.genreId  = genreId
        self.name   = name
        self.url   = url
    }
}
