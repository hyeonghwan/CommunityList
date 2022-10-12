//
//  Array-Custom-Ex.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import UIKit


protocol IdentifiableProtocol{
    static var identify: String { get }
}
extension IdentifiableProtocol{
    static var identify : String {
        return String(describing: Self.self)
    }
}

extension TableViewCell: IdentifiableProtocol {}

extension HorizonSectionCell: IdentifiableProtocol {}

extension HorizonCollectionCell: IdentifiableProtocol {}

extension HorizonTitleView: IdentifiableProtocol {}

extension UICollectionView {
    static func settingCollectionView() -> UICollectionView {
        let layout = UICollectionViewFlowLayout()
        
        layout.scrollDirection = .horizontal
        
        //paginaitionView Size
        
        layout.itemSize = CGSize(width: 180, height: 174)
        
        layout.minimumLineSpacing = 16
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.isPagingEnabled = false
        
        collectionView.showsHorizontalScrollIndicator = true
        
        collectionView.backgroundColor = .tertiarySystemBackground
        
        collectionView.register(HorizonCollectionCell.self, forCellWithReuseIdentifier: HorizonCollectionCell.identify)
        
        return collectionView
    }
}
