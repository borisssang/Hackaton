//
//  CategoryViewCell.swift
//  Hackaton
//
//  Created by Boris Angelov on 11/16/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import UIKit

class CategoryViewCell: UITableViewCell {

    var category: Category! {
        didSet {
            self.updateUI()
        }
    }
    
    func updateUI(){
        titleLabel.text = category.title
        descriptionLabel.text = category.categoryDescription
    }
    
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    
// authorImageView.image = UIImage(named: "duc")
//        createdAtLabel.text = "Duc Tran | \(episode.createdAt!)"
//        
//        let thumbnailURL = episode.thumbnailURL
//        let networkService = NetworkService(url: thumbnailURL!)
//        networkService.downloadImage { (imageData) in
//            let image = UIImage(data: imageData as Data)
//            DispatchQueue.main.async(execute: {
//                self.thumbnailImageView.image = image
//            })
//        }

}
