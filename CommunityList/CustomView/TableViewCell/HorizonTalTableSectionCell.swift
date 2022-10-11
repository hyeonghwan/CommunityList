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
    
    lazy var headerView: HorizontalCollectionHeaderView = {
        let view = HorizontalCollectionHeaderView()
        return view
    }()
    
    lazy var horizontalCollectionView: UICollectionView = {
        
        let view = UICollectionView.settingCollectionView()
        
        return view
    }()

    var onData: AnyObserver<RxData>
    
    var disposeBag = DisposeBag()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        let subject = PublishSubject<RxData>()
        
        onData = subject.asObserver()
         
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        layoutconfigure()
        
        subject
            .map{ rxDataModel in  return rxDataModel.items }
            .bind(to: self.horizontalCollectionView.rx.items(cellIdentifier: HorizontalCollectionViewCell.identify,
                                                             cellType: HorizontalCollectionViewCell.self)){
                indexPath, item, cell in
                
                cell.onCollectionData.onNext(item)
            }
            .disposed(by: disposeBag)
        
    }
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    private func layoutconfigure() {
        self.contentView.addSubview(headerView)
        self.contentView.addSubview(horizontalCollectionView)
        
        headerView.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        horizontalCollectionView.snp.makeConstraints{
            $0.top.equalTo(headerView.snp.bottom).offset(7)
            $0.leading.trailing.bottom.equalToSuperview()
            
        }
    }
}


