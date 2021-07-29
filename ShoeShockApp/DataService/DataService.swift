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
        Shoe(image: "BBShoe01-Tilt", brand: "NIKE", name: "Air Max 1", price: 110.00, details: "Soft", color: "White"),
        Shoe(image: "BBShoe02-Tilt", brand: "NIKE", name: "Air Jordan Jumpman", price: 100.00, details: "Jump up your game", color: "Red"),
        Shoe(image: "BBShoe03-Tilt", brand: "NIKE", name: "Air Jordan Retro", price: 1500.00, details: "Classic", color: "Red"),
        Shoe(image: "BBShoe04-Tilt", brand: "NIKE", name: "Runners", price: 150.00, details: "Be light, be quick.", color: "White"),
        Shoe(image: "BBShoe05-Tilt", brand: "NIKE", name: "Big Ballers", price: 90.00, details: "Wanna be a baller?", color: "Grey"),
        Shoe(image: "BBShoe06-Tilt", brand: "NIKE", name: "Cloud Runners", price: 120.00, details: "Float around, like Mike", color: "Pink"),
        Shoe(image: "BBShoe07-Tilt", brand: "NIKE", name: "MoonShoes", price: 1000.00, details: "Bounce Bounce", color: "Red")
    ]
    let soccerShoes = [
        Shoe(image: "SCShoe01-Tilt", brand: "ADIDAS", name: "Sasquatch", price: 80.00, details: "Large", color: "Red"),
        Shoe(image: "SCShoe02-Tilt", brand: "ADIDAS", name: "Marintoff", price: 80.00, details: "Large", color: "Gold"),
        Shoe(image: "SCShoe03-Tilt", brand: "ADIDAS", name: "BostonSauce", price: 80.00, details: "Large", color: "Teal"),
        Shoe(image: "SCShoe04-Tilt", brand: "NIKE", name: "FatherMarsh", price: 80.00, details: "Large", color: "Orange"),
        Shoe(image: "SCShoe05-Tilt", brand: "NIKE", name: "BaboonAmoon", price: 80.00, details: "Large", color: "Yellow"),
        Shoe(image: "SCShoe06-Tilt", brand: "NIKE", name: "Clarance", price: 80.00, details: "Large", color: "Orange"),
        Shoe(image: "SCShoe07-Tilt", brand: "ADIDAS", name: "Sock-Tock-Sick", price: 80.00, details: "Large", color: "Rainbow")
    ]
    let comfortShoes = [
        Shoe(image: "SCShoe01-Tilt", brand: "ADIDAS", name: "Vigilanties", price: 80.00, details: "Large", color: "Red"),
        Shoe(image: "SCShoe02-Tilt", brand: "ADIDAS", name: "Actual 2 HoneyBadger", price: 80.00, details: "Large", color: "Gold"),
        Shoe(image: "SCShoe03-Tilt", brand: "ADIDAS", name: "FoxBoxx", price: 80.00, details: "Large", color: "Teal"),
        Shoe(image: "SCShoe04-Tilt", brand: "NIKE", name: "Hokage's Slippers", price: 80.00, details: "Large", color: "Orange"),
        Shoe(image: "SCShoe05-Tilt", brand: "NIKE", name: "Itachi's Boots", price: 80.00, details: "Large", color: "Yellow"),
        Shoe(image: "SCShoe06-Tilt", brand: "NIKE", name: "Melatonin", price: 80.00, details: "Large", color: "Orange"),
        Shoe(image: "SCShoe07-Tilt", brand: "ADIDAS", name: "Heaven-Sent Soles", price: 80.00, details: "Large", color: "Rainbow")
    ]
    let moreShoes = [
        Shoe(image: "SCShoe01", brand: "ADIDAS", name: "Vigilanties", price: 80.00, details: "Large", color: "Red"),
        Shoe(image: "SCShoe02", brand: "ADIDAS", name: "Actual 2 HoneyBadger", price: 80.00, details: "Large", color: "GOld"),
        Shoe(image: "SCShoe03", brand: "ADIDAS", name: "FoxBoxx", price: 80.00, details: "Large", color: "Teal"),
        Shoe(image: "SCShoe04", brand: "NIKE", name: "Hokage's Slippers", price: 80.00, details: "Large", color: "Orange"),
        Shoe(image: "SCShoe05", brand: "NIKE", name: "Itachi's Boots", price: 80.00, details: "Large", color: "Yellow"),
        Shoe(image: "SCShoe06", brand: "NIKE", name: "Melatonin", price: 80.00, details: "Large", color: "Orange"),
        Shoe(image: "SCShoe07", brand: "ADIDAS", name: "Heaven-Sent Soles", price: 80.00, details: "Large", color: "Rainbow")
    ]
    
    var favoritedShoes = [SelectedShoe]()
    
    
    func addShoeToFavorite(selectedShoe: SelectedShoe) {
        favoritedShoes.append(selectedShoe)
    }
    func removeShoeFromFavorites(selectedShoe: SelectedShoe) {
        guard let index = favoritedShoes.firstIndex(of: selectedShoe) else { return }
        favoritedShoes.remove(at: index)
    }
    
    
    func getBBallShoes() -> [Shoe] {
        return bballShoes
    }
    func getSoccerShoes() -> [Shoe] {
        return soccerShoes
    }
    func getComfortShoes() -> [Shoe] {
        return comfortShoes
    }
    func getMoreShoes() -> [Shoe] {
        return moreShoes
    }
    func getFavoriteShoe() -> [SelectedShoe] {
        return favoritedShoes
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
    
    
    
}
