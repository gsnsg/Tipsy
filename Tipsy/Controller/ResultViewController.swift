//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Nikhi on 25/05/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingLabel: UILabel!
    
    var label: String?
    var setting: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = label!
        settingLabel.text = setting!
    }
    
    @IBAction func reCalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    

}
