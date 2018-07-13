//
//  CustomAnimator.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/11.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import Foundation
import UIKit
class CustomAnimator:NSObject,UIViewControllerAnimatedTransitioning{
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromVC = transitionContext.viewController(forKey: .from)
        let toVC = transitionContext.viewController(forKey: .to)
        let fromView = transitionContext.view(forKey: .from)
        let toView = transitionContext.view(forKey: .to)
        let containerView = transitionContext.containerView
        toView?.frame = CGRect(x: fromView!.frame.origin.x, y: fromView!.frame.maxY / 2, width: fromView!.frame.width, height: fromView!.frame.height)
//      toView?.alpha = 0.0
        containerView.addSubview(toView!)
        let duration = self.transitionDuration(using: transitionContext)
        UIView.animate(withDuration: duration, delay: 0, options: .curveLinear, animations: {
            toView?.alpha = 1.0
            toView?.frame = transitionContext.finalFrame(for: toVC!)
        }) { (finished:Bool) in
            let wasCanceled = transitionContext.transitionWasCancelled
            transitionContext.completeTransition(!wasCanceled)
        }
    }
    
    
}
