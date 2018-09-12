//
//  ViewController.swift
//  SearchTest
//
//  Created by kimdaeman14 on 2018. 9. 11..
//  Copyright © 2018년 A3LCamel. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    let nameArr = ["affairs","affects","affixed","afflict","affront","afghans","brewed","brewer","briber","bricks","brides","bridle","briers","crowed","crowns","cruder","crumbs","crummy","crusts","crutch","crying","despair","despite","despond","dessert","destiny","details","detects","emerald","emerges","eminent","emitted","emotion","empathy","empires"]

    var searchCountry = [String]()
    var searching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

}
extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if searching{
            return searchCountry.count
        }else{
            return nameArr.count
        }
    }
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if searching{
            cell?.textLabel?.text = searchCountry[indexPath.row]
        }else{
            cell?.textLabel?.text = nameArr[indexPath.row]
        }
        return cell!
    }
}

extension ViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchCountry = nameArr.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searching = false
        searchBar.text = ""
        tableView.reloadData()
    }
}

