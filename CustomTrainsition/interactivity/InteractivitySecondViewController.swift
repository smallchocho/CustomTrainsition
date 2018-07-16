//
//  InteractivitySecondViewController.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/12.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import UIKit

class InteractivitySecondViewController: UIViewController {
    
    var customTransitionDelegate: InteractivityAnimationDelegate!
    lazy var interactiveTransitionRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(interactiveTransitionRecognizerAction(sender:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(interactiveTransitionRecognizer)
        self.view.backgroundColor = UIColor.brown
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let button = UIButton()
        button.frame.size = CGSize(width: 100, height: 100)
        button.center = self.view.center
        button.addTarget(self, action: #selector(animationButtonDidClicked), for: .touchUpInside)
        button.backgroundColor = .black
        self.view.addSubview(button)
    }
    
}
extension InteractivitySecondViewController{
    @objc func animationButtonDidClicked(_ sender: Any) {
        if let _ =  sender as? UIGestureRecognizer {
            customTransitionDelegate.gestureRecognizer = interactiveTransitionRecognizer
            customTransitionDelegate.direction = UIPanGestureRecognizerDirection.leftToRight
        }
        else {
            customTransitionDelegate.gestureRecognizer = nil
        }
        guard self.presentingViewController != nil else{ return }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func interactiveTransitionRecognizerAction(sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state != .began { return }
        if sender.direction != .leftToRight { return }
        self.animationButtonDidClicked(sender)
        
    }
}
