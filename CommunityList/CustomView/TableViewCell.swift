//
//  TableViewCell.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class TableViewCell: UITableViewCell {
    
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "test"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        return label
    }()
    
    var onData: AnyObserver<RxDataModel>
    
    var onIndexPath: AnyObserver<IndexPath>
    
    var disposeBag = DisposeBag()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        let subject = PublishSubject<RxDataModel>()
        
        let indexPathSubject = PublishSubject<IndexPath>()
        
        onData = subject.asObserver()
         
        onIndexPath = indexPathSubject.asObserver()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        subject
            .observe(on: MainScheduler.instance)
            .subscribe(onNext: { data in
                print("tableViewCell : \(data)")
                self.label.text = data.items.first?.content
            })
            .disposed(by: disposeBag)
    
            
        
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    func configure() {
        
        self.contentView.addSubview(label)
        
        label.snp.makeConstraints{
            $0.leading.trailing.bottom.top.equalToSuperview()
        }
    }

}
