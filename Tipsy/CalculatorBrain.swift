//
//  CalculatorBrain.swift
//  Tipsy
//
//  Created by Nikhi on 25/05/20.
//  Copyright © 2020 The App Brewery. All rights reserved.
//

import UIKit


struct CalculatorBrain {
    
    var selectedButton: UIButton?
    var splitStr: String?
    var numPeople: Int?
    
    let tips = ["0%" : 0.0, "10%" : 0.1, "20%" : 0.2]
    
    
    mutating func highlightSelected(_ sender: UIButton) {
        if let button = selectedButton {
            button.isSelected = false
        }
        selectedButton = sender
        sender.isSelected = true
    }
    
    mutating func calculateSplit(totalBill: Double, noOfPersons: Int) -> String {
        self.numPeople = noOfPersons
        let splitPCT = tips[(selectedButton?.currentTitle)!]!
        let totCost = totalBill + totalBill * splitPCT
        let indSplit = totCost / Double(noOfPersons)
        self.splitStr = String(format: "%0.2f", indSplit)
        return self.splitStr!
        
    }
    
    func isTipSelected() -> Bool {
        if selectedButton != nil {
            return true
        }
        return false
    }
    
    func getSetting() -> String {
        return "Split between \(numPeople!) people, with \((selectedButton?.currentTitle)!) tip."
    }
    
    
}
