//
//  ViewController.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var shoeCollectionView: UICollectionView!
    
    var selectedShoe: Shoe?
    var cart = Cart()
//    var shoes = DataService.instance.shoes
    var displayedType = 0
    var cartService = Cart.instance
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
    
    @IBAction func cartPressed(_ sender: UIBarButtonItem) {
        self.performSegue(withIdentifier: K.Segues.toCartVC, sender: self)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segues.toDetailsVC {
            let detailsVC = segue.destination as! DetailsVC
            detailsVC.shoe = selectedShoe
        } else if segue.identifier == K.Segues.toCartVC {
            let cartVC = segue.destination as! CartVC
            
        }
    }
    
}


//MARK: - CollectionView DataSource and Delegate

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.getShoes(forCategoryTitle: displayedCategory).count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Identifiers.shoeCell, for: indexPath) as! ShoeCell
        //let shoe = shoes[displayedType][indexPath.row]
        let shoe = dataService.getShoes(forCategoryTitle: displayedCategory)
        cell.delegate = self
        cell.index = indexPath
        cell.shoe = shoe[indexPath.row]
        cell.updateView(shoe: shoe[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoeCollectionView.deselectItem(at: indexPath, animated: false)
        let theShoes = dataService.getShoes(forCategoryTitle: displayedCategory)
        selectedShoe = theShoes[indexPath.row]
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
    
    func didTapHeart(button: UIButton, shoe: Shoe) {
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        if !Cart.instance.cart.contains(selectedShoe) {
            Cart.instance.addShoe(shoe: shoe)
        } else {
            Cart.instance.removeShoe(shoe: shoe)
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

