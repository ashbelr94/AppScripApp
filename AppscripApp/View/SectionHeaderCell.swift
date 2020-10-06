//
//  SectionHeaderCell.swift
//  AppscripApp
//
//  Created by Ashbel Reinhard on 06/10/20.
//  Copyright © 2020 Ashbel Reinhard. All rights reserved.
//

import UIKit

class SectionHeaderCell: UITableViewHeaderFooterView {

    
    //MARK: - Properties
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.black, for: .normal)
        btn.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        return btn
    }()
    
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
        setup()
    }
    
    
    func setup(){
        contentView.addSubview(button)
        button.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0)
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
