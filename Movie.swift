//
//  Movie.swift
//  Movie_Midterm
//
//  Created by Chiu Chih-Che on 2016/9/3.
//  Copyright © 2016年 Jeff. All rights reserved.
//

import Foundation

class Movie {
    var name: String = ""
    var image: String = ""
    var startDate: String = ""
    var description: String = ""
    
    init() {}
    
    init(name: String, image: String, startDate: String, description: String){
        self.name = name
        self.image = image
        self.startDate = startDate
        self.description = description
    }
}