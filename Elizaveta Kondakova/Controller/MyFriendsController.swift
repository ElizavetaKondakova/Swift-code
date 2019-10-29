//
//  MyFriendsController.swift
//  Elizaveta Kondakova
//
//  Created by Liza on 28/10/2019.
//  Copyright © 2019 Liza. All rights reserved.
//

import UIKit

class MyFriendsController: UITableViewController {
    
    let username =  [
        Friends(image: UIImage(named: "Ejik")!, name: "Starik Khotabbov"),
        Friends(image: UIImage(named: "Ejik")!, name: "Snegurochka Dedova"),
        Friends(image: UIImage(named: "Ejik")!, name: "Volk Serov")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
       
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return username.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "MyFriendsCell", for: indexPath) as? MyFriendsCell else {
            preconditionFailure("MyFriendsCell cannot be dequeued")
        }
       
        print("Section: " + String(indexPath.section) + ", row: " + String(indexPath.row))
        let friendname = username[indexPath.row].name
        let friendimage = username[indexPath.row].image
        
        cell.userImageView.image = friendimage
        cell.userNameLabel.text = friendname
        
        return cell
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "Show Forecast",
          let destinationVC = segue.destination as? PhotoGalleryController,
        let indexPath = tableView.indexPathForSelectedRow {
            let friendname = username[indexPath.row].name
            destinationVC.title = friendname 
        }
    }
}
