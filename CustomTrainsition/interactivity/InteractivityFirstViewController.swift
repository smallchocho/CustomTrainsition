//
//  InteractivityAnimationViewController.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/12.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import UIKit

class InteractivityFirstViewController: UIViewController {
    
    lazy var interactivitySecondViewController: InteractivitySecondViewController = InteractivitySecondViewController()
    lazy var customTransitionDelegate: InteractivityAnimationDelegate = InteractivityAnimationDelegate()
    lazy var interactiveTransitionRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(interactiveTransitionRecognizerAction(sender:)))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// 添加滑动交互手势
        self.view.addGestureRecognizer(interactiveTransitionRecognizer)
        self.view.backgroundColor = UIColor.blue
        /// 设置动画代理
        interactivitySecondViewController.customTransitionDelegate = customTransitionDelegate
        interactivitySecondViewController.transitioningDelegate = customTransitionDelegate
        interactivitySecondViewController.modalPresentationStyle = .fullScreen
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

extension InteractivityFirstViewController {
    @objc func animationButtonDidClicked(_ sender: Any) {
        if let _ =  sender as? UIGestureRecognizer {
            customTransitionDelegate.gestureRecognizer = interactiveTransitionRecognizer
            customTransitionDelegate.direction = UIPanGestureRecognizerDirection.leftToRight
        }
        else {
            customTransitionDelegate.gestureRecognizer = nil
        }
        guard self.presentedViewController == nil else{return}
        self.present(interactivitySecondViewController, animated: true, completion: nil)
    }
    
    @objc func interactiveTransitionRecognizerAction(sender: UIPanGestureRecognizer) {
        if sender.state != .began { return }
        if sender.direction != .leftToRight { return }
        self.animationButtonDidClicked(sender)
    }
    
}


