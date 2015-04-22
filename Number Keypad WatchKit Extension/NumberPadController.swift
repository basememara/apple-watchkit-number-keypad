//
//  NumberPadController.swift
//  Unit Converter
//
//  Created by Basem Emara on 4/8/15.
//  Copyright (c) 2015 Zamzam. All rights reserved.
//

import WatchKit
import Foundation

class NumberPadController: WKInterfaceController {
    
    var sourceController: InterfaceController!
    var isDecimalAppended = false
    var isPointZeroAppended = false

    @IBOutlet var amountLabel: WKInterfaceLabel!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        sourceController = context as! InterfaceController
        amountLabel.setText("\(sourceController.getDisplayAmount(sourceController.amount))")
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

    func appendValue(value: Int) {
        let newValue = "\(value)"
        var currentValue = sourceController.getDisplayAmount(sourceController.amount, round: false)
        
        // Handle appending new number
        if currentValue == "0" && !isDecimalAppended {
            // New start of entry
            currentValue = newValue
        }
        else {
            // Handle point zero because of rounding
            if isPointZeroAppended {
                currentValue += currentValue.rangeOfString(".") != nil
                    ? "0" : ".0"
                isPointZeroAppended = false
            }
            
            // Handle intended decimal if applicable
            if isDecimalAppended {
                currentValue += "."
                isDecimalAppended = false
            }
            
            // Handle point zero because of rounding
            if value == 0 && currentValue.rangeOfString(".") != nil {
                isPointZeroAppended = true
            }
            
            // Concatenate intended value
            currentValue += newValue
        }
        
        sourceController.amount = (currentValue as NSString).doubleValue
        amountLabel.setText(currentValue)
    }

    @IBAction func clearTapped() {
        sourceController.amount = 0.0
        amountLabel.setText("0")
        isDecimalAppended = false
    }

    @IBAction func positiveNegativeTapped() {
        sourceController.amount = sourceController.amount * -1
        amountLabel.setText("\(sourceController.getDisplayAmount(sourceController.amount))")
    }

    @IBAction func decimalTapped() {
        var currentValue = sourceController.getDisplayAmount(sourceController.amount)
        
        if currentValue.rangeOfString(".") == nil {
            currentValue += "."
            amountLabel.setText(currentValue)
            isDecimalAppended = true
        }
    }

    @IBAction func oneTapped() {
        appendValue(1)
    }

    @IBAction func twoTapped() {
        appendValue(2)
    }

    @IBAction func threeTapped() {
        appendValue(3)
    }

    @IBAction func fourTapped() {
        appendValue(4)
    }

    @IBAction func fiveTapped() {
        appendValue(5)
    }

    @IBAction func sixTapped() {
        appendValue(6)
    }

    @IBAction func sevenTapped() {
        appendValue(7)
    }

    @IBAction func eightTapped() {
        appendValue(8)
    }

    @IBAction func nineTapped() {
        appendValue(9)
    }

    @IBAction func zeroTapped() {
        appendValue(0)
    }
    
}
