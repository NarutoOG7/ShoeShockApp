//
//  Shoe.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import Foundation


class  Shoe: Equatable {
    static func == (lhs: Shoe, rhs: Shoe) -> Bool {
        return lhs.name == rhs.name
    }
    

    private(set) public var image: String
    var name: String
    private(set) public var price: Double
    private(set) public var details: String


    init(image: String, name: String, price: Double, details: String) {
        self.image = image
        self.name = name
        self.price = price
        self.details = details
    }
}
