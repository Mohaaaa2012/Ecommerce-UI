//
//  TallCell.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 07/12/2020.
//

import UIKit

class TallTableCell: UITableViewCell {
    
    static let tallCellId = String(describing: TallTableCell.self)
    
    let mobiles = ["mobile2", "mobile3", "mobile4", "mobile5", "mobile6", "mobile7"]
    let price = ["Sold Out", "7200 EGP", "Sold Out", "15000 EGP", "12000 EGP"]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = UIColor(named: "headerColor")
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(named: "headerColor")
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(TallCollectionCell.self, forCellWithReuseIdentifier: TallCollectionCell.cellId)
        collectionView.setAnchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeading: 5, paddingTrailing: 5, paddingBottm: 20)
    }
}

extension TallTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TallCollectionCell.cellId, for: indexPath) as! TallCollectionCell
        switch indexPath.section {
        case 4: // Mobile
            cell.imageView.image = UIImage(named: mobiles.randomElement() ?? "")
            cell.priceLabel.text = price.randomElement()
            cell.describtionLabel.text = "Mobile 374456 with 5 inch Screen"
        case 5: // Recently viewd
            cell.imageView.image = UIImage(named: mobiles.randomElement() ?? "")
            cell.priceLabel.text = price.randomElement()
            cell.describtionLabel.text = "Mobile 374456 with 5 inch Screen"
        default: // Tablets
            cell.imageView.image = UIImage(named: mobiles.randomElement() ?? "")
            cell.priceLabel.text = price.randomElement()
            cell.describtionLabel.text = "Mobile 374456 with 5 inch Screen"
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.size.width - 5) / 2.3
        let height = collectionView.bounds.height
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}
