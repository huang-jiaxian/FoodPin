//
//  RestaurantDetailViewController.swift
//  FoodPin
//
//  Created by jia on 2019/11/27.
//  Copyright © 2019 jia. All rights reserved.
//

import UIKit

class RestaurantDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(systemName: "phone")?.withTintColor(.black,renderingMode:  .alwaysOriginal)
            cell.shortTextLabel.text = restaurant.phone
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black,renderingMode:  .alwaysOriginal)
            cell.shortTextLabel.text = restaurant.location
            cell.selectionStyle = .none
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            cell.descriptionLabel.text = restaurant.description
            cell.selectionStyle = .none
            
            return cell
            
        default:
            fatalError("Failed to instantiate the table view cell for detail view controller")
        }
    }
    
    
//    @IBOutlet var restaurantImageView: UIImageView!
//    @IBOutlet var nameLabel: UILabel!
//    @IBOutlet var locationLabel: UILabel!
//    @IBOutlet var typeLabel: UILabel!
//    @IBOutlet var phoneLabel: UILabel!
//    @IBOutlet var descriptionLabel: UILabel!
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var headerView: RestaurantDetailHeader!
    
//    var restaurantImageName = ""
//    var restaurantName = ""
//    var restaurantType = ""
//    var restaurantLocation = ""
    var restaurant = Restaurant()
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
//        restaurantImageView.image = UIImage(named: restaurantImageName)
//        nameLabel.text = restaurantName
//        locationLabel.text = restaurantLocation
//        typeLabel.text = restaurantType
//        restaurantImageView.image = UIImage(named: restaurant.name)
//        nameLabel.text = restaurant.name
//        locationLabel.text = restaurant.location
//        typeLabel.text = restaurant.type
//        phoneLabel.text = restaurant.phone
//        descriptionLabel.text = restaurant.description
      
        // 大标题不再出现
        navigationItem.largeTitleDisplayMode = .never
        
        // 来源于tableviewde的prepare
        headerView.headerImageView.image = UIImage(named: restaurant.name)
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.heartImageView.isHidden = restaurant.isVisited ? false : true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
