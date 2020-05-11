//
//  MainTableViewCell.swift
//  MarvelApp
//
//  Created by Haitham Gado on 1/9/19.
//  Copyright © 2019 Haitham Gado. All rights reserved.
//

import UIKit
import AlamofireImage
import Alamofire

class MainTableViewCell: UITableViewCell {
    
    @IBOutlet weak var collectionTitle: UILabel!
    
    @IBOutlet weak var marvelCollection: UICollectionView!
    
    var dataSource = [ComicsSeriesStoriesEvents]() {
        didSet {
            marvelCollection.reloadData()
        }
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

extension MainTableViewCell: UICollectionViewDataSource , UICollectionViewDelegate
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count

    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
     cell.imageTitle.text = dataSource[indexPath.row].title
        
        Alamofire.request(dataSource[indexPath.row].imageUrl).responseImage { response in
            
            if let image = response.result.value {
                cell.CollectionImage.image = image
            }
        }
        return cell
    }

}

