//
//  Hero.swift
//  MarvelApp
//
//  Created by Haitham Gado on 11/10/18.
//  Copyright © 2018 Haitham Gado. All rights reserved.
//

import ObjectMapper

class Hero: Mappable {

    var id :Int?
    var name : String?
    var description : String?
    var path: String?
    var heroExtension: String?

    var imageUrl : String {
        get {
            return "\(path!)/standard_fantastic.\(heroExtension!)"
        }
    }
    
    var comicsCount : Int?
    var comicsURL : String?
    var seriesCount : Int?
    var seriesURL : String?
    var itemsCount : Int?
    var itemsURL : String?
    var storiesCount : Int?
    var storiesURL : String?
    var eventsCount : Int?
    var eventsURL : String?
    var urls : [Url]?

    
    required init?(map: Map) {
        
    }

    func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        description <- map["description"]
        path <- map["thumbnail.path"]
        heroExtension <- map["thumbnail.extension"]
        comicsCount <- map["comics.available"]
        comicsURL <- map["comics.collectionURI"]
        seriesCount <- map["series.available"]
        seriesURL <- map["series.collectionURI"]
        itemsCount <- map["items.available"]
        itemsURL <- map["items.collectionURI"]
        storiesCount <- map["stories.available"]
        storiesURL <- map["stories.collectionURI"]
        eventsCount <- map["events.available"]
        eventsURL <- map["events.collectionURI"]
        urls <- map["urls"]


    }
    
}

class Url: Mappable {
    
    var urlType :String?
    var url : String?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        urlType <- map["type"]
        url <- map["url"]
}
}
