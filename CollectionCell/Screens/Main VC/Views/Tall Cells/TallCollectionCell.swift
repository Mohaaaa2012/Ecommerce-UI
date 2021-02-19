//
//  CollectionViewCell.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 03/12/2020.
//

import UIKit

class TallCollectionCell: UICollectionViewCell {
    
    static let cellId = "tallCellId"
    
    let imageView: UIImageView = {
        let iv = UIImageView()
        iv.backgroundColor = .blue
        return iv
    }()
    
    let describtionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = .darkGray
        label.text = "describtion label"
        return label
    }()
    
    let priceLabel: UILabel = {
        let label = UILabel()
        label.text = "price label"
        label.textColor = .darkGray
        return label
    }()
    
    let shareButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "square.and.arrow.up"), for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    let bagButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "cart.badge.plus"), for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    let favoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "heart"), for: .normal)
        button.tintColor = .darkGray
        return button
    }()
    
    let stackView: UIStackView = {
       let sv = UIStackView()
        sv.distribution = .equalCentering
        sv.axis = .horizontal
        return sv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        layer.cornerRadius = 5
        setup()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        addSubview(imageView)
        addSubview(describtionLabel)
        addSubview(priceLabel)
        stackView.addArrangedSubview(shareButton)
        stackView.addArrangedSubview(bagButton)
        stackView.addArrangedSubview(favoriteButton)
        addSubview(stackView)
        
        imageView.setAnchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: nil, paddingTop: 20, paddingLeading: 30, paddingTrailing: 30, paddingBottm: 0, height: contentView.bounds.height / 3)
        describtionLabel.setAnchor(top: imageView.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: nil, paddingTop: 5, paddingLeading: 10, paddingTrailing: 10, paddingBottm: 0, height: 60)
        priceLabel.setAnchor(top: describtionLabel.bottomAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: nil, paddingTop: 30, paddingLeading: 10, paddingTrailing: 10, paddingBottm: 0, height: 30)
        stackView.setAnchor(top: nil, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeading: 10, paddingTrailing: 10, paddingBottm: 10, height: 30)
        
    }
}
