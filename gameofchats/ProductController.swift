//
//  ProductController.swift
//  gameofchats
//
//  Created by RSS on 5/25/18.
//  Copyright © 2018 letsbuildthatapp. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ProductController: UITableViewController//, UITableViewDelegate, UITableViewDataSource
{
    
    var ref:FIRDatabaseReference?
    var databaseHandle:FIRDatabaseHandle?
    var postData = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //set the firebase reference
        ref = FIRDatabase.database().reference()
        
        //retrieve the posts and listen for changes
         databaseHandle = ref?.child("Product").observe(.childAdded, with: { (snapshot) in
            //code to excute when a child is added under products
            
            //try to convert the value of data to string
            let post = snapshot.value as? String
            
            if let actualPost = post {
                //post data to our postdata array
            self.postData.append(actualPost)
                
                self.tableView.reloadData()
            }
        })
        
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }
}
