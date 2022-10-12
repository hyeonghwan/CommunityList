//
//  CommunityModel.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/09.
//

import Foundation
import RxDataSources

// table
struct CommunityTableModel: CommunityIdentiable{
    var communityData: CommunityContainer
    var title: String = "천장도배"
    var image: String = "contentImage"
    var tag: String = "#도배"
}

extension CommunityTableModel: Equatable{}

//collection
struct CommunityRecommendModel: CommunityIdentiable {
    var communityData: CommunityContainer
}

extension CommunityRecommendModel: Equatable{ }



