//
//  EntitiesOperations.swift
//  realm-tests
//
//  Created by Alexandre Henrique on 28/02/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//
import RealmSwift
import Fakery
import Foundation

public class EntityOperations {
    
    private static var INSTANCE: EntityOperations?
    private let faker = Faker()

    private let realm: Realm

    private init(realm: Realm) {
        self.realm = realm
    }

    public static func getInstance(realm: Realm) -> EntityOperations {
        if (INSTANCE == nil) {
            INSTANCE = EntityOperations(realm: realm)
        }

        return INSTANCE!
    }

    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func mockCustomer() -> Customer {
        let customer = Customer()
        customer.id = NSUUID().uuidString
        customer.name = faker.name.firstName()
        customer.surName = faker.name.lastName()
        customer.wallet = faker.commerce.price()
        
        return customer
    }
    
    func save(customer: Customer) {
        try! realm.write {
            realm.add(customer)
        }
    }
    
    func mockProduct(storeId: String?) -> Product {
        let product = Product()
        
        product.id = NSUUID().uuidString
        product.storeId = (storeId != nil) ? storeId! : ""
        product.name = faker.app.name()
        product.isAvailable = faker.number.randomBool()
        
        return product
    }
    
    func mockSaleman(storeId: String?) -> Salesman {
        let saleMan = Salesman()
        var index = 0
        saleMan.id = NSUUID().uuidString
        saleMan.storeId = (storeId != nil) ? storeId! : ""
        saleMan.name = faker.name.firstName()
        saleMan.surName = faker.name.lastName()
//

        saleMan.sales.append(mockProduct(storeId: storeId!))
        saleMan.sales.append(mockProduct(storeId: storeId!))
        saleMan.sales.append(mockProduct(storeId: storeId!))
        saleMan.sales.append(mockProduct(storeId: storeId!))
        saleMan.sales.append(mockProduct(storeId: storeId!))
        saleMan.sales.append(mockProduct(storeId: storeId!))
        saleMan.sales.append(mockProduct(storeId: storeId!))
        saleMan.sales.append(mockProduct(storeId: storeId!))
        
        
        
        return saleMan
    }

    public func mockAndSaveStore() {
        let store = Store()
        var index = 0
        
        
        while index < 10 {
            store.productsAvailable.append(mockProduct(storeId: store.id))
            store.salesMen.append(mockSaleman(storeId: store.id))
            index += 1
        }
        
        store.id = NSUUID().uuidString
        store.name = faker.company.name()
        store.address = "\(faker.address.city()), \(faker.address.streetAddress(includeSecondary: true)), \(faker.address.secondaryAddress())"
        
        try! realm.write {
            realm.add(store)
        }
    }
}

