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
    @NSManaged public var size: NSNumber?
    @NSManaged public var id: UUID?
    @NSManaged public var toOrder: NSSet?

     public var orderArray: [Order] {
     let set = toOrder as? Set<Order> ?? []

         return set.sorted{
             $0.orderDate! > $1.orderDate!
             
         }
     }

}

extension Order : Identifiable {

}
