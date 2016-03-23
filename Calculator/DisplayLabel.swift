//
//  DisplayLabel.swift
//  Calculator
//
//  Created by sodas on 2/28/16.
//  Copyright © 2016 sodas. All rights reserved.
//

import UIKit

class DisplayLabel: UILabel {

    // MARK: - Value

    var floatValue: Float {
        get {
            if let text = self.text {
                return Float(text)!
            } else {
                return 0.0
            }
        }
        set(newValue) {
            self.text = (newValue as NSNumber).stringValue
        }
    }

    func clear() {
        self.floatValue = 0.0
    }

    func append(digit: Int) {
        if let text = self.text where text != "0" {
            self.text = text + "\(digit)"
        } else {
            self.text = (digit as NSNumber).stringValue
        }
    }

    // MARK: - Negative

    var negative: Bool {
        if let text = self.text {
            return text.hasPrefix("-")
        } else {
            return false
        }
    }

    func changeSign() {
        guard let text = self.text else {
            return
        }
        self.text = self.negative ? text.substringFromIndex(text.startIndex.advancedBy(1)) : "-" + text
    }
    func dot(){
        if self.text!.containsString("."){
             self.text = self.text
        }else{
            self.text = self.text! + "."
        }
    }
    func dive100(){
        var value = (self.text! as NSString).floatValue
        value = (value/100)
        self.text = "\(value)"
    }
}
