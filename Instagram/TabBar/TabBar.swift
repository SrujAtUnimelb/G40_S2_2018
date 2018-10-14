//
//  TabBar.swift
//  Instagram
//
//  Created by DAWEIXU on 2018/10/9.
//  Copyright © 2018 unimelb_daweixu. All rights reserved.
//

import UIKit

class TabBar: UITabBarController {
    
    var tabBarItem3 = UITabBarItem()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
       
        // For testing - directly going to third view
        
//        self.selectedIndex = 2
//
//        if(self.selectedIndex == 2){
//
//        tabBarItem3 = self.tabBar.items![2]
//            _ = Photo()
//
//        }
        navigationController?.isToolbarHidden = false
        navigationController?.hidesBarsOnTap = false
        navigationController?.isNavigationBarHidden = false
        setupNavigationBar()
        
    }

    /*
     // MARK: - Navigation Bar Setup
     Add navigation items at the top bar
     */
    func setupNavigationBar(){
        
        navigationItem.title = "See this works"
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
