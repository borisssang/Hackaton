//
//  MenuViewCell.swift
//  Hackaton
//
//  Created by Boris Angelov on 11/16/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import UIKit

class MenuViewCell: UITableViewCell {

    var menuItem: MenuItem! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        if menuItem != nil{
        ItemLable.text = menuItem.title
        ItemDescription.text = menuItem.menuItemDescription
        let menuItemImageURL = menuItem.menuItemImage
        let networkService = NetworkService(url: menuItemImageURL as NSURL)
        networkService.downloadImage { (imageData) in
            let image = UIImage(data: imageData as Data)
            DispatchQueue.main.async(execute: { self.ItemImage.image = image })
        }
    }
}
    
    @IBOutlet weak var ItemLable: UILabel!
    @IBOutlet weak var ItemDescription: UILabel!
    @IBOutlet weak var ItemImage: UIImageView!
}
