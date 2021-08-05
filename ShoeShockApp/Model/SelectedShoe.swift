//
//  SelectedProduct.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/31/21.
//

import Foundation


class SelectedShoe: Equatable {
    static func == (lhs: SelectedShoe, rhs: SelectedShoe) -> Bool {
        return lhs.shoe.name == rhs.shoe.name
    }
   
    var shoe: Shoe
    var quantity: Int
    
    init(shoe: Shoe, quantity: Int) {
        self.shoe = shoe
        self.quantity = quantity
    }

}
