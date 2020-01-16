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
    @IBOutlet var closeButton: UIButton!
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
        let scaleUpTransform = CGAffineTransform.init(scaleX: 2.0, y: 2.0)
        let moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        
        // make the buttons invisible and move to right
        for rateButton in rateButtons {
            rateButton.alpha = 0
            rateButton.transform = moveScaleTransform
        }
        
        let moveTopTransform = CGAffineTransform(translationX: 0, y: -300)
        closeButton.transform = moveTopTransform
        
        
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
//            UIView.animate(withDuration: 1, delay: delay, options: [.repeat, .autoreverse], animations
//                : {
//                rateButton.alpha = 1.0
//                rateButton.transform = .identity
//                delay += 0.05;
//            }, completion: nil)
//            print(delay)
            UIView.animate(withDuration: 1, delay: 0.1, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
                rateButton.alpha = 1.0
                rateButton.transform = .identity
                delay += 0.05;
            }, completion: nil)

            // spring animation
//            UIView.animate(withDuration: 1, delay: delay, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
//                rateButton.alpha = 1.0
//                rateButton.transform = .identity
//                delay += 0.05;
//            })
        }
        UIView.animate(withDuration: 0.5, delay: 0, options: [], animations: {
            self.closeButton.transform = .identity
        }, completion: nil)
    }
}
