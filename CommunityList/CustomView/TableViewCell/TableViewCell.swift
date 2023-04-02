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

    private lazy var customView: CellContentView = {
        let view = CellContentView()
        
        return view
    }()
    
    var onData: AnyObserver<RxData>
    
    var disposeBag = DisposeBag()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        let subject = PublishSubject<RxData>()
        
        onData = subject.asObserver()
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        subject
            .map{rxData in rxData.items.first!}
            
            .subscribe(onNext: { [weak self] data in
                guard let self = self else { return }
                
                switch data {
                
                case let .tableItem(item):
                
                    self.customView.customViewObserver.onNext(item)
                default:
                    break
                }
            })
            .disposed(by: disposeBag)
        
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    func configure() {
        self.backgroundColor = .tertiarySystemBackground
        
        self.contentView.addSubview(customView)
       
        
        customView.snp.makeConstraints{
            $0.edges.equalToSuperview()
        }
    }

}
