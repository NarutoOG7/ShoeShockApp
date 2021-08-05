//
//  DetailsVC.swift
//  ShoeShockApp
//
//  Created by Spencer Belton on 5/24/21.
//

import UIKit

class DetailsVC: UIViewController {

    @IBOutlet weak var shoeBrandLabel: UILabel!
    @IBOutlet weak var shoeNameLabel: UILabel!
    @IBOutlet weak var shoeImage: UIImageView!
    @IBOutlet weak var shoeImageCollectionView: UICollectionView!
    @IBOutlet weak var shoePriceLabel: UILabel!
    @IBOutlet weak var shoeDetailsTextView: UITextView!
    @IBOutlet weak var sizePickerView: UIPickerView!
    @IBOutlet weak var addToFavorites: UIButton!
    @IBOutlet weak var addToBag: UIButton!
    
    var shoe: Shoe?
    var dataService = DataService.instance
    let cartService = CartService.instance
    var previousVC = ""
    var shoeSizeScale = ""
    var displayedShoeImage = 0
    
    let alertController = Bundle.main.loadNibNamed("addToBagAlert", owner: self, options: nil)?.last as! UIView
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sizePickerView.dataSource = self
        sizePickerView.delegate = self
        shoeImageCollectionView.dataSource = self
        shoeImageCollectionView.delegate = self
        updateView()
    }
    
    @IBAction func sizeScaleTouched(_ sender: UISegmentedControl) {
        shoeSizeScale = sender.titleForSegment(at: sender.selectedSegmentIndex) ?? "US"
        sizePickerView.reloadAllComponents()
    }
    
    func updateView() {
        guard let shoe = shoe else { return }
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        shoeBrandLabel.text = shoe.brand
        shoeNameLabel.text = shoe.name
        shoeImage.image = UIImage(named: shoe.images[displayedShoeImage])
        shoePriceLabel.text = String(format: "$%.2f", shoe.price)
        shoeDetailsTextView.text = shoe.details
        let favTitle = dataService.favoritedShoes.firstIndex(of: selectedShoe) != nil ? "FAVORITED" : "ADD TO FAVORITES"
        self.addToFavorites.setTitle(favTitle, for: .normal)
        addToFavorites.layer.cornerRadius = 5
        addToBag.layer.cornerRadius = 5
    }
    
    
    @IBAction func addToFavoritesPressed(_ sender: UIButton) {
        guard let shoe = shoe else { return }
        let selectedShoe = SelectedShoe(shoe: shoe, quantity: 1)
        if dataService.favoritedShoes.firstIndex(of: selectedShoe) != nil {
            dataService.removeShoeFromFavorites(selectedShoe: selectedShoe)
        } else {
            dataService.addShoeToFavorite(selectedShoe: selectedShoe)
        }
        updateView()
    }
    
    @IBAction func addToBagPressed(_ sender: UIButton) {
        guard let shoe = shoe else { return }
        cartService.addShoe(shoe: shoe)
        updateView()
        showAlert()
        dismissAlert()
    }
//MARK: - Add To Bag Alert
    
    func showAlert() {
        let windows = UIApplication.shared.windows
        let lastWindow = windows.first
        alertController.frame = UIScreen.main.bounds
        lastWindow?.addSubview(alertController)
    }
    func dismissAlert() {
        let time = DispatchTime.now() + 1.0
        DispatchQueue.main.asyncAfter(deadline: time) {
            self.alertController.removeFromSuperview()
        }
    }

}

//MARK: - ShoeImage CollectionView DataSource and Delegate

extension DetailsVC: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let shoe = shoe else { return 1 }
        print(shoe.images.count)
        return shoe.images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: K.CellIdentifiers.shoeImagesCell, for: indexPath) as! ShoeImageCollectionCell
        guard let shoe = shoe else { return cell }
        cell.updateUI(image: shoe.images[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        shoeImageCollectionView.deselectItem(at: indexPath, animated: false)
        displayedShoeImage = indexPath.row
        updateView()
    }
}

//MARK: - ShoeSize PickerView DataSource and Delegate

extension DetailsVC: UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
            }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return dataService.getShoeSizeScale(forScaleTitle: shoeSizeScale).count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let size = dataService.getShoeSizeScale(forScaleTitle: shoeSizeScale)
        return size[row]
    }
    
    
}
