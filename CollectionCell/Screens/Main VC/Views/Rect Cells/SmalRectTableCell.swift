//
//  SmalRectTableCell.swift
//  CollectionCell
//
//  Created by Mohamed Mostafa on 08/12/2020.
//

import UIKit

class SmallRectTableCell: UITableViewCell {
    
    static let cellId = String(describing: SmallRectTableCell.self)
    
    var cellHeight: CGFloat = 0
    var cellWidth: CGFloat = 0
    var cellsNumber: Int = 0
    let images = ["1", "2", "3", "4", "5", "1", "2", "3", "4", "5",]
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(cellsNumber: Int, cellHeight: CGFloat, cellWidth: CGFloat) {
        self.cellsNumber = cellsNumber
        self.cellHeight = cellHeight
        self.cellWidth = cellWidth
        backgroundColor = UIColor(named: "headerColor")
        setupCollectionView()
    }
    
    func setupCollectionView() {
        contentView.addSubview(collectionView)
        collectionView.backgroundColor = UIColor(named: "headerColor")
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(SmallRectCollectionCell.self, forCellWithReuseIdentifier: SmallRectCollectionCell.cellId)
        collectionView.setAnchor(top: topAnchor, leading: leadingAnchor, trailing: trailingAnchor, bottom: bottomAnchor, paddingTop: 0, paddingLeading: 5, paddingTrailing: 5, paddingBottm: 5)
    }
    
    
    func startTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(sliderHandler), userInfo: nil, repeats: true)
        timer.fire()
    }
    
    @objc func sliderHandler(){
        //get cell size
        let cellSize = CGSize(width: cellWidth, height: cellHeight)
        //get current content Offset of the Collection view
        let contentOffset = collectionView.contentOffset
        //scroll to next cell
        collectionView.scrollRectToVisible(CGRect(x: contentOffset.x + cellSize.width,
                                               y: contentOffset.y,
                                               width: cellSize.width,
                                               height: cellSize.height), animated: true);
        
    }
}

extension SmallRectTableCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellsNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallRectCollectionCell.cellId, for: indexPath) as! SmallRectCollectionCell
        cell.imageView.image = UIImage(named: images[indexPath.row])
        cell.label.isHidden = true
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    
    
}
