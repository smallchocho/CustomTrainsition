//
//  FirstViewController.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/11.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController {
    let vc = SecondViewController()
    override func viewDidLoad() {
        super.viewDidLoad()
        vc.transitioningDelegate = self
        vc.modalPresentationStyle = .fullScreen
        self.view.backgroundColor = UIColor.green
        
        
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
        self.present(vc, animated: true, completion: nil)
    }
}
extension FirstViewController:UIViewControllerTransitioningDelegate{
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomAnimator()
    }
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return CustomAnimator()
    }
}
