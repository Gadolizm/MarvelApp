//
//  TopCell.swift
//  MarvelApp
//
//  Created by Haitham Gado on 1/9/19.
//  Copyright © 2019 Haitham Gado. All rights reserved.
//

import UIKit

class TopCell: UITableViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    
    @IBOutlet weak var heroName: UILabel!
    
    @IBOutlet weak var heroDescription: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
