//
//  ActionHCView.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/10.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class ActionHCView: UIView {
    
    private var heart: Bool? {
        didSet{
            heartButton.isSelect = self.heart!
        }
    }
    
    private lazy var separatorLine: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    
    private lazy var heartButton: HeartButton = {
        let button = HeartButton()
        self.heart == true ?
        button.setBackgroundImage(UIImage(named: "heart.fill"), for: .normal)
        :
        button.setBackgroundImage(UIImage(named: "heart"), for: .normal)
        return button
    }()
    
    private lazy var heartCount: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(red: 0.779, green: 0.779, blue: 0.779, alpha: 1)
        label.font = UIFont.systemFont(ofSize: 12, weight: .semibold)
        return label
    }()
    
    private lazy var commentButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.clipsToBounds = true
        button.contentMode = .scaleAspectFill
        button.setBackgroundImage(UIImage(named: "buble"), for: .normal)
        return button
    }()
    
    private lazy var commentCount: UILabel = {
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
    
    var observer: AnyObserver<(CommunityContainer,String)>
    let disposeBag = DisposeBag()
    
    override init(frame: CGRect) {
        let transferData = PublishSubject<(CommunityContainer,String)>()
        
        observer = transferData.asObserver()
        
        super.init(frame: frame)
        
        transferData
            .map{data,_ in data.heartCount}
            .bind(to: heartCount.rx.text)
            .disposed(by: disposeBag)
        
        transferData
            .map{data,_ in data.commentCount}
            .bind(to: commentCount.rx.text)
            .disposed(by: disposeBag)
        
        transferData
            .map{_,time in time}
            .bind(to: timeLabel.rx.text)
            .disposed(by: disposeBag)
        
        
        
        configue()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    func updateUI( heartCount: String, commentCount: String){
        self.heartCount.text = heartCount
        self.commentCount.text = commentCount
    }
    
    func configue() {
        [separatorLine,heartButton,heartCount,commentButton,commentCount,timeLabel].forEach{
            self.addSubview($0)
        }
        separatorLine.snp.makeConstraints{
            $0.top.equalTo(heartButton.snp.bottom).offset(15)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(2)
        }

        heartButton.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview().inset(16)
            $0.width.height.equalTo(15)
        }
        
        heartCount.snp.makeConstraints{
            $0.leading.equalTo(heartButton.snp.trailing).offset(6)
            $0.top.equalToSuperview()
        }
        
        commentButton.snp.makeConstraints{
            $0.width.height.equalTo(15)
            $0.top.equalToSuperview()
            $0.leading.equalTo(heartCount.snp.trailing).offset(15)
        }
        
        commentCount.snp.makeConstraints{
            $0.leading.equalTo(commentButton.snp.trailing).offset(6)
            $0.top.equalToSuperview()
        }
        
        timeLabel.snp.makeConstraints{
            $0.top.equalToSuperview()
            $0.trailing.equalToSuperview().inset(21)
        }
        
    }
    
}