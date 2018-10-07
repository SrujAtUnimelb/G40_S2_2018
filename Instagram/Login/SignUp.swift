//
//  SignUp.swift
//  Instagram
//
//  Created by DAWEIXU on 2018/9/30.
//  Copyright © 2018 unimelb_daweixu. All rights reserved.
//

import UIKit

class SignUp: UIViewController{

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
 
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
