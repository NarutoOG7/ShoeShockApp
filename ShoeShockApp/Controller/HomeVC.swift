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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shoeCollectionView.dataSource = self
        shoeCollectionView.delegate = self
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
            // cartVC.cartTableView.reloadData()
        }
    }
}


//MARK: - CollectionView DataSource and Delegate

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return DataService.instance.shoes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CellIdentifiers.shoeCell, for: indexPath) as! ShoeCell
        let shoe = DataService.instance.shoes[indexPath.row]
        cell.delegate = self
        cell.updateView(shoe: shoe)
        cell.index = indexPath
        cell.shoe = shoe
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoeCollectionView.deselectItem(at: indexPath, animated: false)
        selectedShoe = DataService.instance.shoes[indexPath.row]
        self.performSegue(withIdentifier: K.Segues.toDetailsVC, sender: indexPath)
    }
    
}


//MARK: - ShoeCellDelegate

extension HomeVC: ShoeCellDelegate {
//    func didTapHeart(button: UIButton, shoe: Shoe) {
//        //                if shoe.isInCart {
//        //                    DataService.instance.removeShoe(shoe: shoe)
//        //                } else {
//        //                    DataService.instance.addShoe(shoe: shoe)
//        //
//        //                }
//        //        if button.state == .selected {
//        //            DataService.instance.addShoe(shoe: shoe)
//        //
//        //        } else {
//        //            DataService.instance.removeShoe(shoe: shoe)
//        //
//        //        }
//
//
//
//        if shoe.isFavorited {
//            DataService.instance.addShoe(shoe: shoe)
//        } else if !shoe.isFavorited{
//            DataService.instance.removeShoe(shoe: shoe)
//            print(DataService.instance.cart)
//        }
//
//    }
    
    
    
    
    func addShoe(button: UIButton, shoe: Shoe) {
        DataService.instance.addShoe(shoe: shoe)
    }
    
    func removeShoe(button: UIButton, shoe: Shoe) {
        DataService.instance.removeShoe(shoe: shoe)
    }
    
    func didTapHeart(button: UIButton, shoe: Shoe) {
        var selectedShoe = shoe
//        selectedShoe.isFavorited.toggle()
        if DataService.cart.contains(shoe) {
//            selectedShoe.isFavorited = false
            DataService.instance.removeShoe(shoe: shoe)
        } else {
//            selectedShoe.isFavorited = true
            DataService.instance.addShoe(shoe: shoe)
        }
    }


    
}
