//
//  InterfaceController.swift
//  Number Keypad WatchKit Extension
//
//  Created by Basem Emara on 4/22/15.
//  Copyright (c) 2015 Zamzam. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {
    
    var amount = Double(0)
    
    @IBOutlet var amountLabel: WKInterfaceLabel!
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        loadData()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    func loadData() {
        amountLabel.setText(getDisplayAmount(amount))
    }
    
    func getDisplayAmount(value: Double, round: Bool = true) -> String {
        // Truncate decimal if whole number
        return value % 1 == 0
            ? "\(Int(value))"
            : (round ? String(format: "%.5f", value) : "\(value)")
    }

    @IBAction func buttonTapped() {
        // Redirect to number pad
        self.presentControllerWithName("numberPadController", context: self)
    }
}
