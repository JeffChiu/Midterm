//
//  FansViewController.swift
//  Movie_Midterm
//
//  Created by Chiu Chih-Che on 2016/9/2.
//  Copyright © 2016年 Jeff. All rights reserved.
//

import UIKit

class FansViewController: UIViewController {

    var signData: [String] = []
    var signString = ""
    
    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var display: UITextView!
    
    @IBAction func addSign(sender: AnyObject) {
        print(inputField.text!)
        signData.append(inputField.text!)
        for i in 0..<signData.count {
            signString += ("\(signData[i]) \n")
        }
        display.text = signString
        signString = ""
        inputField.text = ""
        inputField.resignFirstResponder()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        inputField.text = ""
        // Do any additional setup after loading the view.
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(FansViewController.tapFunction))
        self.view.addGestureRecognizer(tap)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tapFunction() {
        inputField.resignFirstResponder()
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
