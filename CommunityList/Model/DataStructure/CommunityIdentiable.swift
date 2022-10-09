//
//  CommunityDataModel.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/07.
//

import Foundation
import RxDataSources

protocol CommunityIdentiable {
    var communityData: CommunityContainer { get }
}

struct CommunityContainer {
    var headerTitleType: String
    var content: String
    var heartCount: String = "1.4k"
    var commentCount: String = "1k"
}

extension CommunityContainer: IdentifiableType,Equatable{
    var identity: String {
            
            return UUID().uuidString
        }
}

