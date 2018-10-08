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

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var Password1TextField: UITextField!
    @IBOutlet weak var Password2TextField: UITextField!
    @IBOutlet weak var registrationStatusLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        registrationStatusLabel.isEnabled = true
        registrationStatusLabel.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   
    @IBAction func SignInButton(_ sender: Any) {
        //self.dismiss(animated: true, completion: nil)
        /*
        let vcIndex = self.navigationController?.viewControllers.indexOf({ (viewController) -> Bool in
            
            if let _ = viewController as? ComposeViewController {
                return true
            }
            return false
        })
        
        let composeVC = self.navigationController?.viewControllers[vcIndex!] as! ComposeViewController
        
        self.navigationController?.popToViewController(composeVC, animated: true)
         */
        
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
                    self.registrationStatusLabel.text = error.debugDescription
                    self.registrationStatusLabel.isHighlighted = true
                    self.registrationStatusLabel.isHidden = false
                } else {
                    
                    //TODO Go to next view controller
                    print("user registered")
                    
                    self.performSegue(withIdentifier: "goToFirstTabView", sender: self)
                    
                    print(" gone to next view")
                    
                    
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
