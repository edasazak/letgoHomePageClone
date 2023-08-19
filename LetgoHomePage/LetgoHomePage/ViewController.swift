//
//  ViewController.swift
//  LetgoHomePage
//
//  Created by Mac on 7.08.2023.
//

import UIKit

class ViewController: UIViewController {
    

   
    @IBOutlet weak var categoryCollectionView: UICollectionView!

    @IBOutlet weak var ilanCollectionView: UICollectionView!
    var categories = [Kategoriler]()
    var ilanlar = [Ilanlar]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryCollectionView.dataSource = self
        ilanCollectionView.dataSource = self

        self.view.addSubview(categoryCollectionView)
        self.view.addSubview(ilanCollectionView)
        
        categoryCollectionView.register(UINib(nibName: "KategoriCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Category")
        
        ilanCollectionView.register(UINib(nibName: "IlanlarCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "Ilanlar")

        let k1 = Kategoriler(image: "otoplusicon", name: "OTOPLUS")
        let k2 = Kategoriler(image: "arabaicon", name: "ARABA")
        let k3 = Kategoriler(image: "telefonicon", name: "TELEFON")
        let k4 = Kategoriler(image: "evesyalari", name: "EV EŞYALARI")
        let k5 = Kategoriler(image: "elektronik", name: "ELEKTRONİK")
        let k6 = Kategoriler(image: "motosiklet", name: "MOTOSİKLET")
        categories.append(k1)
        categories.append(k2)
        categories.append(k3)
        categories.append(k4)
        categories.append(k5)
        categories.append(k6)
        
        let i1 = Ilanlar(image: "mini", fiyat: "TL 1.125.000", name: "MINI 3-door/5-door Hatch (2015)", km: "2015 - 48,080 km")
        let i2 = Ilanlar(image: "ford", fiyat: "TL 1.180.000", name: "Ford Focus (2020)", km: "2020 - 86,819 km")
        ilanlar.append(i1)
        ilanlar.append(i2)
        
            let design = UICollectionViewFlowLayout()
            design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            design.minimumInteritemSpacing = 10
            design.minimumLineSpacing = 10
            
            //10 x 10 x 10 = 30 boşluk
            let ekranGenislik = UIScreen.main.bounds.width
            let itemGenislik = (ekranGenislik - 30) / 4
            
            design.itemSize = CGSize(width: itemGenislik, height: itemGenislik*1.2)
            design.scrollDirection = .horizontal
            categoryCollectionView.collectionViewLayout = design
            
            let design2 = UICollectionViewFlowLayout()
            design2.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
            design2.minimumInteritemSpacing = 10
            design2.minimumLineSpacing = 10
            
            //10 x 10 x 10 = 30 boşluk
            let ekranGenislik2 = UIScreen.main.bounds.width
            let itemGenislik2 = (ekranGenislik2 - 30) / 2
            
            design2.itemSize = CGSize(width: itemGenislik2, height: itemGenislik2*1.5)
            design2.scrollDirection = .vertical
            ilanCollectionView.collectionViewLayout = design2
        
        
        
    }


}
extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.categoryCollectionView {
            return categories.count
        } else {
            return ilanlar.count
        }
        

    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == self.categoryCollectionView {
            let cell = categoryCollectionView.dequeueReusableCell(withReuseIdentifier: "Category", for: indexPath) as! KategoriCollectionViewCell
            let category = categories[indexPath.row]
            cell.categoryImageView.image = UIImage(named: category.image!)
            cell.categoryLabel.text = category.name
            let scrollview = UIScrollView(frame: cell.bounds)
            scrollview.isPagingEnabled = true

            return cell
        } else {
            let cell = ilanCollectionView.dequeueReusableCell(withReuseIdentifier: "Ilanlar", for: indexPath) as! IlanlarCollectionViewCell
            let ilan = ilanlar[indexPath.row]
            cell.ilanImageView.image = UIImage(named: ilan.image!)
            cell.fiyatLabel.text = ilan.fiyat
            cell.modelLabel.text = ilan.name
            cell.kmLabel.text = ilan.km
            cell.layer.borderColor = UIColor.gray.cgColor
            cell.layer.borderWidth = 0.2
            cell.layer.cornerRadius = 5.0
            let scrollview = UIScrollView(frame: cell.bounds)
            scrollview.isPagingEnabled = true
            
            return cell
        }
        
    }
}
