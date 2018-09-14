//
//  TableViewCell.swift
//  SearchTest
//
//  Created by kimdaeman14 on 2018. 9. 15..
//  Copyright © 2018년 A3LCamel. All rights reserved.
//

import UIKit

class APICustomCell: UITableViewCell {

    static let reusableIdentifier = "APICustomCell"

    
    @IBOutlet weak var ApiLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
