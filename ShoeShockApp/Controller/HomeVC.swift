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
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segues.toDetailsVC {
            let detailsVC = segue.destination as! DetailsVC
            detailsVC.shoe = selectedShoe
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
    func didTapHeart(button: UIButton, shoe: Shoe) {
        if shoe.isInCart {
            
        } else {
            DataService.instance.addShoe(shoe: shoe)
            
        }
    }
    
    
}
