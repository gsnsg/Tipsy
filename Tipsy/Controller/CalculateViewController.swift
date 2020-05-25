//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculateViewController: UIViewController {

    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPCTButton: UIButton!
    @IBOutlet weak var tenPCTButton: UIButton!
    @IBOutlet weak var twentyPCTButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
   

    var calculator = CalculatorBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func tipChanged(_ sender: UIButton) {
        calculator.highlightSelected(sender)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLabel.text = String(format: "%.0f", sender.value)
        
        
    }
    @IBAction func calculatePressed(_ sender: UIButton) {
        if billTextField.text!.count != 0 && calculator.isTipSelected() {
            performSegue(withIdentifier: "goToResult", sender: self)

        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destination = segue.destination as! ResultViewController
            let totBill = Double(billTextField.text!)!
            let numPersons = Int(splitNumberLabel.text!)!
            destination.label = calculator.calculateSplit(totalBill: totBill, noOfPersons: numPersons)
            destination.setting = calculator.getSetting()

        }
    }
        
        
    

}

