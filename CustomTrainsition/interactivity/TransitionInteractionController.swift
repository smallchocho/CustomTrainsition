//
//  TransitionInteractiveController.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/12.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import UIKit

class TransitionInteractionController:UIPercentDrivenInteractiveTransition{
    var transitionContext: UIViewControllerContextTransitioning? = nil
    var gestureRecognizer: UIScreenEdgePanGestureRecognizer
    var edge: UIRectEdge
//    var direction:
    init(gestureRecognizer: UIScreenEdgePanGestureRecognizer,edge:UIRectEdge) {
//        assert( direction == .bottomToTop || direction == .topToBottom || direction == .rightToLeft || direction == .leftToRight,
//               "edgeForDragging must be one of UIRectEdgeTop, UIRectEdgeBottom, UIRectEdgeLeft, or UIRectEdgeRight.")
        self.gestureRecognizer = gestureRecognizer
        self.edge = edge
//        self.direction = dir
        super.init()
        self.gestureRecognizer.addTarget(self, action: #selector(gestureRecognizeDidUpdate))
    }
    
    
    override func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        self.transitionContext = transitionContext
        super.startInteractiveTransition(transitionContext)
        
    }

    private func percentForGesture(gesture: UIPanGestureRecognizer) -> CGFloat {
        guard let transitionContainerView = transitionContext?.containerView else{ return 0}
        let locationInSourceView = gesture.location(in: transitionContainerView)
        
        let width = transitionContainerView.bounds.width
        let height = transitionContainerView.bounds.height
        
        switch self.edge {
        case UIRectEdge.right: return (width - locationInSourceView.x) / width
        case UIRectEdge.left: return locationInSourceView.x / width
        case UIRectEdge.bottom: return (height - locationInSourceView.y) / height
        case UIRectEdge.top: return locationInSourceView.y / height
        default: return 0
//        switch self.direction {
//        case UIPanGestureRecognizerDirection.leftToRight: return (width - locationInSourceView.x) / width
//        case UIPanGestureRecognizerDirection.rightToLeft: return locationInSourceView.x / width
//        case UIPanGestureRecognizerDirection.topToBottom: return (height - locationInSourceView.y) / height
//        case UIPanGestureRecognizerDirection.bottomToTop: return locationInSourceView.y / height
//        default: return 0
        }
    }


    @objc func gestureRecognizeDidUpdate(gestureRecognizer: UIScreenEdgePanGestureRecognizer) {
        switch gestureRecognizer.state {
        case .began:
            break
        case .changed:
            self.update(
                self.percentForGesture(gesture: gestureRecognizer)
        )  //手势滑动，更新百分比
        case .ended:    // 滑动结束，判断是否超过一半，如果是则完成剩下的动画，否则取消动画
            if self.percentForGesture(gesture: gestureRecognizer) >= 0.5 {
                self.finish()
            }
            else {
                self.cancel()
            }
        default:
            self.cancel()
        }
    }
    
}
