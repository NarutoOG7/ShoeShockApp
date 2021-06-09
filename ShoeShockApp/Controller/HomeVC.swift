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
    var shoes = DataService.instance.shoes
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoeCollectionView.dataSource = self
        shoeCollectionView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        shoeCollectionView.reloadData()
        print(shoes[0].isFavorited)
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
        return shoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CellIdentifiers.shoeCell, for: indexPath) as! ShoeCell
        let shoe = shoes[indexPath.row]
        cell.delegate = self
        cell.index = indexPath
        cell.shoe = shoe
        cell.updateView(shoe: shoe)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoeCollectionView.deselectItem(at: indexPath, animated: false)
        selectedShoe = shoes[indexPath.row]
        self.performSegue(withIdentifier: K.Segues.toDetailsVC, sender: indexPath)
    }
    
}


//MARK: - ShoeCellDelegate

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


