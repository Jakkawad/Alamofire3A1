//
//  ViewController.swift
//  Alamofire3A1
//
//  Created by Jakkawad Chaiplee on 4/5/2559 BE.
//  Copyright © 2559 Jakkawad Chaiplee. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    var mainDataArray = NSArray()
    var jsonArray:NSMutableArray?
    var newArray: Array<String> = []
    
    //Number
    var numberToAdd = 10
    var numberLimit = 100
    var numberCurrent = 40
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 50
        return mainDataArray.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0")
        let item = mainDataArray[indexPath.row] as! NSDictionary
        cell0?.textLabel?.text = item.objectForKey("ProductName") as? String
        return cell0!
    }
    
    func loadData() {
        Alamofire.request(.POST, "https://www.all2sale.com/sendmail/testfunction/json/apitest.php", parameters: ["api":"product_rand","product_rand":numberCurrent])
            .responseJSON { response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                
                // Array
                self.mainDataArray = response.result.value as! NSArray
                print("COUNT\(self.mainDataArray.count)")
                self.tableView.reloadData()
                
        }
    }
    
    func scrollViewDidEndDragging(scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        let currentOffset = scrollView.contentOffset.y;
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height;
        
        //NSInteger result = maximumOffset - currentOffset;
        
        // Change 10.0 to adjust the distance from bottom
        if (maximumOffset - currentOffset <= 10.0) {
            //print("ScrollView")
            //[self methodThatAddsDataAndReloadsTableView];
            if numberCurrent == numberLimit {
                print("Out of RANG!!")
            } else {
                numberCurrent += numberToAdd
                
                print("NumberCurrent\(numberCurrent)")
                loadData()
                self.tableView.reloadData()
            }
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

