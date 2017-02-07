//
//  InformValuesViewController.swift
//  ClosuresInSwift
//
//  Created by Alcivanio on 2/1/17.
//  Copyright © 2017 Alcivanio. All rights reserved.
//

import UIKit

var captures = 0

class InformValuesViewController: UIViewController {
    
    
    @IBOutlet weak var errorDescription: UILabel!
    @IBOutlet weak var textField1: UITextField!
    @IBOutlet weak var textField2: UITextField!
    
    @IBOutlet weak var resultOpDescription: UILabel!
    @IBOutlet weak var resultOperationValue: UILabel!
    
    var operate: ((Double, Double)->(Double?))?
    var updateLastValue: ((Double)->Void)?

    override func viewDidLoad() {
        super.viewDidLoad()
        captures += 1
        print("Telas ativas: \(captures)")
        setAdjustments()
    }
    
    deinit {
        captures -= 1
    }
    
    @IBAction func calculateAction(_ sender: UIBarButtonItem) {
        let fieldsValidation = validateFields()
        if !fieldsValidation.validated {
            showError(message: fieldsValidation.message!)
        }
        
        else {
            let numberField1 = textField1.text?.convertToDouble() ?? 0.0
            let numberField2 = textField2.text?.convertToDouble() ?? 0.0
            
            if let resultOperation = operate!(numberField1, numberField2) {
                showResult(resultOperation)
                updateLastValue!(resultOperation)
            }
            else {
                showError(message: Texts.defaultOperationError)
            }
            
        }
    }
    
    private func setAdjustments() {
        resultOpDescription.isHidden    = true
        resultOperationValue.isHidden   = true
        self.navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    
    private func validateFields()->(validated:Bool, message:String?) {
        var resMessage: String?
        var resValidated = false
        
        if textField1.text == "" || textField2.text == "" {
            resValidated = false
            resMessage = Texts.blankField
            return (resValidated, resMessage)
        }
        
        let tf1IsNumber = textField1.text?.convertToDouble() != nil
        let tf2IsNumber = textField2.text?.convertToDouble() != nil
        
        if !tf1IsNumber || !tf2IsNumber {
            resValidated    = false
            resMessage      = Texts.notNumberText
            return (resValidated, resMessage)
        }
        
        resValidated    = true
        resMessage      = Texts.defaultSuccessMessage
        return (resValidated, resMessage)
    }
    
    private func showError(message: String) {
        errorDescription.isHidden   = false
        errorDescription.text       = message
    }
    
    fileprivate func hideError() {
        errorDescription.isHidden   = true
        errorDescription.text       = ""
    }
    
    private func showResult(_ operationResult: Double) {
        resultOpDescription.isHidden    = false
        resultOperationValue.isHidden   = false
        
        resultOperationValue.text   = "\(operationResult)"
    }
    

}




extension InformValuesViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        hideError()
        return true
    }
}







