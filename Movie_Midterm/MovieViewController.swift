//
//  MovieViewController.swift
//  Movie_Midterm
//
//  Created by Chiu Chih-Che on 2016/9/2.
//  Copyright © 2016年 Jeff. All rights reserved.
//

import UIKit
import Firebase
import SDWebImage

class MovieViewController: UIViewController {
    
    var movieList: [Movie] = []
    var refreshControl: UIRefreshControl!
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.prepareMovieList()
        
        tableView.dataSource = self
    
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
     
        //pull to refresh
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(MovieViewController.prepareMovieList), forControlEvents: UIControlEvents.ValueChanged)
        tableView.addSubview(refreshControl)
        
    }

    func prepareMovieList(){
        movieList.removeAll()
        let moviesRef = FIRDatabase.database().reference().child("Movies")
        moviesRef.observeEventType(.ChildAdded, withBlock: {
            snapshot in
            let nameFromFirebase = snapshot.value?.objectForKey("name") as! String
            let imageFromFirebase = snapshot.value?.objectForKey("image") as! String
            let startDateFromFirebase = snapshot.value?.objectForKey("startDate") as! String
            let descriptionFromFirebase = snapshot.value?.objectForKey("description") as! String
            self.movieList.append(Movie(name: nameFromFirebase, image: imageFromFirebase, startDate: startDateFromFirebase, description: descriptionFromFirebase))
            
            print("nameFromFirebase = \(nameFromFirebase) \nimageFromFirebase = \(imageFromFirebase) \nstartDateFromFirebase = \(startDateFromFirebase)")
            
            self.tableView.reloadData()
            self.refreshControl.endRefreshing()
            
        })
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            let vc = segue.destinationViewController as! MovieDetailViewController  //as 是轉型
            vc.movie = movieList[(tableView.indexPathForSelectedRow?.row)!]
        }
    }

}

extension MovieViewController: UITableViewDataSource {
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("MovieTableViewCell", forIndexPath: indexPath) as! MovieTableViewCell
        cell.movieImageView?.sd_setImageWithURL(NSURL(string: movieList[indexPath.row].image))
        cell.movieName.text = movieList[indexPath.row].name
        cell.movieStartDate.text = movieList[indexPath.row].startDate
                
        return cell
    }
    
}

extension MovieViewController: UITableViewDelegate {
    
}
