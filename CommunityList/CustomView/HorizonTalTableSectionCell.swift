//
//  CollectionViewCell.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/07.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift

class HorizonTalTableSectionCell: UITableViewCell{
    
    lazy var horizontalCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .gray

       return collectionView
    }()
    
    
    var onData: AnyObserver<RxDataModel>
    
    var disposeBag = DisposeBag()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        let subject = PublishSubject<RxDataModel>()
        
        let indexPathSubject = PublishSubject<IndexPath>()
        
        onData = subject.asObserver()
         
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(horizontalCollectionView)
        horizontalCollectionView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
        
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
}
