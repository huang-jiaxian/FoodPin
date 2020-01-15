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
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        switch indexPath.row {
        
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(systemName: "phone")?.withTintColor(.black,renderingMode: .alwaysOriginal)
            cell.shortTextLabel.text = restaurant.phone
            cell.selectionStyle = .none
            
            return cell
            
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailIconTextCell.self), for: indexPath) as! RestaurantDetailIconTextCell
            cell.iconImageView.image = UIImage(systemName: "map")?.withTintColor(.black,renderingMode: .alwaysOriginal)
            cell.shortTextLabel.text = restaurant.location
            cell.selectionStyle = .none
            
            return cell
            
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailTextCell.self), for: indexPath) as! RestaurantDetailTextCell
            cell.descriptionLabel.text = restaurant.description
            cell.selectionStyle = .none
            
            return cell
            
        case 3:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailSeparantorCell.self), for: indexPath) as! RestaurantDetailSeparantorCell
            cell.titleLable.text = "HOW TO GET HERE"
            cell.selectionStyle = .none
            
            return cell
            
        case 4:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: RestaurantDetailMapCell.self), for: indexPath) as! RestaurantDetailMapCell
            cell.selectionStyle = .none
            
            cell.configure(location: restaurant.location)
            
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
    @IBAction func close(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: nil)
    }
    @IBAction func rateRestaurant(segue: UIStoryboardSegue) {
        dismiss(animated: true, completion: {
            if let rating = segue.identifier {
                self.restaurant.rating = rating
                self.headerView.ratingImageView.image = UIImage(named: rating)
                
                let scaleTransform = CGAffineTransform.init(scaleX: 0.1, y: 0.1)
                self.headerView.ratingImageView.transform = scaleTransform
                self.headerView.ratingImageView.alpha = 0
                
                UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.7, options: [],  animations: {
                    self.headerView.ratingImageView.transform = .identity
                    self.headerView.ratingImageView.alpha = 1
                }, completion: nil)
            }
        })
    }
    
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
        
        
        tableView.contentInsetAdjustmentBehavior = .never
        
        
        // 来源于tableviewde的prepare
        headerView.headerImageView.image = UIImage(named: restaurant.name)
        headerView.nameLabel.text = restaurant.name
        headerView.typeLabel.text = restaurant.type
        headerView.heartImageView.isHidden = restaurant.isVisited ? false : true
        
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super .viewWillAppear(animated)
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.backgroundColor? = UIColor(red: 255.0/255.0, green: 255.0/255.0, blue:255.0/255.0, alpha: 0)
        navigationController?.hidesBarsOnSwipe = false
        navigationController?.setNavigationBarHidden(false, animated: true)
        navigationController?.navigationBar.tintColor = .white
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showMap" {
            let destinationController = segue.destination as! MapViewController
            
            destinationController.restaurant = restaurant
            
        }else if segue.identifier == "showReview" {
            let destinationController = segue.destination as! ReviewViewController
            
            destinationController.restaurant = restaurant
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        print("Detail page will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
//        print("Detail page did disappear")
    }
}
