//
//  ViewController.swift
//  IsteGelsinClone
//
//  Created by Anıl Sezer on 26.09.2023.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var notificationsButton: UIButton!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    
    var sliderCollectionImages = ["slider1", "slider2", "slider3", "slider4"]
    var bundleItems = [BundleModel]()
    var categoryItems = [CategoryModel]()
    
    @IBOutlet weak var bundleCollectionView: UICollectionView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let category1 = CategoryModel(image:  "Vegetables", label: "Meyve, Sebze")
        let category2 = CategoryModel(image:  "Beefs", label: "Et, Tavuk, Balık")
        let category3 = CategoryModel(image:  "Milks", label: "Süt Ürünleri")
        let category4 = CategoryModel(image:  "Breakfast", label: "Kahvaltılık")
        let category5 = CategoryModel(image:  "StapleFood", label: "Temel Gıda")
        let category6 = CategoryModel(image:  "Snacks", label: "Atıştırmalık")
        let category7 = CategoryModel(image:  "Beverages", label: "Su, İçecek")
        let category8 = CategoryModel(image:  "FrozenFood", label: "Donuk, Hazır Gıda")
        let category9 = CategoryModel(image:  "Bakery", label: "Fırın, Pastane")
        let category10 = CategoryModel(image: "Deserts", label: "Pasta ve Malzemeleri")
        let category11 = CategoryModel(image: "IceCream", label: "Tatlı, Dondurma")
        let category12 = CategoryModel(image: "Tea", label: "Çay, Kahve")
        let category13 = CategoryModel(image: "Cleaning", label: "Temizlik, Deterjan")
        let category14 = CategoryModel(image: "PersonalCare", label: "Kişisel Bakım")
        let category15 = CategoryModel(image: "Animals", label: "Evcil Dostlara")
        let category16 = CategoryModel(image: "Baby", label: "Bebek")
        let category17 = CategoryModel(image: "Home", label: "Ev Yaşam")
        let category18 = CategoryModel(image: "Vitamins", label: "Vitamin,Dermokozmetik")
        let category19 = CategoryModel(image: "DigitalProducts", label: "Teknoloji,Dijital Ürünler")
        categoryItems.append(category1)
        categoryItems.append(category2)
        categoryItems.append(category3)
        categoryItems.append(category4)
        categoryItems.append(category5)
        categoryItems.append(category6)
        categoryItems.append(category7)
        categoryItems.append(category8)
        categoryItems.append(category9)
        categoryItems.append(category10)
        categoryItems.append(category11)
        categoryItems.append(category12)
        categoryItems.append(category13)
        categoryItems.append(category14)
        categoryItems.append(category15)
        categoryItems.append(category16)
        categoryItems.append(category17)
        categoryItems.append(category18)
        categoryItems.append(category19)
        
        categoryCollectionView.layer.cornerRadius = 20
        
        let bundle1 = BundleModel(image: "Sale", label: "Kırmızı İndirimler")
        let bundle2 = BundleModel(image: "School", label: "Okul İhtiyaçları")
        let bundle3 = BundleModel(image: "NewProducts", label: "Yeni Ürünler")
        let bundle4 = BundleModel(image: "Organic", label: "Organik")
        let bundle5 = BundleModel(image: "HomeStaff", label: "Ev Ekonomisi")
        let bundle6 = BundleModel(image: "BestSeller", label: "Çok Satanlar")
        let bundle7 = BundleModel(image: "Heavy", label: "Ağırsa Taşıyalım")
        let bundle8 = BundleModel(image: "GlutenFree", label: "Glutensiz")
        let bundle9 = BundleModel(image: "Vegan", label: "Vegan")
        let bundle10 = BundleModel(image: "Last", label: "Bitiriyoruz")
        
        bundleItems.append(bundle1)
        bundleItems.append(bundle2)
        bundleItems.append(bundle3)
        bundleItems.append(bundle4)
        bundleItems.append(bundle5)
        bundleItems.append(bundle6)
        bundleItems.append(bundle7)
        bundleItems.append(bundle8)
        bundleItems.append(bundle9)
        bundleItems.append(bundle10)
        
        let bundleFlowLayout = UICollectionViewFlowLayout()
        bundleFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 20, right: 0)
        bundleFlowLayout.minimumInteritemSpacing = 10
        bundleFlowLayout.minimumLineSpacing = 10
        
        let bundleItemWidth = (bundleCollectionView.frame.width - 40) / 3.5
        bundleFlowLayout.itemSize = CGSize(width: bundleItemWidth, height: bundleItemWidth * 1)
        bundleFlowLayout.scrollDirection = .horizontal

        bundleCollectionView.collectionViewLayout = bundleFlowLayout
        
        let categoryFlowLayout = UICollectionViewFlowLayout()
        categoryFlowLayout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        categoryFlowLayout.minimumInteritemSpacing = 10
        categoryFlowLayout.minimumLineSpacing = 20
        
        let categoryItemWidth = (categoryCollectionView.frame.width - 50) / 4
        categoryFlowLayout.itemSize = CGSize(width: categoryItemWidth, height: categoryItemWidth * 1.4)
        categoryCollectionView.collectionViewLayout = categoryFlowLayout
    }
    
    @IBAction func searchButton(_ sender: Any) {
        
    }
    
    @IBAction func notificationsButton(_ sender: Any) {
        
    }
}

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == sliderCollectionView {
            return sliderCollectionImages.count
        } else if collectionView == bundleCollectionView {
            return bundleItems.count
        } else if collectionView == categoryCollectionView {
            return categoryItems.count
        }
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == sliderCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SliderCollectionViewCell", for: indexPath) as! SliderCollectionViewCell
            cell.sliderImage.image = UIImage(named: sliderCollectionImages[indexPath.row])
            return cell
        } else if collectionView == bundleCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BundleCollectionViewCell", for: indexPath) as! BundleCollectionViewCell
            let items = bundleItems[indexPath.row]
            cell.bundleImage.image = UIImage(named: items.image!)
            cell.bundleLabel.text = items.label!
            return cell
        } else if collectionView == collectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoryCollectionViewCell", for: indexPath) as! CategoryCollectionViewCell
            let items = categoryItems[indexPath.row]
            cell.categoryImage.image = UIImage(named: items.image!)
            cell.categoryLabel.text = items.label!
            return cell
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == sliderCollectionView {
            return CGSize(width: sliderCollectionView.frame.width, height: sliderCollectionView.frame.height)
        } else if collectionView == bundleCollectionView {
            return CGSize(width: bundleCollectionView.frame.width, height: 100)
        } else if collectionView == categoryCollectionView {
            return CGSize(width: categoryCollectionView.frame.width, height: 140)
        }
        return CGSize.zero
    }
}
