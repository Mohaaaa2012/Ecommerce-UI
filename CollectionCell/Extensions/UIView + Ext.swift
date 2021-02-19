//
//  UIView + Ext.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 07/12/2020.
//

import UIKit

extension UIView {
    
    func setAnchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?,
                   trailing: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?,
                   paddingTop: CGFloat, paddingLeading: CGFloat, paddingTrailing: CGFloat,
                   paddingBottm: CGFloat, width: CGFloat = 0, height: CGFloat = 0) {
        
        translatesAutoresizingMaskIntoConstraints = false
        if let top = top {
            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
        }
        if let leading = leading {
            leadingAnchor.constraint(equalTo: leading, constant: paddingLeading).isActive = true
        }
        if let trailing = trailing {
            trailingAnchor.constraint(equalTo: trailing, constant: -paddingTrailing).isActive = true
        }
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottm).isActive = true
        }
        if (width != 0) {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        if (height != 0) {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
    }
}
