//
//  SumOperation.swift
//  ClosuresInSwift
//
//  Created by Alcivanio on 1/31/17.
//  Copyright © 2017 Alcivanio. All rights reserved.
//

import UIKit

class SumOperation: Operation {
    
    var operationType = OperationType.Sum
    
    func operate(firstNumber num1: Double, secondNumber num2: Double) -> Double? {
        let sumResult = num1 + num2
        return sumResult
    }
    
    func getOperateClosure() -> ((Double, Double) -> Double?) {
        let closure = {(num1: Double, num2: Double) -> Double? in
            let result = self.operate(firstNumber: num1, secondNumber: num2)
            return result
        }
        return closure
    }
}
