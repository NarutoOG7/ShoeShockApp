//
//  ViewController.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var shoeCollectionView: UICollectionView!
    
    var shoe: Shoe?
    var cart = CartService()
    //    var shoes = DataService.instance.shoes
    var cartService = CartService.instance
    var dataService = DataService.instance
    var displayedCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoeCollectionView.dataSource = self
        shoeCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        shoeCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segues.toDetailsVC {
            let detailsVC = segue.destination as! DetailsVC
            detailsVC.shoe = shoe
        } else if segue.identifier == K.Segues.toCartVC {
            let cartVC = segue.destination as! CartVC
            print(dataService.favoritedShoes)
        }
    }
    

}


//MARK: - CollectionView DataSource and Delegate

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.getShoes(forCategoryTitle: displayedCategory).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Identifiers.homeShoeCell, for: indexPath) as! HomeShoeCell
        let shoe = dataService.getShoes(forCategoryTitle: displayedCategory)[indexPath.row]
        cell.delegate = self
        cell.index = indexPath
        cell.shoe = shoe
        cell.updateView(shoe: shoe)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoeCollectionView.deselectItem(at: indexPath, animated: false)
        let theShoes = dataService.getShoes(forCategoryTitle: displayedCategory)
        shoe = theShoes[indexPath.row]
        self.performSegue(withIdentifier: K.Segues.toDetailsVC, sender: indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
        }
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.Identifiers.sectionHeaderView, for: indexPath)
        if let sectionHeaderView = supplementaryView as? SectionHeaderView {
            sectionHeaderView.delegate = self
            sectionHeaderView.updateUI()
        }
        return supplementaryView
        
    }
}


//MARK: - Shoe Cell Delegate

extension HomeVC: ShoeCellDelegate {
    
    func didTapHeart(button: UIButton, selectedShoe: SelectedShoe) {
        if HomeShoeCell().heartButton == button {
            if dataService.favoritedShoes.firstIndex(of: selectedShoe) != nil {
                dataService.removeShoeFromFavorites(selectedShoe: selectedShoe)
            } else {
                dataService.addShoeToFavorite(selectedShoe: selectedShoe)
            }
        } else {
            if cartService.cart.firstIndex(of: selectedShoe) != nil {
                cartService.removeShoe(shoe: selectedShoe.shoe)
                
            } else {
                cartService.addShoe(shoe: selectedShoe.shoe)
            }
        }
        
    }
}


//MARK: - Section Header Delegate

extension HomeVC: SectionHeaderViewDelegate {
    func reloadCVDataWithSportIndex(_ title: String) {
        displayedCategory = title
        shoeCollectionView.reloadData()
    }
}

