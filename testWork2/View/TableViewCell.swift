//
//  TableViewCell.swift
//  testWork2
//
//  Created by кирилл корнющенков on 13/10/2019.
//  Copyright © 2019 кирилл корнющенков. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var manufacturerLabel: UILabel!
    @IBOutlet weak var modelLabel: UILabel!
    @IBOutlet weak var carBodyLabel: UILabel!
    @IBOutlet weak var yearsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
