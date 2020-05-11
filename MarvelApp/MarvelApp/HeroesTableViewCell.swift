//
//  heroesTableViewCell.swift
//  MarvelApp
//
//  Created by Haitham Gado on 11/10/18.
//  Copyright © 2018 Haitham Gado. All rights reserved.
//

import UIKit

class HeroesTableViewCell: UITableViewCell {
    @IBOutlet weak var heroImage: UIImageView!
    
    @IBOutlet weak var NameLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
