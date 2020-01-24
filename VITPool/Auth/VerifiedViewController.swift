//
//  VerifiedViewController.swift
//  VITPool
//
//  Created by ANKIT YADAV on 24/01/20.
//  Copyright © 2020 ANKIT YADAV. All rights reserved.
//

import UIKit

class VerifiedViewController: UIViewController {

    @IBOutlet weak var GIFView: UIImageView!
    @IBOutlet weak var continueBttn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIFView.loadGif(name:"Verified")
        continueBttn.layer.cornerRadius = 15
    }

}
