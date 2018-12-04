//
//  Album.swift
//  CodingExercise
//
//  Created by Arun Thakkar on 12/3/18.
//  Copyright © 2018 Arun Thakkar. All rights reserved.
//

import UIKit

class Album: NSObject {
    var artistName : String!
    var artistUrl  : String!
    var copyRight  : String!
    var albumName  : String!
    var releaseDate: String!
    var artWorkUrl : String!
    var genres     : [Genre]!
    
    init?(json: [String: Any]) {
        let generes = json["genres"] as? [[String: Any]]
        let genre = generes!.compactMap{ (dictionary) in
            return Genre(genre: dictionary)
        }
        guard let artistName = json["artistName"] as? String,
            let artWorkUrl = json["artworkUrl100"] as? String,
            let copyRight = json["copyright"] as? String,
            let albumName = json["name"] as? String,
            let artistUrl = json["artistUrl"] as? String,
            //let genres    = json["genres"] as?[Genre],
            let releaseDate = json["releaseDate"] as? String
            else {
                return nil
            }
        self.artistName  = artistName
        self.artWorkUrl   = artWorkUrl
        self.copyRight   = copyRight
        self.albumName   = albumName
        self.artistUrl   = artistUrl
        self.releaseDate = releaseDate
        self.genres      = genre
    }
}

