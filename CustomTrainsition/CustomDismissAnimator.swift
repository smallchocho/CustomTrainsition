//
//  CustomDismissAnimator.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/17.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import UIKit
class CustomDismissAnimator:NSObject,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toVC = transitionContext.viewController(forKey: .to) else { return }
        guard let fromView = transitionContext.view(forKey: .from) else{ return }
        guard let toView = transitionContext.view(forKey: .to) else{ return }
        let containerView = transitionContext.containerView
        containerView.insertSubview(toView, belowSubview: fromView)
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            fromView.alpha = 1.0
            var finalFrame = fromView.frame
            finalFrame.origin.y = fromView.frame.height/2
            fromView.frame = finalFrame
            
        }) { (finished:Bool) in
            let wasCanceled = transitionContext.transitionWasCancelled
//            if wasCanceled{ toView.removeFromSuperview() }
            transitionContext.completeTransition(!wasCanceled)
        }
    }
    
    
}
