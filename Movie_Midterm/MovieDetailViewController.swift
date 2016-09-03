//
//  MovieDetailViewController.swift
//  Movie_Midterm
//
//  Created by Chiu Chih-Che on 2016/9/2.
//  Copyright © 2016年 Jeff. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var movie = Movie()
    
    @IBOutlet weak var info: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = movie.name
        imageView.image = UIImage(named:  movie.image)
        info.text = movie.description
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
