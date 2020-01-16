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
        
        // 初始化的时候x轴偏移600
        let moveRightTransform = CGAffineTransform.init(translationX: 600, y: 0)
        // 初始化的时候2倍大
        let scaleUpTransform = CGAffineTransform.init(scaleX: 2.0, y: 2.0)
        // 旋转
        let rotationTransform = CGAffineTransform.init(rotationAngle: 20)
        // 结合两种动画效果，最后return一种
        var moveScaleTransform = scaleUpTransform.concatenating(moveRightTransform)
        moveScaleTransform = moveScaleTransform.concatenating(rotationTransform)
        
        // make the buttons invisible and move to right
        for rateButton in rateButtons {
            rateButton.alpha = 0
            rateButton.transform = moveScaleTransform
        }
        
        let moveTopTransform = CGAffineTransform(translationX: 0, y: -300)
        closeButton.transform = moveTopTransform
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        print("rate page will appear")
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
            UIView.animate(withDuration: 1, delay: delay, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: [], animations: {
                rateButton.alpha = 1.0
                rateButton.transform = .identity
                delay += 0.1;
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
    
    override func viewWillDisappear(_ animated: Bool) {
        print("rate page will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("rate page did disappear")
    }
}
