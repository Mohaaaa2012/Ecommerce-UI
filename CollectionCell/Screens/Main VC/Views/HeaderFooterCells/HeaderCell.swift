//
//  HeaderCell.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 07/12/2020.
//

import UIKit

class HeaderCell: UITableViewCell {
    
    static let headerId = String(describing: HeaderCell.self)
    
    let headerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("See All", for: .normal)
        button.setTitleColor(UIColor(named: "tabBarColor"), for: .normal)
        return button
    }()
    
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        return label
    }()
    
    
    var label: String? {
        didSet{
            if let label = label {
                titleLabel.text = label
            }
        }
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    func setup() {
        backgroundColor = UIColor(named: "headerColor")
        contentView.addSubview(titleLabel)
        contentView.addSubview(headerButton)
        
        let screenWidth = UIScreen.main.bounds.width
        
        titleLabel.setAnchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeading: 20, paddingTrailing: screenWidth * 0.25 , paddingBottm: 8)
        
        headerButton.setAnchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, paddingTop: 8, paddingLeading: screenWidth * 0.8, paddingTrailing: 20, paddingBottm: 8)
    }
}
