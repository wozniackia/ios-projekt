//
//  Order+CoreDataProperties.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 13/06/2023.
//
//

import Foundation
import CoreData


extension Order {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Order> {
        return NSFetchRequest<Order>(entityName: "Order")
    }

    @NSManaged public var orderDate: Date?
    @NSManaged public var deliveryDate: Date?
    @NSManaged public var id: UUID?
    @NSManaged public var toDog: NSSet?

     public var dogArray: [Order] {
     let set = toDog as? Set<Order> ?? []

         return set.sorted{
             $0.orderDate! < $1.orderDate!
             
         }
     }

}

extension Order : Identifiable {

}
