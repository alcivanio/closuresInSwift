//
//  DivisionOperation.swift
//  ClosuresInSwift
//
//  Created by Alcivanio on 1/31/17.
//  Copyright © 2017 Alcivanio. All rights reserved.
//

import UIKit

class DivisionOperation: Operation {
    
    var operationType = OperationType.Division
    
    func operate(firstNumber num1: Double, secondNumber num2: Double) -> Double? {
        let sumResult = num1 / num2
        return sumResult
    }
    
    func getOperateClosure() -> ((Double, Double) -> Double?) {
        /*
            Write down a closure that receives two Double(s) and return an optional double.
            On the closure body call the method self.operate, it will do all the math work for you and will return to you the value.
            Return the closure you wrote.
         
         
            Remember the closure syntax:
            
            { (PARAMS) -> RETURN in
         
            }
         
         */

    }
}

















































/*func getOperateClosure() -> ((Double, Double) -> Double?) {
 let closure = {(num1: Double, num2: Double) -> Double? in
 let result = self.operate(firstNumber: num1, secondNumber: num2)
 return result
 }
 return closure
 }*/
