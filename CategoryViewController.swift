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
        
        categories = Category.downloadAllCategories()
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "Category Cell", for: indexPath) as!
        CategoryViewCell
        
        let category = self.categories[indexPath.row]
        
        cell.category = category
        
        return cell
    }
    

//    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath:
//        IndexPath)
//    {
//        let selectedEpisode = self.episodes[indexPath.row]
//        
//        // import SafariServices
//        let safariVC = SFSafariViewController(url: selectedEpisode.url! as URL)
//        safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
//        safariVC.delegate = self
//        self.present(safariVC, animated: true, completion: nil)
//    }
//    
//    // MARK: - Target / Action
//    
//    @IBAction func fullBlogDidTap(_ sender: AnyObject)
//    {
//        // import SafariServices
//        let safariVC = SFSafariViewController(url: URL(string: "http://www.ductran.io/blog")!)
//        safariVC.view.tintColor = UIColor(red: 248/255.0, green: 47/255.0, blue: 38/255.0, alpha: 1.0)
//        safariVC.delegate = self
//        self.present(safariVC, animated: true, completion: nil)
//    }
//    
//}
//
//extension EpisodesTableViewController : SFSafariViewControllerDelegate
//{
//    func safariViewControllerDidFinish(_ controller: SFSafariViewController) {
//        controller.dismiss(animated: true, completion: nil)
//    }
//}

}
