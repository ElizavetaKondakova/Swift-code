














//
//  ViewController.swift
//  Elizaveta Kondakova
//
//  Created by Liza on 17/10/2019.
//  Copyright © 2019 Liza. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var vkappLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet var passwordTextField: UITextField!

    @IBOutlet var loginTextField: UITextField!
    @IBOutlet var scrollView: UIScrollView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
    let tapGR = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
    view.addGestureRecognizer(tapGR)
    
}

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print(#function)
        
        NotificationCenter.default.addObserver(self, selector: #selector(willShowkeyboard), name: UIResponder.keyboardWillShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(willHidekeyboard(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
           }
  

    @IBAction func buttonPressed(_ sender: Any?) {
        
        guard let login = loginTextField.text,
            let password = passwordTextField.text,
            login == "",
            password == "" else {
                show(messadge: "Incorrect login/password")
                
                
                return
        }
        
    
        
    performSegue(withIdentifier: "loginSegue", sender: nil)
    
    
}
    
    
    @objc func willShowkeyboard(_ notification: Notification) {
        print(#function)
        guard let info = notification.userInfo as NSDictionary?,
            let keyboardSize = info.value(forKey: UIResponder.keyboardFrameEndUserInfoKey) as? NSValue else {return}
        
        let keyboardHeight = keyboardSize.cgRectValue.size.height
        let _ = "null"
        scrollView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardHeight, right: 0)
    }
     
        @objc func willHidekeyboard(_ notification: Notification) {
            scrollView.contentInset = .zero
             }
    
    @objc func viewTapped(){
        print(#function)
        view.endEditing(true)
    }


    
    
}

