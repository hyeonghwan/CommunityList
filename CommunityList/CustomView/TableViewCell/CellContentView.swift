//
//  CustomViewInTBCell.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/10.
//

import Foundation
import UIKit
import SnapKit
import RxCocoa
import RxSwift

class CellContentView: UIView{
    
    private lazy var headerContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.945, alpha: 1)
        view.layer.cornerRadius = 3
        return view
    }()
    
    private lazy var button: UIButton = {
        let button = UIButton()
        
        return button
    }()
    
    private lazy var headerTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.425, green: 0.391, blue: 0.391, alpha: 1)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var contentLable: UILabel = {
        let label = UILabel()
        label.textColor = .label
        label.font = UIFont.systemFont(ofSize: 14, weight: .medium)
        label.lineBreakMode = .byTruncatingTail
        label.numberOfLines = 3
        return label
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.alignment = .leading
        stackView.distribution = .equalSpacing
        stackView.spacing = 15
        stackView.axis = .vertical
        return stackView
    }()
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 12
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var tagLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.779, green: 0.779, blue: 0.779, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.779, green: 0.779, blue: 0.779, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    private lazy var separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        
        return view
    }()
    
    private lazy var actionView: ActionHCView = {
        let label = ActionHCView()
        return label
    }()
    
//    var customViewObserver: AnyObserver<CommunityTableModel>
//
//    var disposeBag = DisposeBag()
    
//    var onTimeChanged: (()->())?
    
    override init(frame: CGRect) {
        
        
        super.init(frame: frame)
            

        layoutConfigure()
        
    }
    
    var cellBinder: Binder<CommunityTableModel> {
        return Binder(self) { cell, model in
            cell.headerTypeLabel.text = model.communityData.headerTitleType.rawValue
            cell.contentLable.text = model.communityData.content
            cell.titleLabel.text = model.title
            cell.imageView.image = UIImage(named: model.image)
            cell.tagLabel.text = model.tag
            cell.timeLabel.text =  DateFormat().caluculateTime(model.communityData.timeWhenWrite)
            
            cell.actionView.observer.onNext(model.communityData)
        }
    }
    
    func settUpBinding(){
        
    }

    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
}
private extension CellContentView {
    func layoutConfigure() {
        
        [stackView,imageView,tagLabel,actionView,timeLabel,separatorLine].forEach{
            self.addSubview($0)
        }
        [headerContainerView,titleLabel,contentLable].forEach{
            stackView.addArrangedSubview($0)
        }
        
        headerContainerView.addSubview(headerTypeLabel)
        
        headerTypeLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
            $0.top.equalToSuperview().inset(2)
            $0.trailing.equalToSuperview().inset(8)
        }
        
        imageView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(56)
            $0.width.height.equalTo(80)
            $0.trailing.equalToSuperview().inset(21)
        }
        
        stackView.snp.makeConstraints{
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.lessThanOrEqualTo(imageView.snp.leading).offset(-16)
        }
        

        
        tagLabel.snp.makeConstraints{
            $0.top.equalTo(stackView.snp.bottom).offset(30)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.greaterThanOrEqualToSuperview()
        }
        
        actionView.snp.makeConstraints{
            $0.top.equalTo(tagLabel.snp.bottom).offset(24)
            $0.height.equalTo(30)
            $0.leading.equalToSuperview().inset(16)
            $0.trailing.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints{
            $0.bottom.equalTo(separatorLine.snp.top).offset(-20)
            $0.trailing.equalToSuperview().inset(21)
        }
        
        separatorLine.snp.makeConstraints{
            $0.top.equalTo(actionView.snp.bottom).offset(10)
            $0.height.equalTo(2)
            $0.leading.trailing.equalToSuperview()
        }

        
        
        
        
    }
}
