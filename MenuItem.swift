//
//  MenuItem.swift
//  Hackaton
//
//  Created by Boris Angelov on 11/16/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import Foundation

class MenuItem: NSObject {
    
    var title: String
    var menuItemDescription: String
    var menuItemImage: URL
    
    init(title: String, description: String, image: URL, ctg: String){
        self.title = title
        self.menuItemDescription = description
        self.menuItemImage = image
    }
    
    init(menuDictionary: [String : AnyObject]){
        self.title = (menuDictionary["title"] as? String)!
        self.menuItemDescription = (menuDictionary["description"] as? String)!
        self.menuItemImage = URL(string: menuDictionary["image"] as! String)!
    }    
}
