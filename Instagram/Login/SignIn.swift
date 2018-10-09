//
//  SignIn.swift
//  Instagram
//
//  Created by DAWEIXU on 2018/9/30.
//  Copyright © 2018 unimelb_daweixu. All rights reserved.
//

import UIKit
import Firebase

class SignIn: UIViewController {

    @IBOutlet weak var _signup: UIButton!
    @IBOutlet weak var _signin: UIButton!
    @IBOutlet weak var _password: UITextField!
    @IBOutlet weak var _username: UITextField!
    @IBOutlet weak var loginStatusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginStatusLabel.isHidden = true
        loginStatusLabel.isEnabled = true
        // Do any additional setup after loading the view.
    }

    @IBAction func SignInButton(_ sender: Any) {
        
        Auth.auth().signIn(withEmail: _username.text!, password: _password.text!) { (user, error) in
            if (error != nil){
                print(error!)
                print(error.debugDescription)
                print("ERROR - \(error!.localizedDescription)")
                
                
                self.loginStatusLabel.text = error?.localizedDescription
                self.loginStatusLabel.isHighlighted = true
                self.loginStatusLabel.isHidden = false
                
            } else {
                print("User logged in")
                
                let appDelegate = UIApplication.shared.delegate as! AppDelegate
                appDelegate.login()
                
                
                 //self.performSegue(withIdentifier: "goToFirstTabView", sender: self)
                //self.dismiss(animated: true, completion: nil)
                
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
