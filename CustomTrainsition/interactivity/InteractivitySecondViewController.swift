//
//  InteractivitySecondViewController.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/12.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import UIKit

class InteractivitySecondViewController: UIViewController {
    
    
    lazy var interactiveTransitionRecognizer: UIScreenEdgePanGestureRecognizer = UIScreenEdgePanGestureRecognizer.init(target: self, action: #selector(interactiveTransitionRecognizerAction))
    weak var customTransitionDelegate: InteractivityAnimationDelegate!
    override func viewDidLoad() {
        super.viewDidLoad()
        interactiveTransitionRecognizer.edges = .right
        self.view.addGestureRecognizer(interactiveTransitionRecognizer)
        self.view.backgroundColor = UIColor.brown
        // Do any additional setup after loading the view.
    }

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let button = UIButton()
        button.frame.size = CGSize(width: 100, height: 100)
        button.center = self.view.center
        button.addTarget(self, action: #selector(onClickedTrainsitionButton), for: .touchUpInside)
        button.backgroundColor = .black
        self.view.addSubview(button)
    }
    
    @objc func onClickedTrainsitionButton(_ sender:UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @objc func interactiveTransitionRecognizerAction(sender: UIScreenEdgePanGestureRecognizer) {
        /**
         *  在开始触发手势时，调用animationButtonDidClicked方法，只会调用一次
         */
        if sender.state == .began {
            self.animationButtonDidClicked(sender: sender)
        }
    }
    /**
     这个函数可以在按钮点击时触发，也可以在手势滑动时被触发，通过sender的类型来判断具体是那种情况
     如果是通过滑动手势触发，则需要设置customTransitionDelegate的gestureRecognizer属性
     
     :param: sender 事件的发送者，可能是button，也有可能是手势
     */
    func animationButtonDidClicked(sender: AnyObject) {
        if let _ =  sender as? UIGestureRecognizer {
            customTransitionDelegate.gestureRecognizer = interactiveTransitionRecognizer
        }
        else {
            customTransitionDelegate.gestureRecognizer = nil
        }
        /// 设置targetEdge为右边，也就是检测从右边向左滑动的手势
        customTransitionDelegate.targetEdge = .right
        self.dismiss(animated: true, completion: nil)
    }
    

}
