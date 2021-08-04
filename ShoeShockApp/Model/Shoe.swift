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
    

    private(set) public var images: [String]
    private(set) public var brand: String
    var name: String
    private(set) public var price: Double
    private(set) public var details: String
    private(set) public var color: String


    init(images: [String], brand: String, name: String, price: Double, details: String, color: String) {
        self.images = images
        self.brand = brand
        self.name = name
        self.price = price
        self.details = details
        self.color = color
    }
}
