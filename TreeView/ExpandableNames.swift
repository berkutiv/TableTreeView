//
//  ExpandableNames.swift
//  ContactsLBTA
//
//  Created by Brian Voong on 11/17/17.
//  Copyright © 2017 Lets Build That App. All rights reserved.
//

import Foundation

struct GoodsCategory: Equatable {
    var id: Int
    var title: String
    var hasChilden: Bool
    var isExpanded: Bool
    var childrenCategories: [GoodsCategory]
    var level: Int
    
    static func == (lhs: GoodsCategory, rhs: GoodsCategory) -> Bool {
        return lhs.id == rhs.id ? true : false
    }
}
