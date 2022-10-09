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
    
    var onData: AnyObserver<RxData>
    
    var onIndexPath: AnyObserver<IndexPath>
    
    var disposeBag = DisposeBag()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        let subject = PublishSubject<RxData>()
        
        let indexPathSubject = PublishSubject<IndexPath>()
        
        onData = subject.asObserver()
         
        onIndexPath = indexPathSubject.asObserver()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        subject
            .observe(on: MainScheduler.instance)
            .map{data in return data.items}
            .subscribe(onNext: { items in
                
                guard let item = items.first as? CommunityTableModel else { return }
            
                self.label.text = item.communityData.content
            })
            .disposed(by: disposeBag)
    
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.contentView.frame = self.contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10))
    }
    
    func configure() {
        self.contentView.backgroundColor = UIColor.orange
        
        self.contentView.addSubview(label)
        
        label.snp.makeConstraints{
            $0.leading.trailing.bottom.top.equalToSuperview()
        }
    }

}
