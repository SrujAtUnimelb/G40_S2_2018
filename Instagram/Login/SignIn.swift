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
    
    var window: UIWindow?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginStatusLabel.isHidden = true
        loginStatusLabel.isEnabled = true
    
        //Do any additional setup after loading the view.
        
        //Memorize logged in user and save in App memory
//        Auth.auth().addStateDidChangeListener() { auth, user in
//            if user != nil {
//                self.switchToHome()
//            }
//    }
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
                self.loginStatusLabel.text = "Logged In Succeeded!"
                self.loginStatusLabel.isHighlighted = true
                self.loginStatusLabel.isHidden = false
                
                //Freeze for 2 seconds.
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // change 2 to desired number of seconds
                    self.switchToHome()
                }
                
            }
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func switchToHome() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let myTabBar = storyboard.instantiateViewController(withIdentifier: "TabBar") as! UITabBarController
        self.present(myTabBar, animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation
badly formatted
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
