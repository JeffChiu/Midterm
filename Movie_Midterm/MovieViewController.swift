//
//  MovieViewController.swift
//  Movie_Midterm
//
//  Created by Chiu Chih-Che on 2016/9/2.
//  Copyright © 2016年 Jeff. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    var movieList: [Movie] = []
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableViewAutomaticDimension
        
        prepareMovieList()
    }

    func prepareMovieList(){
        
        movieList.append(Movie(name: "我的少女時代", image: "our_times", startDate: "上映日期：2016/09/02", description: "2015年，林真心(陳喬恩飾)是一家公司的白領女員工，她很努力但並不滿足目前的生活狀態，於是開始回憶起自己少女時代的美好時光。時光追溯到1990年代中期，就讀於高中三年級4班的林真心(宋芸樺飾)有兩位好姐妹——何美(五熊飾)和小隻(大文飾)，林真心的偶像是劉德華，小隻的偶像是金城武和郭富城。和其他大多數女同學一樣，真心也暗戀著上全校最受歡迎的男神歐陽非凡(李玉璽飾)，歐陽不僅長得帥，會唸書，而且籃球打得好，還會彈吉他。一天，她收到了一封包含詛咒內容的「幸運信」，出於害怕，她先後抄寫了兩封幸運信分別秘密給了班導兼數學老師王白丹(那維勳飾)和深受男生追捧的同班校花兼鄰居陶敏敏(簡廷芮飾)。她更看到愛惹事的校園霸王、三年級17班的徐太宇(王大陸飾)欺負了歐陽非凡，於是她又將一封信偷偷給了徐太宇，之後正在馬路上讀此信的徐突然被車撞傷。徐的好哥們糾察隊成員在檢查教室時發現了徐的信是林真心發出的，於是她被帶到了正在看港片錄像的徐的面前，在徐的脅迫下，為了保護好歐陽不受徐的欺負，她隻得答應自己幫對方做作業和代買食物。"))
        
        movieList.append(Movie(name: "動物方城市", image: "Zootopia", startDate: "上映日期：2016/09/02", description: "《動物方城市》（英語：Zootopia）[註 3]是一部美國華特迪士尼動畫工作室製作、並由華特迪士尼影業所發行的3D電腦動畫動作喜劇冒險電影[9]，也是第55部迪士尼經典動畫長片。該片由拜倫·霍華、瑞奇·摩爾和傑瑞·布希聯合執導，主要的配音員包括了吉妮佛·古德溫、傑森·貝特曼、伊德瑞斯·艾爾巴、珍妮·斯蕾特、內特·托倫斯、湯米·鐘、J·K·西蒙斯、奧塔薇亞·史班森、阿蘭·圖代克和夏奇拉等人。電影故事的主要背景設定在一個隻有人類以外的哺乳動物所居住的大城市中，其劇情則敘述了主角兔子女警和一隻街頭行騙高手狐狸合作解開一樁肉食動物的失蹤案，並揭發其背後的陰謀。"))
        
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
        cell.movieImageView.image = UIImage(named:movieList[indexPath.row].image)
        cell.movieName.text = movieList[indexPath.row].name
        cell.movieStartDate.text = movieList[indexPath.row].startDate
                
        return cell
    }
    
}

extension MovieViewController: UITableViewDelegate {
    
}
