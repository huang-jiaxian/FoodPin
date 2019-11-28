//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by jia on 2019/11/13.
//  Copyright © 2019 jia. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats And Deli", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]
    
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]
    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
   
    // 记录checkmark
    var restaurantIsVisited = Array(repeating: false, count: 21)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        // largr title
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        
        let cellIdentifier = "datacell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell

        // Configure the cell...
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        cell.thumbnailImageView.image = UIImage(named: restaurantNames[indexPath.row])
        
        if self.restaurantIsVisited[indexPath.row]{
//            cell.accessoryType = .checkmark
            cell.heartImageView.isHidden = false // 显示
        }else{
//            cell.accessoryType = .none
            cell.heartImageView.isHidden = true // 隐藏
        }

        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showRestaurantDetail" {
            if let indexPath = tableView.indexPathForSelectedRow{
                let destinationController = segue.destination as! RestaurantDetailViewController
                destinationController.restaurantImageName = restaurantNames[indexPath.row]
                destinationController.restaurantName = restaurantNames[indexPath.row]
                destinationController.restaurantType = restaurantTypes[indexPath.row]
                destinationController.restaurantLocation = restaurantLocations[indexPath.row]
            }
        }
    }
    
    /*
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //creat an option menu as an action sheet
        let optionMenu = UIAlertController(title: nil, message: "What do you want to do?", preferredStyle: .actionSheet)
        
        // add action to the menu
        let cancelAction  = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        optionMenu.addAction(cancelAction)
        
        // Add Call action
        let callActionHandler = {(action:UIAlertAction!) -> Void in
            
            let alertMessage = UIAlertController(title: "Servicr Unavailable", message: "Sorry,the call feature is not available yet.Please retry later.", preferredStyle: .alert)
            
            alertMessage.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            
            self.present(alertMessage,animated: true,completion: nil);
        }

        let callAction = UIAlertAction(title: "Call " + "123-000-\(indexPath.row)", style: .default, handler: callActionHandler)
        
        optionMenu.addAction(callAction)
        
        // Add Check-in Action
        var title = ""
        if self.restaurantIsVisited[indexPath.row] {
            title = "Undo Check"
        } else {
            title = "Check In"
        }
        let checkInAction = UIAlertAction(title: title, style: .default, handler: {(action:UIAlertAction!) -> Void in
            
            let cell = tableView.cellForRow(at: indexPath) as? RestaurantTableViewCell
            
            
            if self.restaurantIsVisited[indexPath.row] {
                self.restaurantIsVisited[indexPath.row] = false
                cell?.heartImageView.isHidden = true // 隐藏
//                cell?.accessoryType = .none
            } else {
                self.restaurantIsVisited[indexPath.row] = true
                cell?.heartImageView.isHidden = false // 显示
//                cell?.accessoryType = .checkmark
            }
            
            print(self.restaurantIsVisited)
        })
        optionMenu.addAction(checkInAction)
        
        if let popoverController = optionMenu.popoverPresentationController {
            if let cell = tableView.cellForRow(at: indexPath) {
                popoverController.sourceView = cell
                popoverController.sourceRect = cell.bounds
            }
        }
        
        present(optionMenu,animated: true,completion: nil)
        
        // deselect row
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    
    // deletion or insertion
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath){
        
        // if you just delete the row , below code is enough
//        if editingStyle == .delete {
//            restaurantNames.remove(at: indexPath.row)
//            restaurantTypes.remove(at: indexPath.row)
//            restaurantIsVisited.remove(at: indexPath.row)
//            restaurantLocations.remove(at: indexPath.row)
//        }
        
        // table view clear content and reload the data
        // tableView.reloadData()
        
        // just remove the particular row
        // tableView.deleteRows(at: [indexPath], with: .fade)
        
//        print("result:\(restaurantNames)")
    }
    
    // else You need most action in swipe
    override func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {
            (action,sourceView,completionHandler) in
            
            self.restaurantNames.remove(at: indexPath.row)
            self.restaurantTypes.remove(at: indexPath.row)
            self.restaurantIsVisited.remove(at: indexPath.row)
            self.restaurantLocations.remove(at: indexPath.row)
            
            self.tableView.deleteRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        let shareAction = UIContextualAction(style: .normal, title: "Share") {
            (action,sourceView,completionHandler) in
            
            let defaultText = "Just checking in at " + self.restaurantNames[indexPath.row]
            let activityController : UIActivityViewController
            
            if let imageToShare = UIImage(named: self.restaurantNames[indexPath.row]){
                activityController = UIActivityViewController(activityItems: [defaultText,imageToShare], applicationActivities: nil)
            } else {
                activityController = UIActivityViewController(activityItems: [defaultText], applicationActivities: nil)
            }
            
            if let popoverController = activityController.popoverPresentationController {
                if let cell = tableView.cellForRow(at: indexPath) {
                    popoverController.sourceView = cell
                    popoverController.sourceRect = cell.bounds
                }
            }
            
            self.present(activityController,animated: true,completion: nil)
            completionHandler(true)
        }
        
        deleteAction.backgroundColor = UIColor(red: 231.0/255.0, green: 76.0/255.0, blue: 60/255, alpha: 1)
        deleteAction.image = UIImage(named: "delete")
        
        shareAction.backgroundColor = UIColor(red: 254.0/255.0, green: 149.0/255.0, blue: 38/255, alpha: 1)
        shareAction.image = UIImage(named: "share")
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [deleteAction,shareAction])
        return swipeConfiguration
    }
 
    */
    
    override func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let checkInAction = UIContextualAction(style: .normal, title: "") {
            (action,sourceView,completionHandler) in
            
            if self.restaurantIsVisited[indexPath.row] {
                self.restaurantIsVisited[indexPath.row] = false
            } else {
                self.restaurantIsVisited[indexPath.row] = true
            }
            
            self.tableView.reloadRows(at: [indexPath], with: .fade)
            completionHandler(true)
        }
        
        checkInAction.backgroundColor = UIColor(red: 45.0/255.0, green: 161.0/255.0, blue: 82.0/255.0, alpha: 1)
        checkInAction.image = UIImage(named: self.restaurantIsVisited[indexPath.row] ? "tick" : "undo")
        checkInAction.title = self.restaurantIsVisited[indexPath.row] ? "Undo Check" : "Check In"
        
        let swipeConfiguration = UISwipeActionsConfiguration(actions: [checkInAction])
        return swipeConfiguration
    }
    
}
