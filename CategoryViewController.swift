//
//  CategoryViewController.swift
//  Hackaton
//
//  Created by Boris Angelov on 11/16/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import UIKit

class CategoryViewController: UITableViewController {

    var categories = [Category]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //getting the data from the server
        let urlString = "http://pastebin.com/raw/GbG79Pxz"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("error")
            } else {
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                    if let ctgDictionaries = parsedData["categories"] as? [[String:AnyObject]]{
                        for ctgDictionary in ctgDictionaries {
                            let newCategory = Category(ctgDictionary: ctgDictionary)
                            self.categories.append(newCategory)
                        }
                    } } catch let error as NSError {
                        print(error)
                }
            }
            }.resume()
        
        self.tableView.reloadData()
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.separatorStyle = .none
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath) as!
        CategoryViewCell
        
        let category = self.categories[indexPath.row]
        
        cell.category = category
        
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
        IndexPath)
    {
        let selectedCategory = String(describing: self.categories[indexPath.row])
        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
                    if let detailVC = segue.destination as? MenuViewController{
                    detailVC.category = selectedCategory
            }
        }
    }
}

