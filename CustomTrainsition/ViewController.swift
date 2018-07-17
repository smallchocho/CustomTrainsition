//
//  ViewController.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/11.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presentVC()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    private func presentVC(){
        guard let vc = UIStoryboard(name: "InteractivityFirstViewController", bundle: nil).instantiateInitialViewController() else{return}
        self.present(vc, animated: true, completion: nil)
    }
}

