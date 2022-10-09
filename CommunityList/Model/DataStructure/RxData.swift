//
//  RxData.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/09.
//

import Foundation
import RxDataSources

enum MultipleSectionModel {
    case tableItem(CommunityTableModel)
    case collectionItem(CommunityRecommendModel)
}

extension MultipleSectionModel: IdentifiableType,Equatable{
    var identity: String {
        return UUID().uuidString
    }
}

typealias RxDataSection = SectionModel<String, RxData>

struct RxData {
    var headerTitle: String
    var items: [Item]
}

extension RxData: AnimatableSectionModelType {
    typealias Item = MultipleSectionModel
    
    var identity: String {
        return headerTitle
    }
    
    init(original: RxData, items: [Item]) {
        self = original
        
        self.items = items
    }
}
