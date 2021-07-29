//
//  ViewController.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var mainShoeCollectionView: UICollectionView!
    @IBOutlet weak var moreShoesCollectionView: UICollectionView!
    
    var shoe: Shoe?
    var cart = CartService()
    var cartService = CartService.instance
    var dataService = DataService.instance
    var displayedCategory = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainShoeCollectionView.dataSource = self
        mainShoeCollectionView.delegate = self
        moreShoesCollectionView.dataSource = self
        moreShoesCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainShoeCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segues.toDetailsVC {
            let detailsVC = segue.destination as! DetailsVC
            detailsVC.shoe = shoe
            detailsVC.previousVC = "Home"
        } else if segue.identifier == K.Segues.toCartVC {
            let cartVC = segue.destination as! CartVC
        }
    }
    
    @IBAction func unwindFromDetailsVC(_ segue: UIStoryboardSegue) {
        
    }
  
}


//MARK: - MainShoes CollectionView DataSource and Delegate

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == moreShoesCollectionView {
            return 2
        } else {
            return dataService.getShoes(forCategoryTitle: displayedCategory).count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainShoeCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CellIdentifiers.homeShoeCell, for: indexPath) as! HomeShoeCell
            let shoe = dataService.getShoes(forCategoryTitle: displayedCategory)[indexPath.row]
            cell.shoe = shoe
            cell.collectionView = "main"
            cell.updateView(shoe: shoe)
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CellIdentifiers.moreShoesCell, for: indexPath) as! HomeShoeCell
            let shoe = dataService.getMoreShoes()[indexPath.row]
            cell.shoe = shoe
            cell.collectionView = "more"
            cell.updateView(shoe: shoe)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        mainShoeCollectionView.deselectItem(at: indexPath, animated: false)
        let theShoes = dataService.getShoes(forCategoryTitle: displayedCategory)
        shoe = theShoes[indexPath.row]
        self.performSegue(withIdentifier: K.Segues.toDetailsVC, sender: indexPath)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            layout.sectionHeadersPinToVisibleBounds = true
        }
        let supplementaryView = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: K.CellIdentifiers.sectionHeaderView, for: indexPath)
        if let sectionHeaderView = supplementaryView as? SectionHeaderView {
            sectionHeaderView.delegate = self
            sectionHeaderView.updateUI()
        }
        return supplementaryView
    }
}

//MARK: - Section Header Delegate

extension HomeVC: SectionHeaderViewDelegate {
    func reloadCVDataWithSportIndex(_ title: String) {
        displayedCategory = title
        mainShoeCollectionView.reloadData()
    }
}
