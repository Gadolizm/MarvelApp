//
//  MarvelHeros.swift
//  MarvelApp
//
//  Created by Haitham Gado on 11/11/18.
//  Copyright © 2018 Haitham Gado. All rights reserved.
//

import ObjectMapper

class MarvelHerosJson: Mappable {
    var herosResults: [Hero]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        herosResults <- map["data.results"]
    }
}
