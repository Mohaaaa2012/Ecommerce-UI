//
//  CategoryTableCell.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 12/12/2020.
//

import UIKit

class CategoryTableCell: UITableViewCell {
    
    static let cellId = String(describing: CategoryTableCell.self)
    
    var cellHeight: CGFloat = 0
    var cellWidth: CGFloat = 0
    var cellsNumber: Int = 0
    let images = ["perfumes", "makeup", "electronics", "personalcare", "mobiles", "tvs", "sports"]
    let labels = ["PERFUMES", "MAKEUP", "ELECTRONICS", "PERSONAL CARE", "MOBILES", "TVs", "SPORTS"]
    
    var categorySectionDelegate: pushControllers?
    
    let categoryCollectionView = UICollectionView(
        frame: .zero,
        collectionViewLayout: CategoryTableCell.createLayout())
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    static func createLayout() -> UICollectionViewCompositionalLayout {
       
       //Single Left Items
       let firstItemSize = NSCollectionLayoutSize(
           widthDimension: .fractionalWidth(0.37),
           heightDimension: .fractionalHeight(1))
       let firstItem = NSCollectionLayoutItem(layoutSize: firstItemSize)
       firstItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)
       
       // Grid Item
       let SecondItemSize = NSCollectionLayoutSize(
           widthDimension: .fractionalWidth(0.33),
           heightDimension: .fractionalHeight(1))
       let secondItem = NSCollectionLayoutItem(layoutSize: SecondItemSize)
       secondItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 5)

       // Single Line Group
       let compoundGroupSize = NSCollectionLayoutSize(
           widthDimension: .fractionalWidth(1),
           heightDimension: .fractionalHeight(0.5))
       let compoundhalfGroup = NSCollectionLayoutGroup.horizontal(layoutSize: compoundGroupSize, subitem: secondItem, count: 3)
       
       // Compound Right Side Group
       let compoundRightGroupSize = NSCollectionLayoutSize(
           widthDimension: .fractionalWidth(0.63),
           heightDimension: .fractionalHeight(1))
       let compoundRightGroup = NSCollectionLayoutGroup.vertical(layoutSize: compoundRightGroupSize, subitems: [compoundhalfGroup,compoundhalfGroup])
       
       // Final View Group
       let finalGroupSize = NSCollectionLayoutSize(
        widthDimension: .fractionalWidth(1.7),
           heightDimension: .fractionalHeight(1))
       let finalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: finalGroupSize, subitems: [firstItem,compoundRightGroup])

       // Section
       let section = NSCollectionLayoutSection(group: finalGroup)
       section.orthogonalScrollingBehavior = .continuous
       // Return
       return UICollectionViewCompositionalLayout(section: section)
   }

    
    func configure(cellsNumber: Int, cellHeight: CGFloat, cellWidth: CGFloat) {
        self.cellsNumber = cellsNumber
        self.cellHeight = cellHeight
        self.cellWidth = cellWidth
        backgroundColor = UIColor(named: "headerColor")
        setupCollectionView()
    }
   
    
    func setupCollectionView() {
        contentView.addSubview(categoryCollectionView)
        categoryCollectionView.backgroundColor = UIColor(named: "headerColor")
        categoryCollectionView.showsHorizontalScrollIndicator = false
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        categoryCollectionView.register(SmallRectCollectionCell.self, forCellWithReuseIdentifier: SmallRectCollectionCell.cellId)
        categoryCollectionView.setAnchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeading: 5, paddingTrailing: 5, paddingBottm: 5)
    }
}

extension CategoryTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellsNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallRectCollectionCell.cellId, for: indexPath) as! SmallRectCollectionCell
        
        switch indexPath.row {
        case 0:
            cell.label.font = UIFont.boldSystemFont(ofSize: 24)
            
        default:
            cell.label.font = UIFont.systemFont(ofSize: 12)
        }
        cell.imageView.image = UIImage(named: images[indexPath.row])
        cell.label.text = labels[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        categorySectionDelegate?.pushFromCategorySection(index: indexPath)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
}
