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
    @IBOutlet weak var nikeButton: UIButton!
    @IBOutlet weak var adidasButton: UIButton!
    @IBOutlet weak var jordanButton: UIButton!
    @IBOutlet weak var pumaButton: UIButton!
    @IBOutlet weak var reebokButton: UIButton!
    
    var shoe: Shoe?
    var cart = CartService()
    var cartService = CartService.instance
    var dataService = DataService.instance
    var displayedType = ""
    var displayedBrand = ""
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainShoeCollectionView.dataSource = self
        mainShoeCollectionView.delegate = self
        moreShoesCollectionView.dataSource = self
        moreShoesCollectionView.delegate = self
        nikeButton.isSelected = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainShoeCollectionView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segues.toDetailsVC {
            let detailsVC = segue.destination as! DetailsVC
            detailsVC.shoe = shoe
            detailsVC.previousVC = "Home"
        }
    }
    
    func manageBrandButtons(senderButton: UIButton) {
        guard
            let nikeButton = nikeButton,
            let adidasButton = adidasButton,
            let jordanButton = jordanButton,
            let pumaButton = pumaButton,
            let reebokButton = reebokButton
        else { return }
        
        let brandButtons = [nikeButton, adidasButton, jordanButton, pumaButton, reebokButton]
        for button in brandButtons {
            if button == senderButton {
                button.isSelected = true
                button.titleLabel?.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            } else {
                button.isSelected = false
                button.titleLabel?.textColor = #colorLiteral(red: 0.6666666865, green: 0.6666666865, blue: 0.6666666865, alpha: 1)
            }
        }
    }
    
    @IBAction func brandTapped(_ sender: UIButton) {
        manageBrandButtons(senderButton: sender)
        displayedBrand = sender.titleLabel?.text ?? "Nike"
        mainShoeCollectionView.reloadData()
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
            return dataService.getShoes(forCategoryTitle: displayedType, forBrand: displayedBrand).count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainShoeCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CellIdentifiers.homeShoeCell, for: indexPath) as! HomeShoeCell
            let shoe = dataService.getShoes(forCategoryTitle: displayedType, forBrand: displayedBrand)[indexPath.row]
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
        if collectionView == mainShoeCollectionView {
            mainShoeCollectionView.deselectItem(at: indexPath, animated: false)
            let theShoes = dataService.getShoes(forCategoryTitle: displayedType, forBrand: displayedBrand)
            shoe = theShoes[indexPath.row]
        } else {
            moreShoesCollectionView.deselectItem(at: indexPath, animated: false)
            let theShoes = dataService.moreShoes
            shoe = theShoes[indexPath.row]
        }
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
        displayedType = title
        mainShoeCollectionView.reloadData()
    }
}
