//
//  DetailedViewController.swift
//  MarvelApp
//
//  Created by Haitham Gado on 1/9/19.
//  Copyright © 2019 Haitham Gado. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import AlamofireObjectMapper

class DetailedViewController: UIViewController , UITableViewDataSource, UITableViewDelegate {
    
    var name = ""
    var image = UIImage()
    var heroDescription = ""
    var comicsCount = 0
    var comicsURL = ""
    var seriesCount = 0
    var seriesURL = ""
    var itemsCount = 0
    var itemsURL = ""
    var storiesCount = 0
    var storiesURL = ""
    var eventsCount = 0
    var eventsURL = ""
    var url = [Url]()
    
    var comicsDataSource = [ComicsSeriesStoriesEvents]()
    var seriesDataSource = [ComicsSeriesStoriesEvents]()
    var storiesDataSource = [ComicsSeriesStoriesEvents]()
    var eventsDataSource = [ComicsSeriesStoriesEvents]()
   

    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Alamofire.request("\(comicsURL)?ts=1&apikey=3aef592b37df14ed5f80db2281b4eee2&hash=5794cfce670671e1afc51a38d3251bcc").responseObject { (response: DataResponse<ComicsSeriesStoriesEventsJson>) in
            
            let marvelComics = response.result.value
            
            if let comicResults = marvelComics?.comicsSeriesStoriesEventsResults {
                self.comicsDataSource = comicResults
            }
            self.tableView.reloadData()
        }
        
        Alamofire.request("\(seriesURL)?ts=1&apikey=3aef592b37df14ed5f80db2281b4eee2&hash=5794cfce670671e1afc51a38d3251bcc").responseObject { (response: DataResponse<ComicsSeriesStoriesEventsJson>) in
            
            let marvelSeries = response.result.value
            
            print("--------------------------------------- \(response)")
            print("-------------------------------------jjj-- \(self.seriesURL)")

            if let seriesResults = marvelSeries?.comicsSeriesStoriesEventsResults {
                self.seriesDataSource = seriesResults
            }
            self.tableView.reloadData()

        }
        
        Alamofire.request("\(storiesURL)?ts=1&apikey=3aef592b37df14ed5f80db2281b4eee2&hash=5794cfce670671e1afc51a38d3251bcc").responseObject { (response: DataResponse<ComicsSeriesStoriesEventsJson>) in
            
            let marvelStories = response.result.value
            
            if let storiesResults = marvelStories?.comicsSeriesStoriesEventsResults {
                self.storiesDataSource = storiesResults
            }
            self.tableView.reloadData()

        }
        
        Alamofire.request("\(eventsURL)?ts=1&apikey=3aef592b37df14ed5f80db2281b4eee2&hash=5794cfce670671e1afc51a38d3251bcc").responseObject { (response: DataResponse<ComicsSeriesStoriesEventsJson>) in
            
            let marvelEvents = response.result.value
            
            if let eventsResults = marvelEvents?.comicsSeriesStoriesEventsResults {
                self.eventsDataSource = eventsResults
            }
            self.tableView.reloadData()

        }
        
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5 + url.count
    }
    
    
  
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        

        switch indexPath.row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: "TopCell", for: indexPath)as! TopCell
            cell.heroImage.image = image
            cell.heroName.text = name
            cell.heroDescription.text = heroDescription
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath)as! MainTableViewCell
            cell.dataSource = comicsDataSource
            cell.collectionTitle.text = "COMICS"

           
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath)as! MainTableViewCell
            cell.dataSource = seriesDataSource
            cell.collectionTitle.text = "SERIES"

            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath)as! MainTableViewCell
            cell.dataSource = storiesDataSource
            cell.collectionTitle.text = "STORIES"
            
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: "MainTableViewCell", for: indexPath)as! MainTableViewCell
            cell.dataSource = eventsDataSource
            cell.collectionTitle.text = "EVENTS"
            
            return cell
            
        case 5,6:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RelatedLinksCell", for: indexPath)as! RelatedLinksCell
            
            
           
            if ((url[indexPath.row-5].urlType) != nil )
            {
                cell.linkTitle.text = url[indexPath.row-5].urlType?.capitalizingFirstLetter()
                return cell
                }

        case 7:
            
            let cell = tableView.dequeueReusableCell(withIdentifier: "RelatedLinksCell", for: indexPath)as! RelatedLinksCell
            
//            if ((url.count) > 2)
//            {
                if ((url[indexPath.row-5].urlType) != nil )
                {
                    cell.linkTitle.text = url[indexPath.row-5].urlType?.capitalizingFirstLetter()
                    return cell
                }
                return cell

//            }


        default:
            print("Default Selected")
        
        }
        return cell
    }
    
    

    



    


    
}


