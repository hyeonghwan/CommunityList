//
//  CommunityModel.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/06.
//

import Foundation
import RxDataSources


typealias CommunitySection = SectionModel<String, RxDataModel>

struct RxDataModel {
    var headerTitle: String
    var items: [Item]
}

extension RxDataModel: AnimatableSectionModelType {
    typealias Item = CommuityDataModel
    
    var identity: String {
        return headerTitle
    }
    
    init(original: RxDataModel, items: [CommuityDataModel]) {
        self = original
        self.items = items
    }
}

