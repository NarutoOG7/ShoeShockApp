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
    var shoes = DataService.instance.bballShoes
    
    private(set) public var products = [Shoe]()
    
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
    
    func initShoes(category: Category) {
        products = DataService.instance.getShoes(forCategoryTitle: category.title)
        navigationItem.title = category.title
    }

    //MARK: - Section Buttons
    
    @IBAction func soccerButtonPressed(_ sender: UIButton) {
        
    }
    @IBAction func bballButtonPressed(_ sender: UIButton) {
    }
    @IBAction func beachButtonPressed(_ sender: UIButton) {
    }
    
}



//MARK: - CollectionView DataSource and Delegate

extension HomeVC: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return DataService.instance.getCategories().count
    }
    
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
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeaderView {
            for i in DataService.instance.getCategories() {
                var label = UILabel(frame: CGRect(x: 0, y: 0, width: 40, height: 20))
                label.text = i.title
                sectionHeader.addSubview(label)
                return sectionHeader
            }
        }
        return UICollectionReusableView()
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


