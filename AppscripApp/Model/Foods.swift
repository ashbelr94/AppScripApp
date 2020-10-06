//
//  Foods.swift
//  AppscripApp
//
//  Created by Ashbel Reinhard on 06/10/20.
//  Copyright © 2020 Ashbel Reinhard. All rights reserved.
//

import UIKit

class Foods {
    var title: String!
    var items: [String]
    var itemDescription: [String]!
    var itemImage:[String]
    var isSelected: Bool!
    var isExpanded: Bool!
    
    init(isExpanded: Bool!, isSelected: Bool!, title: String!,items:[String], itemDescription: [String], itemImage:[String]) {
        self.isExpanded = isExpanded
        self.isSelected = isSelected
        self.title = title
        self.items = items
        self.itemDescription = itemDescription
        self.itemImage = itemImage
    }
}
