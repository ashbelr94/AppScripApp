//
//  DescriptionView.swift
//  AppscripApp
//
//  Created by Ashbel Reinhard on 06/10/20.
//  Copyright © 2020 Ashbel Reinhard. All rights reserved.
//

import UIKit

class DescriptionView: UIViewController {

    // MARK: - Properties
    var indexPath = IndexPath()
    
    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        return label
    }()
    
    let button: UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitleColor(.white, for: .normal)
        btn.backgroundColor = .blue
        btn.setTitle("Select", for: .normal)
        return btn
    }()
    
    let image: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.backgroundColor = .lightGray
        iv.layer.cornerRadius = 25
        return iv
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureNavBar()
        setupItems()
    }
    
    
    //MARK: - Handlers
    

    
    func configureNavBar(){
        navigationController?.navigationBar.tintColor = .black
        
    }
    
    
    func setupItems(){
        
        view.addSubview(image)
        image.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: nil, right: view.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: view.bounds.height / 2)
        
        view.addSubview(button)
        button.anchor(top: nil, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 20, paddingRight: 20, width: 0, height: 40)
        
        view.addSubview(descriptionLabel)
        descriptionLabel.anchor(top: image.bottomAnchor, left: view.leftAnchor, bottom: button.topAnchor, right: view.rightAnchor, paddingTop: 30, paddingLeft: 10, paddingBottom: 30, paddingRight: 10, width: 0, height: 0)
        descriptionLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        
    }
    

}
