////
////  DataService.swift
////  ShoeShockApp
////
////  Created by Spencer Belton on 5/24/21.
////

import Foundation

class DataService {
    
    static var instance = DataService()
    
    let categories: [Category] = [
        Category(title: "Soccer"),
        Category(title: "Basketball"),
        Category(title: "Comfort")
    ]
    
    let bballShoes = [
        Shoe(image: "BBShoe01", name: "NIKE Air Max 1", price: 110.00, details: "Soft"),
        Shoe(image: "BBShoe02", name: "NIKE Jumpman", price: 100.00, details: "Jump up your game"),
        Shoe(image: "BBShoe03", name: "NIKE Air Jordan Retro", price: 1500.00, details: "Classic"),
        Shoe(image: "BBShoe04", name: "NIKE Ballers", price: 90.00, details: "Wanna be a baller?"),
        Shoe(image: "BBShoe05", name: "NIKE Runners", price: 150.00, details: "Be light, be quick."),
        Shoe(image: "BBShoe06", name: "NIKE Cloud", price: 120.00, details: "Float around, like Mike"),
        Shoe(image: "BBShoe07", name: "NIKE MoonShoes", price: 1000.00, details: "Bounce Bounce")
    ]
    let soccerShoes = [
        Shoe(image: "SCShoe01", name: "ADIDAS Sasquatch", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe02", name: "ADIDAS Marintoff", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe03", name: "ADIDAS BostonSauce", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe04", name: "ADIDAS FatherMarsh", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe05", name: "ADIDAS BaboonAmoon", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe06", name: "ADIDAS Clarance", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe07", name: "ADIDAS Sock-Tock-Sick", price: 80.00, details: "Large")
    ]
    let comfortShoes = [
        Shoe(image: "SCShoe01", name: "NIKE Vigilanties", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe02", name: "ADIDAS Actual 2 HoneyBadger", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe03", name: "ADIDAS FoxBoxx", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe04", name: "Hokage's Slippers", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe05", name: "Itachi's Boots", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe06", name: "ADIDAS Melatonin", price: 80.00, details: "Large"),
        Shoe(image: "SCShoe07", name: "NIKE Heaven-Sent-Soles", price: 80.00, details: "Large")
    ]

    var favoritedShoes = [SelectedShoe]()
    
    
    
    func getBBallShoes() -> [Shoe] {
        return bballShoes
    }
    func getSoccerShoes() -> [Shoe] {
        return soccerShoes
    }
    func getComfortShoes() -> [Shoe] {
        return comfortShoes
    }
    func getFavoriteShoe(shoe: Shoe) -> SelectedShoe? {
        let selectedShoe = SelectedShoe(shoe: shoe)
        guard let index = favoritedShoes.firstIndex(of: selectedShoe) else { return nil }
        return favoritedShoes[index]
    }
    
    func getShoes(forCategoryTitle title: String) -> [Shoe] {
        switch title {
        case "Soccer":
            return getSoccerShoes()
        case "Basketball":
            return getBBallShoes()
        case "Comfort":
            return getComfortShoes()
        default:
            return getComfortShoes()
        }
    }
    
    func addShoeToFavorite(selectedShoe: SelectedShoe) {
        favoritedShoes.append(selectedShoe)
    }
    
 
}
