//
//  SignUp.swift
//  Instagram
//
//  Created by DAWEIXU on 2018/9/30.
//  Copyright © 2018 unimelb_daweixu. All rights reserved.
//

import UIKit
import Firebase

class SignUp: UIViewController{

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var Password1TextField: UITextField!
    @IBOutlet weak var Password2TextField: UITextField!
    @IBOutlet weak var registrationStatusLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         // Do any additional setup after loading the view.
        
        registrationStatusLabel.isEnabled = true
        registrationStatusLabel.isHidden = true
        
        setupProfileImageView()
    }
    
    func setupProfileImageView(){
        profileImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        profileImageView.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: -200).isActive = true
        
        profileImageView.heightAnchor.constraint(lessThanOrEqualToConstant: 150).isActive = true
        
        profileImageView.image = UIImage(named: "shiba")
        
//        profileImageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func SignInButton(_ sender: Any) {
        
        
        let  vc =  self.navigationController?.viewControllers.filter({$0 is SignIn}).first
        
        self.navigationController?.popToViewController(vc!, animated: true)
        
    }
 
    
    
    @IBAction func signUpButtonPress(_ sender: Any) {
        
        if(Password1TextField.text == Password2TextField.text){
            
            print("Calling Firebase Auth with fields \(emailTextField.text!) and \(Password1TextField.text!)")
            
            Auth.auth().createUser(withEmail: emailTextField.text!, password: Password1TextField.text!) { (user, error) in
                
                if (error != nil){
                    print(error!)
                    print(error.debugDescription)
                    print(error!.localizedDescription)
                    self.registrationStatusLabel.text = error?.localizedDescription
                    self.registrationStatusLabel.isHighlighted = true
                    self.registrationStatusLabel.isHidden = false
                } else {
                    
                    //TODO Go to next view controller
                    print("user registered")
                    
                    // Database reference
                    let dbRef: DatabaseReference!
                    dbRef = Database.database().reference()
                    
              //self.ref.child("users").child(user.uid).setValue(["username": username])
                    // Neeto FIX this issue
                    
                    dbRef.child("users").setValue(["email": self.emailTextField.text])
                    
                    dbRef.child("users").setValue(["fullname": self.nameField.text])
                    
                    
                    self.registrationStatusLabel.text = "Registration Succeeded, returning to Sign In page."
                    
                    self.registrationStatusLabel.isHighlighted = true
                    self.registrationStatusLabel.isHidden = false
                    
                    //Freeze for 3 seconds.
                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) { // change 2 to desired number of seconds
                        let  vc =  self.navigationController?.viewControllers.filter({$0 is SignIn}).first
                        self.navigationController?.popToViewController(vc!, animated: true)
                    }
                    //Back to SignIn when registered succeeded.
                    
                   
                    
                    print("gone to next view")
                    
                    
                }
            }
        } else{
            
            registrationStatusLabel.text = "Passwords Mismatch"
            registrationStatusLabel.isHighlighted = true
            registrationStatusLabel.isHidden = false
            
        }
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
