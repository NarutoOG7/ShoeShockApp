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
    var quantity: Int = 1
    var isFavorited: Bool = false
    var isInCart: Bool = false
    
    init(shoe: Shoe) {
        self.shoe = shoe
    }

}
