//
//  UITableViewCell + Ext.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 10/12/2020.
//

import UIKit

extension UICollectionViewLayout {
    
     static func createLayout(rowItems: Int) -> UICollectionViewCompositionalLayout {
        
        //Single Left Items
        let firstItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.28),
            heightDimension: .fractionalHeight(1))
        let firstItem = NSCollectionLayoutItem(layoutSize: firstItemSize)
        firstItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 5, bottom: 0, trailing: 5)
        
        // Grid Item
        let SecondItemSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.25),
            heightDimension: .fractionalHeight(1))
        let secondItem = NSCollectionLayoutItem(layoutSize: SecondItemSize)
        secondItem.contentInsets = NSDirectionalEdgeInsets(top: 5, leading: 0, bottom: 0, trailing: 5)

        // Single Line Group
        let compoundGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(1),
            heightDimension: .fractionalHeight(0.5))
        let compoundhalfGroup = NSCollectionLayoutGroup.horizontal(layoutSize: compoundGroupSize, subitem: secondItem, count: rowItems)
        
        // Compound Right Side Group
        let compoundRightGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(0.72),
            heightDimension: .fractionalHeight(1))
        let compoundRightGroup = NSCollectionLayoutGroup.vertical(layoutSize: compoundRightGroupSize, subitems: [compoundhalfGroup,compoundhalfGroup])
        
        // Final View Group
        let finalGroupSize = NSCollectionLayoutSize(
            widthDimension: .fractionalWidth(2),
            heightDimension: .fractionalHeight(1))
        let finalGroup = NSCollectionLayoutGroup.horizontal(layoutSize: finalGroupSize, subitems: [firstItem,compoundRightGroup])

        // Section
        let section = NSCollectionLayoutSection(group: finalGroup)
        section.orthogonalScrollingBehavior = .continuous
        // Return
        return UICollectionViewCompositionalLayout(section: section)
    }
    
}
