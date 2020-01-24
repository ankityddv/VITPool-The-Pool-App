//
//  ViewController.swift
//  VITPool
//
//  Created by ANKIT YADAV on 24/01/20.
//  Copyright © 2020 ANKIT YADAV. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var continueBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add cornerRadius to logo ImageView
        logoImageView.layer.cornerRadius = 16
        //add cornerRadius to continue Button
        continueBttn.layer.cornerRadius = 15
    }


}

