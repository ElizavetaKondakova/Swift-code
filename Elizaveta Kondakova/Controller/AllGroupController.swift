//
//  AllGroupController.swift
//  Elizaveta Kondakova
//
//  Created by Liza on 27/10/2019.
//  Copyright © 2019 Liza. All rights reserved.
//

import UIKit

class AllGroupController: UIViewController {
    
    @IBOutlet var tableView: UITableView! {
        
    
     didSet {
        tableView.dataSource = self
        }
}

    let Mygroup = [
         Group(image: UIImage(named: "imagee")!, name: "Smart"),
         Group(image: UIImage(named: "imagee")!, name: "Films"),
         Group(image: UIImage(named: "imagee")!, name: "Photo")
     ]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

 }


extension AllGroupController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Mygroup.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "BasicGroupsCell", for: indexPath)
        
        let groupname = Mygroup[indexPath.row].name
        let groupImage = Mygroup[indexPath.row].image
        cell.imageView?.image = groupImage
        cell.textLabel?.text = groupname
        
        return cell
        
    }
    
    
    
    
}
