//
//  InteractivityAnimationDelegate.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/12.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import UIKit
class InteractivityAnimationDelegate:NSObject,UIViewControllerTransitioningDelegate{
    var gestureRecognizer: UIScreenEdgePanGestureRecognizer? = nil
    var targetEdge: UIRectEdge = .all
//    var direction:UIPanGestureRecognizerDirection?
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomAnimator()
    }
    
        
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomAnimator()
    }
    
    
    
    func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let gesture = gestureRecognizer else{ return nil }
//        guard let dir = self.direction else { return nil }
        return TransitionInteractionController(gestureRecognizer: gesture, edge: self.targetEdge)
    }
    
    func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        guard let gesture = gestureRecognizer else{ return nil }
//        guard let dir = self.direction else { return nil }
        return TransitionInteractionController(gestureRecognizer: gesture, edge: self.targetEdge)
    }
    

}
