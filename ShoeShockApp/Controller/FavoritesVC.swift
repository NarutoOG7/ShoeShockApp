//
//  FavoritesVC.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 7/8/21.
//

import UIKit

class FavoritesVC: UIViewController {

    @IBOutlet weak var favoriteShoesCV: UICollectionView!
    
    var dataService = DataService.instance
    var shoe: Shoe?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteShoesCV.dataSource = self
        favoriteShoesCV.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        favoriteShoesCV.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.Segues.toDetailsVC {
            let detailsVC = segue.destination as! DetailsVC
            detailsVC.shoe = shoe
        }
    }
}

//MARK: - CollectionView DataSource

extension FavoritesVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataService.getFavoriteShoe().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.Identifiers.favoriteShoeCell, for: indexPath) as! FavoriteShoeCell
        let selectedShoe = dataService.getFavoriteShoe()[indexPath.row]
        cell.shoe = selectedShoe.shoe
        cell.delegate = self
        cell.updateView(shoe: selectedShoe.shoe)
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        favoriteShoesCV.deselectItem(at: indexPath, animated: false)
        let theShoes = dataService.favoritedShoes
        shoe = theShoes[indexPath.item].shoe
        self.performSegue(withIdentifier: K.Segues.toDetailsVC, sender: indexPath)
    }
}

//MARK: - FavoriteShoeCell Delegate

extension FavoritesVC: FavoriteShoeCellDelegate {
    func updateCollectionView() {
        favoriteShoesCV.reloadData()
    }
    
    
}
