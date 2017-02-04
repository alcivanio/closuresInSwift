//
//  Texts.swift
//  ClosuresInSwift
//
//  Created by Alcivanio on 1/31/17.
//  Copyright © 2017 Alcivanio. All rights reserved.
//

import UIKit

class Texts: NSObject {
    
    //operations names
    static let sum              = "Addition"
    static let subtraction      = "Subtraction"
    static let multiplication   = "Multiplication"
    static let division         = "Division"
    
    //operations symbols
    static let sumSymbol            = "+"
    static let subtractionSymbol    = "-"
    static let multiplicationSymbol = "x"
    static let divisionSymbol       = "÷"
    
    //erros descriptions
    static let defaultOperationError    = "An operation error ocurred"
    static let defaultFieldsError       = "Type one number value in each field"
    static let blankField               = "You have to fill all fields"
    static let notNumberText            = "Just numbers are accepted"
    
    //ok, let's also show a good message, right?
    static let defaultSuccessMessage    = "All done! :)"
    static let lastResult               = "Last result:"
    static let done = "Pronto"
}
