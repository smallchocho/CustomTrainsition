//
//  InteractivitySecondViewController.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/12.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import UIKit

class InteractivitySecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
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
    

    

}
