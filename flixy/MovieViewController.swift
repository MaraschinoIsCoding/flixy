//
//  MovieViewController.swift
//  flixy
//
//  Created by 万亦然 on 2020/10/19.
//  Copyright © 2020 Maraschino. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    @IBOutlet var tableView: UITableView!
    var movies = [[String:Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self // assign VC to datasource property
        tableView.delegate = self
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
           // This will run when the network request returns
           if let error = error {
              print(error.localizedDescription)
           } else if let data = data {
            let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
            

              // TODO: Get the array of movies
            self.movies = dataDictionary["results"] as! [[String:Any]] //assign, cast
            
              // TODO: Store the movies in a property to use elsewhere
            
              // TODO: Reload your table view data
            self.tableView.reloadData() //call 20(#row) times
           }
        }
        task.resume()
    }
    
    // called right when VC starts, but no movies received yet
    // return the number of rows in a section
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    // return the actual table view cell to be displayed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieCell //access to 3 outlets
        let movie = movies[indexPath.row]
        let title = movie["title"] as! String
        let synopsis = movie["overview"] as! String
        cell.titleLabel.text = title
        cell.synopsisLabel.text = synopsis
        return cell
    }

}
