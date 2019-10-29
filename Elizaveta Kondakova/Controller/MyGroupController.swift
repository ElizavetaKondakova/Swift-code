//
//  MyGroupController.swift
//  Elizaveta Kondakova
//
//  Created by Liza on 27/10/2019.
//  Copyright © 2019 Liza. All rights reserved.
//

import UIKit

class MyGroupController: UITableViewController {
    
    var  Mygroup = [
        Group(image: UIImage(named: "imagee")!, name: "Weekend"),
        Group(image: UIImage(named: "imagee")!, name: "Summer"),
        Group(image: UIImage(named: "imagee")!, name: "Holiday")
    ]
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        navigationController?.setNavigationBarHidden(false, animated: true)
        
    }
    
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
      return Mygroup.count
        }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "GroupsCell", for: indexPath) as? GroupsCell else {
            preconditionFailure("GroupsCell cannot be dequeued")
            
        }

         
        print("Section: " + String(indexPath.section) + ", row: " + String(indexPath.row))
        let groupname = Mygroup[indexPath.row].name
        let groupImage = Mygroup[indexPath.row].image
        
        cell.groupLabelView.text = groupname
        cell.groupImageView.image = groupImage
    
        return cell
        
        }
   
    @IBAction func addSelectedGroup(segue: UIStoryboardSegue) {
        if let sourceVC = segue.source as? AllGroupController,
            let indexPath = sourceVC.tableView.indexPathForSelectedRow {
            let group = sourceVC.Mygroup[indexPath.row]
            if !Mygroup.contains(where: { $0.name == group.name } ) {
            Mygroup.append(group)
            tableView.reloadData()
        }
    }
    
      }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            Mygroup.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

}
