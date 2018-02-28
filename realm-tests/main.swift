//
//  main.swift
//  realm-tests
//
//  Created by Alexandre Henrique on 28/02/18.
//  Copyright © 2018 Alexandre Henrique. All rights reserved.
//

import Foundation
import RealmSwift

func main() {
    
    let realm = try! Realm()
    let entitiesOperations = EntityOperations.getInstance(realm: realm)
    var index = 0
    while index < 10 {
        entitiesOperations.mockAndSaveStore()
        index += 1
    }
    
    
    print("main being executed")
}

main()
