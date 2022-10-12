//
//  RightNavigationItem.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/12.
//

import Foundation
import UIKit
import SnapKit
import RxSwift
import RxCocoa

class RightNavigationItem: UIView {
    
    // tableView 최상단 이동 이벤트
    var onEventMove: (() -> ())?
    
    var count: Int = 1 {
        didSet{
            count != 0 ? self.chatCountLabel.text = "\(count)" : hide(completion: nil)
        }
    }
    
    @objc func chatButtonTapped(_ sender: UIButton){
        if self.count > 0{
            self.count -= 1
        }
        onEventMove?()
    }
    
    @objc func alarmButtonTapped(_ sender: UIButton){
        if self.count == 0{
            show(completion: nil)
        }
        self.count += 1
    }
    
    
    func show(completion: (() -> Void)? ) {
        self.addSubview(containerView)
        containerView.snp.makeConstraints{
            $0.leading.equalTo(chatButton.snp.trailing).offset(4)
            $0.width.height.equalTo(23)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        alarmButton.snp.remakeConstraints{
            $0.leading.equalTo(containerView.snp.trailing).offset(8)
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseInOut
            , animations: {
                self.layoutIfNeeded()
            })
        
    }
    
    
    func hide(completion: (() -> Void)? ) {
        self.containerView.removeFromSuperview()
        
        alarmButton.snp.remakeConstraints{
            $0.leading.equalTo(chatButton.snp.trailing).offset(6)
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
        UIView.animate(
            withDuration: 0.5,
            delay: 0,
            options: .curveEaseInOut
            , animations: {
                self.layoutIfNeeded()
            })
        
    }
    
    private lazy var chatButton: UIButton = {
        let button = UIButton()
        button.setAttributedTitle(NSMutableAttributedString(string: "채팅", attributes:
                                                                [NSAttributedString.Key.kern: 0.08,
                                                                 NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16)]), for: .normal)
        button.addTarget(self, action: #selector(chatButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 0.892, green: 0.368, blue: 0.368, alpha: 1)
        view.layer.cornerRadius = 23 / 2
        return view
    }()
    
    private lazy var chatCountLabel: UILabel = {
        let label = UILabel()
        label.text = "\(count)"
        label.textColor = .white
        label.font = UIFont.boldSystemFont(ofSize: 12)
        return label
    }()
    
    private lazy var alarmButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "bell"), for: .normal)
        button.contentMode = .scaleAspectFit
        button.addTarget(self, action: #selector(alarmButtonTapped(_:)), for: .touchUpInside)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        chatCountLabel.sizeToFit()
    }
    
    required init?(coder: NSCoder) {
        fatalError("required init fatalError")
        
    }
    
    func configure() {
        [chatButton,containerView,alarmButton].forEach{
            self.addSubview($0)
        }
        
        containerView.addSubview(chatCountLabel)
        
        chatButton.snp.makeConstraints{
            $0.leading.equalToSuperview()
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        containerView.snp.makeConstraints{
            $0.leading.equalTo(chatButton.snp.trailing).offset(4)
            $0.width.height.equalTo(23)
            $0.top.equalToSuperview()
            $0.bottom.equalToSuperview()
        }
        chatCountLabel.snp.makeConstraints{
            $0.centerX.centerY.equalToSuperview()
        }
        alarmButton.snp.makeConstraints{
            $0.leading.equalTo(containerView.snp.trailing).offset(8)
            $0.top.bottom.equalToSuperview()
            $0.trailing.equalToSuperview()
        }
        
    }
}
