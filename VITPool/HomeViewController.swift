//
//  HomeViewController.swift
//  VITPool
//
//  Created by ANKIT YADAV on 24/01/20.
//  Copyright © 2020 ANKIT YADAV. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var GifView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GifView.loadGif(name: "congrats")
    }

}
