//
//  FirstViewController.swift
//  Instagram
//
//  Created by DAWEIXU on 2018/9/28.
//  Copyright © 2018 unimelb_daweixu. All rights reserved.
//

import UIKit
import Firebase

class UserFeed: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
<<<<<<< HEAD
          navigationController?.isNavigationBarHidden = false
        checkUserLoggedIn()
        
    }
    
=======
        navigationController?.isNavigationBarHidden = false
        checkUserLoggedIn()
    }
    
    //
>>>>>>> 733fd1e4817121b5da381bb6ff07607faaf9c339
    func checkUserLoggedIn(){
        print("==== Checking for user Login")
        if Auth.auth().currentUser?.uid == nil {
            //perform Log Out
            print("TODO - Need to impliment Logout")
        } else {
            let currentUserID = Auth.auth().currentUser?.uid
            
            print("==== Found user Login \(String(describing: currentUserID))")
            
            
            var ref : DatabaseReference!
            ref = Database.database().reference()
            
            ref.child("users").child(currentUserID!).observeSingleEvent(of: .value, with: {
                (snapshot) in
                
                
                let value = snapshot.value as? NSDictionary
                
                let email = value?["userEmail"] as? String ?? ""
                let fullName = value?["userFullname"] as? String ?? ""
                
<<<<<<< HEAD
                print("userFullName = \(email)")
                  print("userFullName = \(fullName)")
=======
                print("userEmail = \(email)")
                print("userFullName = \(fullName)")
>>>>>>> 733fd1e4817121b5da381bb6ff07607faaf9c339
                
                self.navigationItem.title = fullName
                
            }) { (error) in
                print(error.localizedDescription)
            }
<<<<<<< HEAD
                
       }
    
=======
            
        }
        
>>>>>>> 733fd1e4817121b5da381bb6ff07607faaf9c339
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

