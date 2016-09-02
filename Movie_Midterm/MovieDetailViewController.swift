//
//  MovieDetailViewController.swift
//  Movie_Midterm
//
//  Created by Chiu Chih-Che on 2016/9/2.
//  Copyright © 2016年 Jeff. All rights reserved.
//

import UIKit

class MovieDetailViewController: UIViewController {

    var movieName: String = ""
    var movieImage: String = ""
    var movieDescription: String = ""
    
    
    @IBOutlet weak var info: UILabel!
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = movieName
        imageView.image = UIImage(named:  movieImage)
        info.text = "2015年，林真心(陳喬恩飾)是一家公司的白領女員工，她很努力但並不滿足目前的生活狀態，於是開始回憶起自己少女時代的美好時光。時光追溯到1990年代中期，就讀於高中三年級4班的林真心(宋芸樺飾)有兩位好姐妹——何美(五熊飾)和小隻(大文飾)，林真心的偶像是劉德華，小隻的偶像是金城武和郭富城。和其他大多數女同學一樣，真心也暗戀著上全校最受歡迎的男神歐陽非凡(李玉璽飾)，歐陽不僅長得帥，會唸書，而且籃球打得好，還會彈吉他。一天，她收到了一封包含詛咒內容的「幸運信」。"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
