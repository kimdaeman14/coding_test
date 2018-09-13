//
//  CustomCell.swift
//  SearchTest
//
//  Created by kimdaeman14 on 2018. 9. 13..
//  Copyright © 2018년 A3LCamel. All rights reserved.
//

import UIKit

protocol HistoryDBdeleteDelegate: class { //프로토콜 aa는 func b()를 꼭 구현해야한다.
    func historyDBDelete(string: String)
}

class CustomCell: UITableViewCell {

    static let reusableIdentifier = "CustomCell"

    weak var delegate:HistoryDBdeleteDelegate?

    
    @IBOutlet weak var historyLabel: UILabel!
    
    @IBAction func DBDeleteButton(_ sender: Any) {
        delegate?.historyDBDelete(string: historyLabel.text!)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
