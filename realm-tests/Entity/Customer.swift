//
//  Customer.swift
//  realm-tests
//
//  Created by Alexandre Henrique on 28/02/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import RealmSwift

class Customer: Object {
    @objc dynamic var id = ""
    @objc dynamic var storeId = ""
    @objc dynamic var name = ""
    @objc dynamic var surName = ""
    @objc dynamic var wallet = 0.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    let orders = List<Product>()
}
