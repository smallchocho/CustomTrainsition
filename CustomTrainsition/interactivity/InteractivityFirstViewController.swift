//
//  InteractivityAnimationViewController.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/12.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import UIKit

class InteractivityFirstViewController: UIViewController {
    
    @IBOutlet weak var presentButton: UIButton!{
        didSet{
            presentButton.addTarget(self, action: #selector(animationButtonDidClicked), for: .touchUpInside)
        }
    }
    
    var interactivitySecondViewController: InteractivitySecondViewController{
        let vc = UIStoryboard(name: "InteractivitySecondViewController", bundle: nil).instantiateInitialViewController() as! InteractivitySecondViewController
        vc.customTransitionDelegate = customTransitionDelegate
        vc.transitioningDelegate = customTransitionDelegate
        vc.modalPresentationStyle = .fullScreen
        return vc
    }
    lazy var customTransitionDelegate: InteractivityAnimationDelegate = InteractivityAnimationDelegate()
    lazy var interactiveTransitionRecognizer: UIPanGestureRecognizer = UIPanGestureRecognizer.init(target: self, action: #selector(interactiveTransitionRecognizerAction(sender:)))
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self.view.addGestureRecognizer(interactiveTransitionRecognizer)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }

}

extension InteractivityFirstViewController {
    @objc func animationButtonDidClicked(_ sender: Any) {
        if let _ =  sender as? UIGestureRecognizer {
            customTransitionDelegate.gestureRecognizer = interactiveTransitionRecognizer
            customTransitionDelegate.direction = UIPanGestureRecognizerDirection.topToBottom
        }
        else {
            customTransitionDelegate.gestureRecognizer = nil
        }
        guard self.presentedViewController == nil else{return}
        self.present(interactivitySecondViewController, animated: true, completion: nil)
    }
    
    @objc func interactiveTransitionRecognizerAction(sender: UIPanGestureRecognizer) {
        if sender.state != .began { return }
        if sender.direction != .topToBottom { return }
        self.animationButtonDidClicked(sender)
    }
    
}


