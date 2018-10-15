//
//  ViewController.swift
//  Instagram_Pro
//
//  Created by DAWEIXU on 2018/10/15.
//  Copyright © 2018 unimelb_daweixu. All rights reserved.
//

import UIKit

class Registration: UIViewController {
    
    let uploadProfilePicBtn: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(#imageLiteral(resourceName: "plus"), for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let emailTextField: UITextField = {
        let textfield = UITextField()
        textfield.placeholder = "Enter Email..."
        textfield.backgroundColor = UIColor(white: 0, alpha: 0.05)
        textfield.borderStyle = .roundedRect
        textfield.font = UIFont.systemFont(ofSize: 14)
        textfield.translatesAutoresizingMaskIntoConstraints = false
        return textfield
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(uploadProfilePicBtn)
        uploadProfilePicBtn.heightAnchor.constraint(equalToConstant: 180).isActive = true
        uploadProfilePicBtn.widthAnchor.constraint(equalToConstant: 180).isActive = true
        uploadProfilePicBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        uploadProfilePicBtn.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        
        view.addSubview(emailTextField)
        
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: uploadProfilePicBtn.bottomAnchor,constant:20),
            emailTextField.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 40),
            emailTextField.rightAnchor.constraint(equalTo: view.rightAnchor, constant:-40),
            emailTextField.heightAnchor.constraint(equalToConstant: 50)
            ])
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        view.addSubview(uploadProfilePicBtn)
        
    }


}

