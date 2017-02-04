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
        let closure:(Double, Double) -> Double? = {
            let result = self.operate(firstNumber: $0, secondNumber: $1)
            return result
        }
        return closure
    }
}
