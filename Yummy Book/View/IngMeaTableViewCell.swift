//
//  IngMeaTableViewCell.swift
//  Yummy Book
//
//  Created by Ricky Memije on 7/6/22.
//

import UIKit

class IngMeaTableViewCell: UITableViewCell {
    @IBOutlet weak var ingCellLabel: UILabel!
    @IBOutlet weak var meaCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
