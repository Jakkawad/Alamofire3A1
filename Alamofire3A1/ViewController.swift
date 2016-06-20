//
//  ViewController.swift
//  Alamofire3A1
//
//  Created by Jakkawad Chaiplee on 4/5/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var mainDataArray = NSArray()
    var jsonArray:NSMutableArray?
    var newArray: Array<String> = []
    
    func loadData() {
        Alamofire.request(.POST, "https://www.all2sale.com/sendmail/testfunction/json/apitest.php", parameters: ["api":"productall","productall":"30"])
            .responseJSON { response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                
                // Array
                self.mainDataArray = response.result.value as! NSArray
                //print(self.mainDataArray)
                
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        loadData()
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

