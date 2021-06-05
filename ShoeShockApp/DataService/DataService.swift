//
//  DataService.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import Foundation

struct DataService {
    
    static var instance = DataService()
    
    var shoes: [Shoe] = [
        Shoe(image: "BBShoe01", name: "NIKE Air Max 1", price: 110.00, quantity: 1, details: "Soft", key: "1", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe02", name: "NIKE Jumpman", price: 100.00, quantity: 1, details: "Jump up your game", key: "2", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe03", name: "NIKE Air Jordan Retro", price: 1500.00, quantity: 1, details: "Classic", key: "3", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe04", name: "NIKE Ballers", price: 90.00, quantity: 1, details: "Wanna be a baller?", key: "4", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe05", name: "NIKE Runners", price: 150.00, quantity: 1, details: "Be light, be quick.", key: "5", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe06", name: "NIKE Cloud", price: 120.00, quantity: 1, details: "Float around, like Mike", key: "6", isFavorited: false, isInCart: false),
        Shoe(image: "BBShoe07", name: "NIKE MoonShoes", price: 1000.00, quantity: 1, details: "Bounce Bounce", key: "7", isFavorited: false, isInCart: false)
    ]
    

    
    func getShoes() -> [Shoe] {
        return shoes
    }
    
//    mutating func addShoe(product: Shoe) {
//        var selectedProduct = SelectedShoe(shoe: product, quantity: 1)
//        if DataService.cart.contains(selectedProduct) {
//            selectedProduct.quantity += 1
//        } else {
//            DataService.cart.append(selectedProduct)
//            selectedProduct.shoe.isFavorited = true
//        }
        
//        var selectedShoe = shoe
//        if DataService.cart.contains(selectedShoe) {
//            selectedShoe.quantity += 1
//        } else {
//            DataService.cart.append(shoe)
//            selectedShoe.isFavorited = true
//        }
//    }
    
//    mutating func removeShoe(product: Shoe) {
////        var selectedShoe = shoe
////        guard DataService.cart.contains(shoe) else { return }
////        guard let index = DataService.cart.firstIndex(of: shoe) else { return }
////        if DataService.cart[index].quantity > 1 {
////            selectedShoe.quantity -= 1
////        } else {
////            DataService.cart.remove(at: index)
////        }
//        var selectedProduct = SelectedShoe(shoe: product, quantity: 1)
//        guard DataService.cart.contains(selectedProduct) else { return }
//        guard let index = DataService.cart.firstIndex(of: selectedProduct) else { return }
//        if DataService.cart[index].quantity > 1 {
//            selectedProduct.quantity -= 1
//        } else {
//            DataService.cart.remove(at: index)
//            print(DataService.cart)
//        }
//    }
//
//    func getShoeQuantity(shoe: Shoe) -> Int {
//        guard DataService.cart.contains(shoe) else { return 0 }
//        guard let index = DataService.cart.firstIndex(of: shoe) else { return 0 }
//        return DataService.cart[index].quantity
//    }

}
