//
//  MarvelHeros.swift
//  MarvelApp
//
//  Created by Haitham Gado on 11/11/18.
//  Copyright © 2018 Haitham Gado. All rights reserved.
//

import ObjectMapper

class ComicsSeriesStoriesEventsJson: Mappable {
    var comicsSeriesStoriesEventsResults: [ComicsSeriesStoriesEvents]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        comicsSeriesStoriesEventsResults <- map["data.results"]
    }
}
