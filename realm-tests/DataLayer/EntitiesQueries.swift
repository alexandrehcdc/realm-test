//
//  EntitiesQueries.swift
//  realm-tests
//
//  Created by Alexandre Henrique on 01/03/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import Fakery
import RealmSwift

public class EntitiesQueries {
    private static var INSTANCE: EntitiesQueries?
    
    private let realm: Realm
    
    private init(realm: Realm) {
        self.realm = realm
    }
    
    public static func getInstance(realm: Realm) -> EntitiesQueries {
        if (INSTANCE == nil) {
            INSTANCE = EntitiesQueries(realm: realm)
        }
        
        return INSTANCE!
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func findAllProductsBy(storeId: String) -> Results<Product> {
        //NSPredicate(format: "planningGuid = %@", planningGuid) "SUBQUERY(salesMen, $saleMan.productsAvailable, $saleMan.productsAvailable != nil).@count"
        let predicateStore = NSPredicate(format: "id != nil")
        let predicateSaleMan = NSPredicate(format: "storeId != nil")
        let predicateProducts = NSPredicate(format: "isAvailable == true")
        
        return realm.objects(Product.self)
            .filter(predicateStore)
            .filter(predicateSaleMan)
            .filter(predicateProducts)
    }
}
