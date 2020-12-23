//
//  Items.swift
//  Hiyaka
//
//  Created by Maram Alghanoom on 22/12/2020.
//

import UIKit

class Item {
    
    var itemId: String
    var itemImage: UIImage?
    var itemDescription: String
    var itemPrice: String
    
    init(id: String, image: UIImage? , desc: String, price: String) {
        self.itemId = id
        self.itemImage = image
        self.itemDescription = desc
        self.itemPrice = price
    }
}
