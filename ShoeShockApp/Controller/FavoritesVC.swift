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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        favoriteShoesCV.dataSource = self
    }

    override func viewWillAppear(_ animated: Bool) {
        favoriteShoesCV.reloadData()
    }
}

//MARK: - CollectionView DataSource

extension FavoritesVC: UICollectionViewDataSource {
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
}

//MARK: - FavoriteShoeCell Delegate

extension FavoritesVC: FavoriteShoeCellDelegate {
    func updateCollectionView() {
        favoriteShoesCV.reloadData()
    }
    
    
}
