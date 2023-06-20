//
//  Topping+CoreDataProperties.swift
//  PizzaApp
//
//  Created by Antek Woźniacki on 20/06/2023.
//
//

import Foundation
import CoreData


extension Topping {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Topping> {
        return NSFetchRequest<Topping>(entityName: "Topping")
    }

    @NSManaged public var name: String?
    @NSManaged public var toTopping: NSSet?

     public var toppingArray: [Topping] {
     let set = toTopping as? Set<Topping> ?? []

         return set.sorted{
             $0.name! > $1.name!
         }
     }
}

extension Topping : Identifiable {

}
