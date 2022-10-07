//
//  VC+ex.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import UIKit

extension UINavigationBar
{
    var largeTitleHeight: CGFloat {
        let maxSize = self.subviews
            .filter { $0.frame.origin.y > 0 }
            .max { $0.frame.origin.y < $1.frame.origin.y }
            .map { $0.frame.size }
        return maxSize?.height ?? 0
    }
}

extension ViewController{
    
    func configureEndEditing() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
       view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func configureAddContentLayout(){
        self.view.backgroundColor = .tertiarySystemBackground
        self.view.addSubview(containerTableView)
        
        containerTableView.snp.makeConstraints{
            $0.top.equalTo(self.view.safeAreaLayoutGuide.snp.top)
            $0.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    func settingNavigation(){
        self.title = "고객센터"
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.label]
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.label]
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func getNavigationHeightSize() -> CGFloat{
        var navBarHeight: CGFloat = 0
        if #available(iOS 13.0, *){
           let height = UIApplication.firstKeyWindowForConnectedScenes?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0
            navBarHeight = height +
            (navigationController?.navigationBar.frame.height ?? 0.0)
            
        }else {
           navBarHeight = UIApplication.shared.statusBarFrame.size.height +
                     (navigationController?.navigationBar.frame.height ?? 0.0)
        }
        return navBarHeight
    }
    
}
