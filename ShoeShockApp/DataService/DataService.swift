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
        Category(title: "Featured"),
        Category(title: "New"),
        Category(title: "Upcoming")
    ]
    
    struct NikeShoes {
        static let nikeShoes = [
            Shoe(images: ["Nike01-Tilt", "Nike01", "Nike02-Tilt", "Nike02", "blank"], brand: "Nike", name: "Air Force 1", price: 100.00, details: "The Air Force 1 High '07 is everything you know best: crisp overlays, bold accents and the perfect amount of flash to let you shine. The padded, high-cut collar with classic hook-and-loop closure adds heritage b-ball comfort while perforations on the toe keep you cool.", color: "White"),
            Shoe(images: ["Nike02-Tilt", "Nike02", "Nike01-Tilt", "Nike01", "blank"], brand: "Nike", name: "Air Max 97 OG", price: 160.00, details: "This late-1990s style defines the era of big design with a futuristic approach. With its reflective fluid lines and silvery tone inspired by Japan's bullet trains, and its early venture into full-length Max Air cushioning, this shoe continues to turn heads.", color: "Grey"),
            Shoe(images: ["Nike03-Tilt", "Nike03", "Nike04-Tilt", "Nike04", "blank"], brand: "Nike", name: "Air Max 2017 Pink/Blue", price: 160.00, details: "Nike Air Max 2017 is made from a thin knit-material, that offers great breathability and makes the shoe very light. With the Nike Air Max you get a classic sneaker with excellent shock absorption. The Nike Air Max is equipped with a visible Max Air unit in the heel for optimal cushioning and shock protection. A full-length foam midsole provides durability, stability and added padding for optimal comfort. Furthermore, you can see extra foam around the ankle thus ensuring even more comfort. Nike's revolutionary Air-Sole unit became a part of Nike footwear around the late 70's. In 1987 Nike Air Max with visible air in the heel had their debut. Now the user could not only feel the Air-Sole comfort, they could actually see it. And just a year later the next generation of Nike Air Max 90 became a hit with athletes, as well as, collectors, by offering striking colour combinations, minimal weight and strong cushioning.", color: "Pink"),
            Shoe(images: ["Nike04-Tilt", "Nike04", "Nike03-Tilt", "Nike03", "blank"], brand: "Nike", name: "Air Max 2017 Red", price: 160, details: "Nike Air Max 2017 is made from a thin knit-material, that offers great breathability and makes the shoe very light. With the Nike Air Max you get a classic sneaker with excellent shock absorption. The Nike Air Max is equipped with a visible Max Air unit in the heel for optimal cushioning and shock protection. A full-length foam midsole provides durability, stability and added padding for optimal comfort. Furthermore, you can see extra foam around the ankle thus ensuring even more comfort. Nike's revolutionary Air-Sole unit became a part of Nike footwear around the late 70's. In 1987 Nike Air Max with visible air in the heel had their debut. Now the user could not only feel the Air-Sole comfort, they could actually see it. And just a year later the next generation of Nike Air Max 90 became a hit with athletes, as well as, collectors, by offering striking colour combinations, minimal weight and strong cushioning.", color: "Red"),
            Shoe(images: ["Nike05-Tilt", "Nike05", "Nike06-Tilt", "Nike06", "blank"], brand: "Nike", name: "Tiempo Legend IV FG", price: 97.93, details: "The Tiempo Legend has been a player favorite since their introduction and Nike continues to develop these cleats into one of the greatest and most classic shoes in the game today. The Tiempo Legend IV is equipped with kangaroo leather for superior comfort and feel on the ball giving you the complete touch. Kangaroo leather is combined with Kanga-Lite synthetic leather providing comfort and support even on the hardest of surfaces.", color: "Orange"),
            Shoe(images: ["Nike06-Tilt", "Nike06", "Nike05-Tilt", "Nike05", "blank"], brand: "Nike", name: "Tiempo Legend V SG Pro", price: 250.00, details: "The next generation of the Tiempo, the Nike Tiempo Legend V delivers the superior craftsmanship for which the Tiempo line has always been known, but has been updated for the modern warrior. The Tiempo V offers excellent touch in all conditions and unrivaled comfort.", color: "Yellow"),
            Shoe(images: ["Nike07-Tilt", "Nike07", "Nike06-Tilt", "Nike06", "blank"], brand: "Nike", name: "HyperVenom Phinish FG", price: 199.99, details: "The Nike HyperVenom Phelon II (FG) Men’s Firm-Ground Football Boot is built for unrivaled agility on the pitch with an anatomical fit that locks down your foot. Its textured, leather-like upper improves ball touch for maximum control.", color: "Orange")
        ]
        static let newNikeShoes: [Shoe] = [nikeShoes[0], nikeShoes[4]]
        static let featuredNikeShoes: [Shoe] = [nikeShoes[1], nikeShoes[6]]
        static let upcomingNikeShoes: [Shoe] = [nikeShoes[2], nikeShoes[3]]
    }
    
    struct AdidasShoes {
        static let adidasShoes = [
            Shoe(images: ["Adidas01-Tilt", "Adidas01", "Adidas02-Tilt", "Adidas02", "blank"], brand: "Adidas", name: "X16.1 FG/AG", price: 125.00, details: "Featured in the Speed of Light Pack, the adidas X 16.1 FG/AG Football Boots feature a Techfit upper that is designed to enhance your speed on firm ground.", color: "Red"),
            Shoe(images: ["Adidas02-Tilt", "Adidas02", "Adidas03-Tilt", "Adidas03", "blank"], brand: "Adidas", name: "X 17.4 FxG", price: 99.99, details: "The adidas X 17.4 FxG football shoe has a synthetic upper material that makes the shoe robust and easy to clean. The flexible outsole with studs provides optimal ground contact and control on natural grass and artificial grass. The adidas logo rounds off the shoe visually.", color: "Gold"),
            Shoe(images: ["Adidas03-Tilt", "Adidas03", "Adidas04-Tilt", "Adidas04", "blank"], brand: "Adidas", name: "Ace 17.3 FG J Energy", price: 49.95, details: "The adidas ACE 17.3 FG Soccer Cleats are a perfect option for anyone, whether you are a pro or an amateur. From top to bottom these boots are everything you need. The energy aqua and legend ink coloring looks awesome together. The Primemesh material is one of the coolest features of these boots. This material will provide you with excellent ball control while also delivering zero wear-in time so these shoes are ready for action the moment you open the box. ", color: "Teal"),
            Shoe(images: ["Adidas04-Tilt", "Adidas04", "Adidas03-Tilt", "Adidas03", "blank"], brand: "Adidas", name: "Adizero F50 Messi TRX FG", price: 85.00, details: "Adidas F50 adizero Messi is a bold, speed cleat. This  F50 has been updated with Speedtraxion studs and Speedfoil heel. Speed scores goals and the adizero is one of the lightest, fastest boots to hit the field. The adizero is essential for players who want to quicken their footwork and accelerate with the ball.", color: "Rainbow")
        ]
        static let newAdidasShoes = [adidasShoes[0], adidasShoes[3]]
        static let featuredAdidasShoes = [adidasShoes[1]]
        static let upcomingAdidasShoes = [adidasShoes[2]]
    }
    
    struct JordanShoes {
        static let jordanShoes = [
            Shoe(images: ["Jordan01-Tilt", "Jordan01", "Jordan02-Tilt", "Jordan02", "blank"], brand: "Air Jordan", name: "Flight Plate 2013", price: 191.00, details: "The Flight Plate's main purpose is to maximize the responsiveness of Zoom Air cushioning. By compressing and deflecting on the units during action, the Flight Plate unlocks the power of Zoom Air. The pressure of the Flight Plate against the Zoom bags help to create a new level of responsiveness and cushion that you can actually feel compressing and decompressing on the court.", color: "Orange"),
            Shoe(images: ["Jordan02-Tilt", "Jordan02", "Jordan02-Tilt", "Jordan02", "blank"], brand: "Air Jordan", name: "Jumpman Hustle Black", price: 85.00, details: "The Jordan Jumpman Hustle takes the brand's flight aesthetic to the next level by taking cues from space uniforms. This 'Black' variation—launched in Winter 2018—reissues the knit bootie sheathed in a synthetic sleeve with a zip closure. Sleek Jumpman logos come into view on the heel and footbed. Herringbone tread is chiseled into the rubber outsole offering durability and traction while a forefoot Zoom Air unit provides lightweight cushioning.", color: "Gold"),
            Shoe(images: ["Jordan03-Tilt", "Jordan03", "Jordan02-Tilt", "Jordan02", "blank"], brand: "Air Jordan", name: "13 Retro 'Wheat'", price: 295, details: "Also known as the ‘Golden Harvest,’ this Air Jordan 13 Retro gets an all-over tan treatment. Suede overlays provide a textural contrast to the tonal leather upper, with suede also appearing on the tongue. The green hologram on the heel provides the only contrasting color on the upper, although the gum outsole also sports black.", color: "Yellow"),
            Shoe(images: ["Jordan04-Tilt", "Jordan04", "Jordan02-Tilt", "Jordan02", "blank"], brand: "Air Jordan", name: "11 Retro 'Bred' 2019", price: 318.00, details: "The Air Jordan 11 Retro 'Bred' 2019 brings back an original colorway initially debuted in 1995. The Tinker Hatfield-designed silhouette features Chicago Bulls colors, with black mesh on the upper sitting atop shiny black patent leather. A white midsole melds nicely with a translucent Varsity Red outsole, and is the same colorway that Michael Jordan wore during the 1996 NBA championship playoff run. This retro was distributed in December 2019 with OG detailing, including high-cut patent leather, signature Jumpman branding and MJ's number 23 stamped on the heel.", color: "Red"),
            Shoe(images: ["Jordan05-Tilt", "Jordan05", "Jordan02-Tilt", "Jordan02", "blank"], brand: "Air Jordan", name: "31 'BANNED'", price: 234.00, details: "Launching in 2016, the Air Jordan 31 'Banned' was the silhouette’s introductory colorway. Inspired by the namesake Air Jordan 1, the mid-top sports the brand’s classic ‘Bred’ color scheme, highlighted by an upper built with a blend of breathable FlyWeave and synthetic leather. In a first, the shoe also features mixed branding, incorporating a Swoosh, Jumpman and the original Jordan ‘Wings’ logo.", color: "Red"),
            Shoe(images: ["Jordan06-Tilt", "Jordan06", "Jordan02-Tilt", "Jordan02", "blank"], brand: "Air Jordan", name: "MORE UPTEMPO 'Olympic' 2020", price: 200, details: "Released in March 2020, the Air More Uptempo 'Olympic' 2020 brings back the shoe made famous by Scottie Pippen during the 1996 Olympics. Built with leather and nubuck, the upper sports a Midnight Navy base contrasted by white throughout, including on the bold Air lettering on the side wall. The heel sports Pippen's Olympic jersey number in metallic gold, while underfoot, full-length Max Air provides cushioning.", color: "Pink")
        ]
        static let newJordanShoes = [jordanShoes[0], jordanShoes[1]]
        static let featuredJordanShoes = [jordanShoes[2], jordanShoes[4]]
        static let upcomingJordanShoes = [jordanShoes[5], jordanShoes[3]]
    }
   
    let moreShoes = [
        Shoe(images: ["Nike04-Tilt", "Nike04", "Nike03-Tilt", "Nike03", "blank"], brand: "Nike", name: "Air Max 2017 Red", price: 160, details: "Nike Air Max 2017 is made from a thin knit-material, that offers great breathability and makes the shoe very light. With the Nike Air Max you get a classic sneaker with excellent shock absorption. The Nike Air Max is equipped with a visible Max Air unit in the heel for optimal cushioning and shock protection. A full-length foam midsole provides durability, stability and added padding for optimal comfort. Furthermore, you can see extra foam around the ankle thus ensuring even more comfort. Nike's revolutionary Air-Sole unit became a part of Nike footwear around the late 70's. In 1987 Nike Air Max with visible air in the heel had their debut. Now the user could not only feel the Air-Sole comfort, they could actually see it. And just a year later the next generation of Nike Air Max 90 became a hit with athletes, as well as, collectors, by offering striking colour combinations, minimal weight and strong cushioning.", color: "Red"),
        Shoe(images: ["Jordan02-Tilt", "Jordan02", "Jordan02-Tilt", "Jordan02", "blank"], brand: "Air Jordan", name: "Jumpman Hustle Black", price: 85.00, details: "The Jordan Jumpman Hustle takes the brand's flight aesthetic to the next level by taking cues from space uniforms. This 'Black' variation—launched in Winter 2018—reissues the knit bootie sheathed in a synthetic sleeve with a zip closure. Sleek Jumpman logos come into view on the heel and footbed. Herringbone tread is chiseled into the rubber outsole offering durability and traction while a forefoot Zoom Air unit provides lightweight cushioning.", color: "Gold"),
        Shoe(images: ["Nike06-Tilt", "Nike06", "Nike05-Tilt", "Nike05", "blank"], brand: "Nike", name: "Tiempo Legend V SG Pro", price: 250.00, details: "The next generation of the Tiempo, the Nike Tiempo Legend V delivers the superior craftsmanship for which the Tiempo line has always been known, but has been updated for the modern warrior. The Tiempo V offers excellent touch in all conditions and unrivaled comfort.", color: "Yellow")
    ]
    var favoritedShoes = [SelectedShoe]()
    
    func getAdidasShoes() -> [Shoe] {
        return AdidasShoes.adidasShoes
    }
    func getNewAdidasShoes() -> [Shoe] {
        return AdidasShoes.newAdidasShoes
    }
    func getFeaturedAdidasShoes() -> [Shoe] {
        return AdidasShoes.featuredAdidasShoes
    }
    func getUpcomingAdidasShoes() -> [Shoe] {
        return AdidasShoes.upcomingAdidasShoes
    }
    func getJordanShoes() -> [Shoe] {
        return JordanShoes.jordanShoes
    }
    func getNewJordanShoes() -> [Shoe] {
        return JordanShoes.newJordanShoes
    }
    func getFeaturedJordanShoes() -> [Shoe] {
        return JordanShoes.featuredJordanShoes
    }
    func getUpcomingJordanShoes() -> [Shoe] {
        return JordanShoes.upcomingJordanShoes
    }
    func getNikeShoes() -> [Shoe] {
        return NikeShoes.nikeShoes
    }
    func getNewNikeShoes() -> [Shoe] {
        return NikeShoes.newNikeShoes
    }
    func getFeaturedNikeShoes() -> [Shoe] {
        return NikeShoes.featuredNikeShoes
    }
    func getUpcomingNikeShoes() -> [Shoe] {
        return NikeShoes.upcomingNikeShoes
    }
    func getAllShoes() -> [Shoe] {
        let allShoes = NikeShoes.nikeShoes + AdidasShoes.adidasShoes + JordanShoes.jordanShoes
        return allShoes
    }
    func getMoreShoes() -> [Shoe] {
        return moreShoes
    }
    func getFavoriteShoe() -> [SelectedShoe] {
        return favoritedShoes
    }
    
    func getShoes(forCategoryTitle title: String, forBrand brand: String) -> [Shoe] {
        switch (brand, title) {
        case ("Nike", "New"):
            return getNewNikeShoes()
        case ("Nike", "Featured"):
            return getFeaturedNikeShoes()
        case ("Nike", "Upcoming"):
            return getUpcomingNikeShoes()
        case ("Adidas", "New"):
            return getNewAdidasShoes()
        case ("Adidas", "Featured"):
            return getFeaturedAdidasShoes()
        case ("Adidas", "Upcoming"):
            return getUpcomingAdidasShoes()
        case ("Jordan", "New"):
            return getNewJordanShoes()
        case ("Jordan", "Featured"):
            return getFeaturedJordanShoes()
        case ("Jordan", "Upcoming"):
            return getUpcomingJordanShoes()
        default:
            return getAllShoes()
        }
    }
    
    
    func addShoeToFavorite(selectedShoe: SelectedShoe) {
        favoritedShoes.append(selectedShoe)
    }
    func removeShoeFromFavorites(selectedShoe: SelectedShoe) {
        guard let index = favoritedShoes.firstIndex(of: selectedShoe) else { return }
        favoritedShoes.remove(at: index)
    }
    
    
    let USsize = ["6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12", "13", "14", "15", "16"]
    let UKSize = ["5.5", "6", "6.5", "7", "7.5", "8", "8.5", "9", "9.5", "10", "10.5", "11", "11.5", "12.5", "13.5","14.5", "15.5"]
    let EuroSize = ["39", "40", "41", "42", "43", "44", "45", "46", "47", "48", "49"]
    
    func getUSShoeSize() -> [String] {
        return USsize
    }
    func getUKShoeSize() -> [String] {
        return UKSize
    }
    func getEuroShoeSize() -> [String] {
        return EuroSize
    }
    
    func getShoeSizeScale(forScaleTitle title: String) -> [String] {
        switch title {
        case "US":
            return getUSShoeSize()
        case "UK":
            return getUKShoeSize()
        case "Euro":
            return getEuroShoeSize()
        default:
            return getUSShoeSize()
        }
    }
    
    
    
    
}
