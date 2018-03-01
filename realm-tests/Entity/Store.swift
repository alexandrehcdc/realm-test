//
//  Store.swift
//  realm-tests
//
//  Created by Alexandre Henrique on 28/02/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import RealmSwift

class Store: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var address = ""
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    let salesMen = List<Salesman>()
    let productsAvailable = List<Product>()
}
