//
//  CalculatorLogic.swift
//  Calculator
//
//  Created by Santos, Rafael Costa on 08/02/2023.
//  Copyright © 2023 London App Brewery. All rights reserved.
//

import Foundation

struct CalculatorLogic {
    private var number: Double?
    private var intermediateCalculation: (value: Double, symbol: String)?
    
    mutating func set(number: Double) {
        self.number = number
    }
    
    mutating func calculate(symbol: String) -> Double? {
        if let number = number {
            switch symbol {
            case "+/-": return number * -1
            case "AC": return 0
            case "%": return number * 0.01
            case "=": return performTwoNumCalculation(number)
            default: self.intermediateCalculation = (value: number, symbol: symbol)
            }
        }
        return nil
    }
    
    func performTwoNumCalculation(_ n2: Double) -> Double? {
        guard let n1 = intermediateCalculation?.value,  let operation = intermediateCalculation?.symbol else { return nil }
        switch operation {
        case "+": return n1 + n2
        case "-": return n1 - n2
        case "×": return n1 * n2
        case "÷": return n1 / n2
        default: fatalError("The operation passed in does not match any of the cases.")
        }
    }
}
