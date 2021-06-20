//
//  ViewController.swift
//  PorUlagam
//
//  Created by Satish Narasimhan on 9/25/17.
//  Copyright © 2017 SatishNarasimhan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var rightimageview: UIImageView!
    @IBOutlet weak var rightscorelabel: UILabel!
    
    @IBOutlet weak var leftimageview: UIImageView!
    @IBOutlet weak var leftscorelabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    @IBAction func dealtapped(_ sender: UIButton) {
    }
    
}

