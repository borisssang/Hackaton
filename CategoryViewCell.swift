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
        if category != nil{
        titleLabel.text = category.title
        let categoryImageURL = category.categoryImage
        let networkService = NetworkService(url: categoryImageURL as NSURL)
        networkService.downloadImage { (imageData) in
            let image = UIImage(data: imageData as Data)
            DispatchQueue.main.async(execute: {
                self.categoryImage.image = image
            })
        }}
    }
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
}
