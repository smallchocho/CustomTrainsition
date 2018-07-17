//
//  InteractivitySecondViewController.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/12.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//


import UIKit

class InteractivitySecondViewController: UIViewController {
    
    
    @IBOutlet weak var backToFromVCButton: UIButton!{
        didSet{
            backToFromVCButton.addTarget(self, action: #selector(animationButtonDidClicked), for: .touchUpInside)
        }
    }
    
    var customTransitionDelegate: InteractivityAnimationDelegate!
    lazy var interactiveTransitionRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(interactiveTransitionRecognizerAction(sender:)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addGestureRecognizer(interactiveTransitionRecognizer)
        // Do any additional setup after loading the view.
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
}
extension InteractivitySecondViewController{
    @objc func animationButtonDidClicked(_ sender: Any) {
        if let _ =  sender as? UIGestureRecognizer {
            customTransitionDelegate.gestureRecognizer = interactiveTransitionRecognizer
            customTransitionDelegate.direction = UIPanGestureRecognizerDirection.topToBottom
        }
        else {
            customTransitionDelegate.gestureRecognizer = nil
        }
        guard self.presentingViewController != nil else{ return }
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func interactiveTransitionRecognizerAction(sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state != .began { return }
        if sender.direction != .topToBottom { return }
        self.animationButtonDidClicked(sender)
        
    }
}
