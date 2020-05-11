//
//  ViewController.swift
//  MarvelApp
//
//  Created by Haitham Gado on 11/10/18.
//  Copyright © 2018 Haitham Gado. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import AlamofireObjectMapper

class ViewController: UIViewController {
    @IBOutlet weak var tableViewHeroes: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    let URL_GET_DATA = "https://gateway.marvel.com:443/v1/public/characters?ts=1&apikey=3aef592b37df14ed5f80db2281b4eee2&hash=5794cfce670671e1afc51a38d3251bcc"

    var heroes = [Hero]()
    
    var filterHeroes = [Hero]()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        searchBar.returnKeyType = UIReturnKeyType.done
        
        tableViewHeroes.delegate = self
        tableViewHeroes.dataSource = self
        
        
        Alamofire.request(URL_GET_DATA).responseObject { (response: DataResponse<MarvelHerosJson>) in
            
            let marvelHeros = response.result.value
            
            if let herosResults = marvelHeros?.herosResults {
                for hero in herosResults {
                    self.heroes.append(hero)
                }
                self.tableViewHeroes.reloadData()
            }
        }
    
    }


}

// MARK:- UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate
extension ViewController: UITableViewDelegate, UITableViewDataSource , UISearchBarDelegate{
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching
        {
            return filterHeroes.count
        }
        return heroes.count
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! HeroesTableViewCell
        let hero : Hero
        let filteredHero : Hero
        
        if isSearching
        {
            filteredHero = filterHeroes[indexPath.row]

            cell.NameLabel.text = filteredHero.name
            
            Alamofire.request(filteredHero.imageUrl).responseImage { response in
                
                if let image = response.result.value {
                    cell.heroImage.image = image
                }
            }
        }
        else
        {
            hero = heroes[indexPath.row]

            cell.NameLabel.text = hero.name
            
            Alamofire.request(hero.imageUrl).responseImage { response in
                if let image = response.result.value {
                    cell.heroImage.image = image
                }
            }
        }
        return cell
    }


    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == ""
        {
            isSearching = false
            view.endEditing(true)
            tableViewHeroes.reloadData()
        } else
        {
            isSearching = true
            filterHeroes = heroes.filter({($0.name?.lowercased().contains(searchBar.text!.lowercased()))! } )
            tableViewHeroes.reloadData()

        }
        
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)  {
        searchBar.resignFirstResponder()
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        
        
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        let destination = storyboard.instantiateViewController(withIdentifier: "DetailedViewController") as! DetailedViewController
        
        let cell = self.tableViewHeroes.cellForRow(at: indexPath) as! HeroesTableViewCell
        
        destination.name = cell.NameLabel.text!
        destination.image = cell.heroImage.image!
        if isSearching
        {
            destination.heroDescription = filterHeroes[indexPath.row].description!
            destination.comicsURL = filterHeroes[indexPath.row].comicsURL!
            
            for urls in filterHeroes[indexPath.row].urls!
            {
                destination.url.append(urls)
            }

            

        }
        else
        {
            destination.heroDescription = heroes[indexPath.row].description!
            destination.comicsURL = heroes[indexPath.row].comicsURL!
            destination.seriesURL = heroes[indexPath.row].seriesURL!
            destination.storiesURL = heroes[indexPath.row].storiesURL!
            destination.eventsURL = heroes[indexPath.row].eventsURL!




            for urls in heroes[indexPath.row].urls!
            {
                destination.url.append(urls)
            }

            
        }
        
    

        self.navigationController?.pushViewController(destination, animated: true)
    }

    // MARK spinner
    //    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    //        let lastSectionIndex = tableView.numberOfSections - 1
    //        let lastRowIndex = tableView.numberOfRows(inSection: lastSectionIndex) - 1
    //        if indexPath.section ==  lastSectionIndex && indexPath.row == lastRowIndex {
    //            // print("this is the last cell")
    //            let spinner = UIActivityIndicatorView(style: .gray)
    //            spinner.startAnimating()
    //            spinner.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: tableView.bounds.width, height: CGFloat(44))
    //            spinner.backgroundColor = UIColor.black
    //            self.tableViewHeroes.tableFooterView = spinner
    //            self.tableViewHeroes.tableFooterView?.isHidden = false
    //        }
    //    }
    
    }



