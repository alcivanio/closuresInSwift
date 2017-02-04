//
//  Operation.swift
//  ClosuresInSwift
//
//  Created by Alcivanio on 1/31/17.
//  Copyright © 2017 Alcivanio. All rights reserved.
//

import UIKit

protocol Operation {
    var operationType:OperationType {get}
    func operate(firstNumber num1:Double, secondNumber num2:Double)->Double?
    func getOperateClosure()->((_ num1: Double, _ num2:Double) -> Double? )
}

enum OperationType {
    
    case Sum, Subtraction, Multiplication, Division
    
    /* A switch for current operation name */
    var name:String {
        switch self {
        case .Sum:
            return Texts.sum
        case .Subtraction:
            return Texts.subtraction
        case .Multiplication:
            return Texts.multiplication
        case .Division:
            return Texts.division
        }
    }
    
    var symbol:String {
        switch self {
        case .Sum:
            return Texts.sumSymbol
        case .Subtraction:
            return Texts.subtractionSymbol
        case .Multiplication:
            return Texts.multiplicationSymbol
        case .Division:
            return Texts.divisionSymbol
        }
    }
}

