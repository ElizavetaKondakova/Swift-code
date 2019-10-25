//
//  UIViewController+ext.swift
//  Elizaveta Kondakova
//
//  Created by Liza on 22/10/2019.
//  Copyright © 2019 Liza. All rights reserved.
//

import UIKit
extension UIViewController {
    func show(messadge: String){
       let alertVC = UIAlertController(title: "ошибка", message: messadge, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "ok", style: .default, handler: nil)
    
        alertVC.addAction(okAction)
        present(alertVC, animated: true)

    }
    
}
