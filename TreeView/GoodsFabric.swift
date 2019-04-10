//
//  GoodsFabric.swift
//  TreeView
//
//  Created by berkut on 10/04/2019.
//  Copyright © 2019 berkut. All rights reserved.
//

import Foundation

class GoodsFabric {
    class func configureDataSource() -> [GoodsCategory] {
        var dataSource = [GoodsCategory]()
        
        var object0 = GoodsCategory(id: 0, title: "напитки", hasChilden: true, isExpanded: false, childrenCategories: [], level: 0)
        var cola = GoodsCategory(id: 1, title: "кола", hasChilden: false, isExpanded: false, childrenCategories: [], level: 1)
        var pepsi = GoodsCategory(id: 2, title: "пепси", hasChilden: false, isExpanded: false, childrenCategories: [], level: 1)
        var water = GoodsCategory(id: 3, title: "вода", hasChilden: false, isExpanded: false, childrenCategories: [], level: 1)
        
        object0.childrenCategories.append(cola)
        object0.childrenCategories.append(pepsi)
        object0.childrenCategories.append(water)
        
        dataSource.append(object0)
        
        var object1 = GoodsCategory(id: 4, title: "лекарства", hasChilden: true, isExpanded: false, childrenCategories: [], level: 0)
        var cola1 = GoodsCategory(id: 5, title: "раз", hasChilden: false, isExpanded: false, childrenCategories: [], level: 1)
        var pepsi1 = GoodsCategory(id: 6, title: "два", hasChilden: false, isExpanded: false, childrenCategories: [], level: 1)
        var water1 = GoodsCategory(id: 7, title: "три", hasChilden: false, isExpanded: false, childrenCategories: [], level: 1)
        var water12 = GoodsCategory(id: 12, title: "вложенный ", hasChilden: false, isExpanded: false, childrenCategories: [], level: 2)
        var water13 = GoodsCategory(id: 13, title: "вложенный 2", hasChilden: false, isExpanded: false, childrenCategories: [], level: 2)
        var water14 = GoodsCategory(id: 14, title: "вложенный во вложенный", hasChilden: false, isExpanded: false, childrenCategories: [], level: 3)
        
        water13.childrenCategories.append(water14)
        water1.childrenCategories.append(water12)
        pepsi1.childrenCategories.append(water13)
        
        object1.childrenCategories.append(cola1)
        object1.childrenCategories.append(pepsi1)
        object1.childrenCategories.append(water1)
        
        
        dataSource.append(object1)
        
        var object2 = GoodsCategory(id: 8, title: "еда", hasChilden: true, isExpanded: false, childrenCategories: [], level: 0)
        var cola2 = GoodsCategory(id: 9, title: "лала", hasChilden: false, isExpanded: false, childrenCategories: [], level: 1)
        var pepsi2 = GoodsCategory(id: 10, title: "тралала", hasChilden: false, isExpanded: false, childrenCategories: [], level: 1)
        var water2 = GoodsCategory(id: 11, title: "пумпум", hasChilden: false, isExpanded: false, childrenCategories: [], level: 1)
        
        object2.childrenCategories.append(cola2)
        object2.childrenCategories.append(pepsi2)
        object2.childrenCategories.append(water2)
        
        dataSource.append(object2)
        
        return dataSource
    }
}
