//
//  Profile.swift
//  Instagram
//
//  Created by DAWEIXU on 2018/9/28.
//  Copyright © 2018 unimelb_daweixu. All rights reserved.
//

import UIKit
import Firebase

class Profile: UIViewController, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    @IBOutlet weak var imageCollection: UICollectionView!
    
    
    var images = [UIImage]()
    
    var imageLayout: ImageFlowLayout!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        loadImages()
        imageLayout = ImageFlowLayout()
        imageCollection.collectionViewLayout = imageLayout
        imageCollection.backgroundColor = .white
        showTitleName()
        
    }
    func showTitleName(){
        
        let currentUserID = Auth.auth().currentUser?.uid
        var ref : DatabaseReference!
        ref = Database.database().reference()
    ref.child("users").child(currentUserID!).observeSingleEvent(of: .value, with: {
        (snapshot) in

        let value = snapshot.value as? NSDictionary
        
        let fullName = value?["userFullname"] as? String ?? ""
        
        self.navigationItem.title = fullName
 
    }
    )}
    
    func loadImages()
    {
        images.append(UIImage(named: "sample1")!)
        images.append(UIImage(named: "sample2")!)
        images.append(UIImage(named: "sample3")!)
        self.imageCollection.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //cell
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = imageCollection.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! ImageCollectionViewCell
        let image = images[indexPath.row]
        
        cell.imageView.image = image
        
        return cell
    }
    
    //header
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath) as! HeaderCollectionReusableView
        
        header.profileImage.image = UIImage(named: "shiba")
       
    Database.database().reference().child("users").child((Auth.auth().currentUser?.uid)!).observeSingleEvent(of: .value, with: {(snapshot) in
        let userDict = snapshot.value as? [String:Any]
        header.FullName.text = userDict?["userFullname"] as? String
        })
 
        return header
        
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        referenceSizeForHeaderInSection section: Int) -> CGSize{
        return CGSize(width: 375, height: 210)
    }
    
    
   

}
