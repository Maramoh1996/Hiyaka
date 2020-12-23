//
//  Orders.swift
//  Hiyaka
//
//  Created by Maram Alghanoom on 22/12/2020.
//

import UIKit

class Order {
    
    var orderId : String
    var orderStatus: Bool
    var orderTotal: Int
    var orderDate: Date
    
    init(id: String, status: Bool, total: Int) {
        self.orderId = id
        self.orderStatus = status
        self.orderTotal = total
        self.orderDate = Date()
    }
}
