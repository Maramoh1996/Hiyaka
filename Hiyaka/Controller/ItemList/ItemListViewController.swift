//
//  ItemListViewController.swift
//  Hiyaka
//
//  Created by Maram Alghanoom on 22/12/2020.
//

import UIKit
import Firebase
import FirebaseStorage
import FirebaseUI
import FirebaseFirestore
import FirebaseAuth


class ItemListViewController : UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    
    let storage = Storage.storage()
    let db = Firestore.firestore()
    let myUid = Auth.auth().currentUser?.uid
    
    var items: [Item] = []
    override func viewDidLoad() {
        getItemList()
    }
}


extension ItemListViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func getItemList() {
        
        let docRef = db.collection("Item")
        var image: UIImage!
        
        docRef.getDocuments { [self] (querySnapshot, error) in
            if let error = error?.localizedDescription {
                print("Item dose not exist \(error) ")
            } else {
//                print(querySnapshot!.documents[3]["itemImage"])
                for doc in querySnapshot!.documents {
                    
                    //                let itemID = (doc["itemId"] as! String)
                    let imageURL = (doc["itemImage"] as! String )
                    print(imageURL)
                    let description = (doc["itemDescription"] as! String)
                    //                let price = (doc["itemPrice"] as! String)
                    
                    let gsRefrence = storage.reference(forURL: imageURL)
                    
                    gsRefrence.getData(maxSize: 3 * 1024 * 1024 ) { data, error in
                        if let error = error?.localizedDescription {
                            print(error)
                            
                        } else {
                            image = UIImage(data: data!) ?? UIImage()
                        }
                            DispatchQueue.main.async {

                                let itemInfo = Item(/*id: itemID,*/ image: image , desc: description/*, price: price*/)
                                items.append(itemInfo)
                                collectionView.reloadData()
                        }
                    }
                }
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ItemCell
        
        let item = items[indexPath.item]
        //        cell.image.image = item.urlImage
        cell.desc.text = item.itemDescription
        //        cell.price.text = "\(item.itemPrice) SR."
        cell.image.image = item.itemImage
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width / 2
        return CGSize(width: width , height: 200)
    }
}
