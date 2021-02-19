//
//  FooterCell.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 07/12/2020.
//

import UIKit

class FooterCell: UITableViewCell {
    
    static let footerId = String(describing: FooterCell.self)
    
    let footerImageView1: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "tray.circle")
        return iv
    }()
    let footerImageView2: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(systemName: "archivebox.circle")
        return iv
    }()
    
    let footerlabel: UILabel = {
        let label = UILabel()
        label.text = "Free returns"
        return label
    }()
    let footerlabel2: UILabel = {
        let label = UILabel()
        label.text = "Cash On Delivery"
        return label
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
        addSubview(footerImageView1)
        addSubview(footerlabel)
        addSubview(footerImageView2)
        addSubview(footerlabel2)
        
        footerImageView1.setAnchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, paddingTop: 5, paddingLeading: 30, paddingTrailing: 200, paddingBottm: 5)
        
    }
    
    
}
