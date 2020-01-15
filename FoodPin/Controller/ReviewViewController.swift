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
        
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        
        // make the buttons invisible and move to right
        for rateButton in rateButtons {
            rateButton.alpha = 0
            rateButton.transform = moveRightTransform
        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
//        UIView.animate(withDuration: 2.0, animations: {
//            for rateButton in self.rateButtons {
//                rateButton.alpha = 1.0
//            }
//        })
        // fade-in animation
        var delay = 0.1
        for rateButton in rateButtons {
            UIView.animate(withDuration: 1, delay: delay, options: [], animations
                : {
                rateButton.alpha = 1.0
                    rateButton.transform = .identity
                delay += 0.05;
            }, completion: nil)
            print(delay)
        }

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
