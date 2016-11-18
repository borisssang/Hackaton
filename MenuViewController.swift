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
        
        //след наклонената черта ще е името на категорията и просто свалям всички меню айтъми от нея
        get_data_from_url("http://pastebin.com/raw/EwnLhzLx/" + category)
        
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
    
    func get_data_from_url(_ link:String)
    {
        let url:URL = URL(string: link)!
        let session = URLSession.shared
        
        let request = NSMutableURLRequest(url: url)
        request.httpMethod = "GET"
        request.cachePolicy = NSURLRequest.CachePolicy.reloadIgnoringCacheData
        
        
        let task = session.dataTask(with: request as URLRequest, completionHandler: {
            (
            data, response, error) in
            
            guard let _:Data = data, let _:URLResponse = response  , error == nil else {
                
                return
            }
            
            self.extract_json(data!)
            
        })
        task.resume()
    }

    func extract_json(_ data: Data)
    {
        let json: Any?
        
        do
        {
            json = try JSONSerialization.jsonObject(with: data, options: [])
        }
        catch
        {
            return
        }
        
        guard let data_list = json as? NSArray else
        {
            return
        }
        
        if let menuItems_list = json as? NSArray
        {
            for i in 0 ..< data_list.count
            {
                if let menuDictionary = menuItems_list[i] as? [String:AnyObject]
                {
                    let newMenuItem = MenuItem(menuDictionary: menuDictionary)
                    menuItems.append(newMenuItem)
                }
            }
        }
        DispatchQueue.main.async(execute: {self.do_table_refresh()})
    }
    
    func do_table_refresh()
    {
        self.tableView.reloadData()
    }
}

