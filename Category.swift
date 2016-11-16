//
//  Category.swift
//  Hackaton
//
//  Created by Boris Angelov on 11/16/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//




//    thumbnailURL = URL(string: espDictionary["thumbnailURL"] as! String)
//    self.url = URL(string: espDictionary["link"] as! String)

//static func downloadAllEpisodes() -> [Episode]
//{
//    var episodes = [Episode]()
//    
//    let jsonFile = Bundle.main.path(forResource: "DucBlog", ofType: "json")
//    let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile!))
//    
//    // turn the data into foundation objects (Episodes)
//    if let jsonDictionary = NetworkService.parseJSONFromData(jsonData) {
//        let espDictionaries = jsonDictionary["episodes"] as! [[String : AnyObject]]
//        for espDictionary in espDictionaries {
//            let newEpisode = Episode(espDictionary: espDictionary)
//            episodes.append(newEpisode)
//        }
//    }
//    
//    return episodes
//}


import Foundation

class Category: NSObject {
    
    var title: String
    var categoryDescription: String
    
    init(title: String, description: String){
        self.title = title
        self.categoryDescription = description
    }
    
    init(ctgDictionary: [String : AnyObject]){
        self.title = (ctgDictionary["title"] as? String)!
        self.categoryDescription = (ctgDictionary["description"] as? String)!
    }

    static func downloadAllCategories() -> [Category]{
        
        var categories = [Category]()
        
        let jsonFile = Bundle.main.path(forResource: "rawData", ofType: "json")
        let jsonData = try? Data(contentsOf: URL(fileURLWithPath: jsonFile!))
        
            if let jsonDictionary = NetworkService.parseJSONFromData(jsonData) {
                let ctgDictionaries = jsonDictionary["categories"] as! [[String : AnyObject]]
                for ctgDictionary in ctgDictionaries {
                    let newCategory = Category(ctgDictionary: ctgDictionary)
                    categories.append(newCategory)
                }
            }
            return categories
    }
}
