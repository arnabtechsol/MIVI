//
//  DashBoardTableCell.swift
//  WelcomeMIVI
//
//  Created by Arnab on 11/08/18.
//  Copyright © 2018 Arnab. All rights reserved.
//

import UIKit

class DashBoardTableCell: UITableViewCell {

    @IBOutlet weak var infoName: UILabel!
    @IBOutlet weak var info: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
