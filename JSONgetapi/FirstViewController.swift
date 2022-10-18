//
//  ViewController.swift
//  JSONgetapi
//
//  Created by Sadia on 17/10/22.
//

import UIKit

class FirstViewController: UIViewController {

   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func apiCall(_ sender: UIButton) {
        self.performSegue(withIdentifier: "FirstPageIdentifier", sender: self)
    }
    
}

