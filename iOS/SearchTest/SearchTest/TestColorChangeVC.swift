//
//  FontColorChangeViewController.swift
//  SearchTest
//
//  Created by kimdaeman14 on 2018. 9. 12..
//  Copyright © 2018년 A3LCamel. All rights reserved.
//

import UIKit

class TestColorChangeVC: UIViewController {

    @IBOutlet weak var tableView:UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()

           tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: CustomCell.reusableIdentifier)
        
    }

   

}


extension TestColorChangeVC : UITableViewDataSource {
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10
    }
    
   
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
       
////
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
//        cell.textLabel?.text = "1"
//        return cell
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.reusableIdentifier, for: indexPath) as! CustomCell
        
        return cell
    }
}
