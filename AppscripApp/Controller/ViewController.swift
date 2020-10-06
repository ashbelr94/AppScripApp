//
//  ViewController.swift
//  AppscripApp
//
//  Created by Ashbel Reinhard on 06/10/20.
//  Copyright © 2020 Ashbel Reinhard. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
    
    //MARK: - Properties
    let headerText: UILabel = {
        let text = UILabel()
        text.textColor = .black
        text.font = UIFont.boldSystemFont(ofSize: 22)
        return text
    }()
    
    let reuseItendifier = "ReuseCellID"
    let headerIdentifier = "sectionHeader"
    let hID = "collectionHeaderIdentifier"
    

    let food = [Foods(isExpanded: true, isSelected: false, title: "pizza", items: ["Farmhouse", "Cheese Pizza", "Corn Pizza", "Tandoori Pizza"], itemDescription: ["A pizza that goes ballistic on veggies! Check out this mouth watering overload of crunchy, crisp capsicum, succulent mushrooms and fresh tomatoes", "a unique and popular pizza type which has a thick crust with yummy liquid or molten cheese inside. the topping and the spread used in this recipe is very similar to any other pizza, but is filled with molten cheese in it", "Corn Pizza Descriptions", "Mix together salt, cayenne, coriander, chili powder, garlic powder, dry mustard, ginger, turmeric, fennel, cumin etc."], itemImage: ["farmHouse.jpg", "cheesepizza.jpg", "cornpizza.jpg", "tandooriPizza.jpg"]), Foods(isExpanded: true, isSelected: false, title: "Burger", items: ["Chiken Burger", "Steak Burger", "Malai Burger"], itemDescription: ["Chiken Burger Description", "Steak Burger Description", "Malai Burger Description"], itemImage: ["chickenBurgers.jpg", "steakBurger.jpg", "malaiBurger.jpg"])]

    
    // MARK: - Init
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavBar()
        //handleGroup()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: reuseItendifier)
        tableView.register(SectionHeaderCell.self,
                           forHeaderFooterViewReuseIdentifier: headerIdentifier)
        tableView.register(BannersCollectionViewCell.self, forCellReuseIdentifier: hID)
        
        
    }
    
    
    func configureNavBar(){
        navigationItem.title = "FOOD MENU"
        self.navigationController?.navigationBar.barTintColor = .white
        self.navigationItem.leftBarButtonItem?.tintColor = .black
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.black]
        
    }
    
    // MARK:- Handlers
    
    @objc func handleDropDown(button: UIButton){
        
        let section = button.tag
        
        var indexPaths = [IndexPath]()
            for row in food[section - 1].items.indices{
                let indexPath = IndexPath(row: row, section: section)
                indexPaths.append(indexPath)
            }
        
        guard let isExpanded = food[section - 1].isExpanded else  {return}
        food[section - 1].isExpanded = !isExpanded
        
        if isExpanded{
            tableView.deleteRows(at: indexPaths, with: .fade)
        } else {
            tableView.insertRows(at: indexPaths, with: .fade)
        }
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 0
        }
        return food[section-1].isExpanded ? food[section-1].items.count : 0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let section = indexPath.section - 1
        let descriptionView = DescriptionView()
        descriptionView.indexPath = self.tableView.indexPathForSelectedRow!
        descriptionView.descriptionLabel.text = food[section].itemDescription[indexPath.row]
        descriptionView.image.image = UIImage(named: food[section].itemImage[indexPath.row])
        descriptionView.navigationItem.title = food[section].items[indexPath.row]
        
        //** This is done, only for the selection of a particular Item in the description level
        descriptionView.navigationItem.hidesBackButton = true
        let newBackButton = UIBarButtonItem(title: "Back", style: UIBarButtonItem.Style.plain, target: self, action: #selector(handleBack))
        descriptionView.navigationItem.leftBarButtonItem = newBackButton
        descriptionView.button.addTarget(self, action: #selector(handleButton), for: .touchUpInside)
        // Can Be removed if not intended for this purpose
        //**
        self.navigationController?.pushViewController(descriptionView, animated: true)
    }
    
  //** This is done, only for the selection of a particular Item in the description level
    @objc func handleBack(){
        let descriptionView = DescriptionView()
        self.tableView.deselectRow(at: descriptionView.indexPath, animated: true)
        self.navigationController?.popViewController(animated: true)
    }
    @objc func handleButton(){
        self.tableView.allowsMultipleSelection = true
        self.navigationController?.popViewController(animated: true)
    }
    // Can Be removed if not intended for this purpose
    //**
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 0 && indexPath.row == 0 {
            return 350
        }else {
        return 50
        }
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        //let label = UILabel()
        
        if food.count == 0 {
            return nil
        }
        
        if section == 0 {
            let view = tableView.dequeueReusableCell(withIdentifier: hID) as! BannersCollectionViewCell
            
            return view
        }
        
        let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerIdentifier) as! SectionHeaderCell
        view.button.setTitle(food[section - 1].title, for: .normal)
        view.button.tag = section
        view.button.addTarget(self, action: #selector(handleDropDown), for: .touchUpInside)
        return view
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseItendifier, for: indexPath)
        
        cell.textLabel?.text = food[indexPath.section-1].items[indexPath.row]
        return cell
    }
}

