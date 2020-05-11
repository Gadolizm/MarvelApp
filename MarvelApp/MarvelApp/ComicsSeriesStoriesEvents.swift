//
//  Hero.swift
//  MarvelApp
//
//  Created by Haitham Gado on 11/10/18.
//  Copyright © 2018 Haitham Gado. All rights reserved.
//

import ObjectMapper

class ComicsSeriesStoriesEvents: Mappable {
    
    var id :Int?
    var title : String?
    var path: String?
    var comicImageExtension: String?
    
    
    var imageUrl : String {
        get {
            if path != nil && comicImageExtension != nil {
                return "\(path!)/standard_fantastic.\(comicImageExtension!)"
            }
            return ""
        }
    }
    
   
    
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        path <- map["thumbnail.path"]
        comicImageExtension <- map["thumbnail.extension"]
     
        
    }
    
}


