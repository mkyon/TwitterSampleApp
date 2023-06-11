//
//  TableViewCell.swift
//  TwitterSampleApp
//
//  Created by 松本京子 on 2023/06/02.
//

import UIKit

class TableViewCell: UITableViewCell {
    @IBOutlet weak var deleteBtn: UIButton!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var tweetLbl: UILabel!
    @IBOutlet weak var userNameLbl: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
