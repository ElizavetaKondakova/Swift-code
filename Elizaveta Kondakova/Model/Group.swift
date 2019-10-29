//
//  Group.swift
//  Elizaveta Kondakova
//
//  Created by Liza on 28/10/2019.
//  Copyright © 2019 Liza. All rights reserved.
//

import UIKit

class Group {
    let image: UIImage?
    let name: String
    
    init(image: UIImage, name: String){
        self.image = image
        self.name = name
    }
    
    init(name: String) {
        self.image = nil
        self.name = name
    }
}
