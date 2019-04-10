//
//  CategoryTableViewCell.swift
//  ContactsLBTA
//
//  Created by berkut on 09/04/2019.
//  Copyright © 2019 Lets Build That App. All rights reserved.
//

import UIKit

class CategoryTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var leadingConstraint: NSLayoutConstraint!
    
    func configure(with model: GoodsCategory) {
        titleLabel.text = model.title
        switch model.level {
        case 0:
            leadingConstraint.constant = 20
        case 1:
            leadingConstraint.constant = 40
        case 2:
            leadingConstraint.constant = 60
        case 3:
            leadingConstraint.constant = 80
        default:
            leadingConstraint.constant = 20
        }
    }
}
