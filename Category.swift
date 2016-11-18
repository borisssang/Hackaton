//
//  Category.swift
//  Hackaton
//
//  Created by Boris Angelov on 11/16/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import Foundation
import UIKit

class Category: NSObject {
    
    var title: String
    var categoryImage: URL
    
    init(title: String, description: String, image: URL){
        self.title = title
        self.categoryImage = image
    }
    
    init(ctgDictionary: [String : AnyObject]){
        self.title = (ctgDictionary["title"] as? String)!
        self.categoryImage = URL(string: ctgDictionary["image"] as! String)!
    }
}
