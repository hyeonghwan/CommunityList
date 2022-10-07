//
//  CommunityDataModel.swift
//  CommunityList
//
//  Created by 박형환 on 2022/10/07.
//

import Foundation
import RxDataSources

struct CommuityDataModel {
    let titleType: String
    let content: String
    let heartCount: String = "1.4k"
    let commentCount: String = "1k"
}

extension CommuityDataModel: IdentifiableType, Equatable {
    var identity: String {
        // 예제 편의를 위해 UUID().uuidString을 사용했고, 실제에서는 데이터를 구분하는 id값 사용을 지향
        return UUID().uuidString
    }
}
