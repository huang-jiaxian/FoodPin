//
//  ReviewViewController.swift
//  FoodPin
//
//  Created by jia on 2020/1/13.
//  Copyright © 2020 jia. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController {
    
    @IBOutlet var backgroundImageView: UIImageView!
    @IBOutlet var rateButtons: [UIButton]!
    
    var restaurant = Restaurant()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        backgroundImageView.image = UIImage(named: restaurant.name)

        // Do any additional setup after loading the view.
        // applying the blur effect
        let blurEffect = UIBlurEffect(style: .light)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        backgroundImageView.addSubview(blurEffectView)
        
        // set the icon transparent
        for rateButton in rateButtons {
            rateButton.alpha = 0
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        UIView.animate(withDuration: 2.0, animations: {
//            for rateButton in self.rateButtons {
//                rateButton.alpha = 1.0
//            }
//        })
        var delay = 0.1
        for rateButton in rateButtons {
            UIView.animate(withDuration: 1, delay: delay, options: [], animations: {
                rateButton.alpha = 1.0
                delay += 0.05;
            }, completion: nil)
            print(delay)
        }
//        UIView.animate(withDuration: 0.4, delay: 0.1, options: [], animations: {
//            self.rateButtons[0].alpha = 1.0
//        }, completion: nil)
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
