//
//  MenuViewController.swift
//  Hackaton
//
//  Created by Boris Angelov on 11/16/16.
//  Copyright © 2016 Boris Angelov. All rights reserved.
//

import UIKit

class MenuViewController: UITableViewController {

    var menuItems = [MenuItem]()
    var category: String = "default"
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let urlString = "http://pastebin.com/raw/LjUjfGUi"
        let url = URL(string: urlString)
        let request = URLRequest(url: url!)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if error != nil {
                print("error")
            } else {
                do {
                    let parsedData = try JSONSerialization.jsonObject(with: data!, options: .allowFragments) as! [String:Any]
                    if let menuDictionaries = parsedData[self.category] as? [[String:AnyObject]]{
                        for menuDictionary in menuDictionaries {
                            let menuItem = MenuItem(menuDictionary: menuDictionary)
                            self.menuItems.append(menuItem)
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
        return menuItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MenuCell", for: indexPath) as!
        MenuViewCell
        
        let menuItem = self.menuItems[indexPath.row]
        
        cell.menuItem = menuItem
        
        return cell
    }
}
