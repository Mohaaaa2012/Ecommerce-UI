//
//  MenuTableCell.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 15/12/2020.
//

import UIKit

class MenuTableCell: UITableViewCell {

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
