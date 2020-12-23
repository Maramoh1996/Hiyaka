//
//  ViewController.swift
//  Hiyaka
//
//  Created by Maram Alghanoom on 22/12/2020.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseUI
import Photos

class ViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
      downLoadImage()
    }


    func downLoadImage() {
       
        
        let storage = Storage.storage()
    
        let gsRefrence = storage.reference(forURL: "gs://hiyaka-d2543.appspot.com")
        let storageRef = storage.reference()
        
        let ref = storageRef.child("image7.png")
        
        ref.getData(maxSize: 1 * 1024 * 1024) { data, error in
            if let error = error?.localizedDescription {

                print(error)
            } else {
              // Data for "images/island.jpg" is returned
                _ = UIImage(data: data!)
            }
          }
        
        imageView.sd_setImage(with: ref)
    }
    
}

