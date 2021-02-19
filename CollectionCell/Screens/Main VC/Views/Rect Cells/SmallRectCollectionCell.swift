//
//  SmallRectCollectionCell.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 08/12/2020.
//

import UIKit

class SmallRectCollectionCell: UICollectionViewCell {
    
    static let cellId = "SmallcollectionCellId"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .white
        iv.layer.cornerRadius = 10
        iv.clipsToBounds = true
        return iv
    }()
    
    let label: UILabel = {
       let label = UILabel()
        label.textColor = .label
        label.text = "Nice"
        label.alpha = 0.7
        label.clipsToBounds = true
        label.backgroundColor = .systemGray5
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        backgroundColor = .systemGray
        contentView.addSubview(imageView)
        layer.cornerRadius = 20
        imageView.setAnchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeading: 0, paddingTrailing: 0, paddingBottm: 0)
        contentView.addSubview(label)
        label.setAnchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: nil, paddingTop: 0, paddingLeading: 0, paddingTrailing: 0, paddingBottm: 0, height: contentView.frame.size.height * 0.2)
        
    }
}
