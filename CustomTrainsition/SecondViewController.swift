//
//  SecondViewController.swift
//  CustomTrainsition
//
//  Created by 黃聖傑 on 2018/7/11.
//  Copyright © 2018年 seaFoodBon. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.red
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
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func onClickedTrainsitionButton(_ sender:UIButton){
        self.dismiss(animated: true, completion: nil)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
