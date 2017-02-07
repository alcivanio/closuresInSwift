//
//  ViewController.swift
//  ClosuresInSwift
//
//  Created by Alcivanio on 1/31/17.
//  Copyright © 2017 Alcivanio. All rights reserved.
//

import UIKit

class MainMenuViewController: UIViewController {
    
    let OPERATIONS_TO_INFORM_VALUE_SEGUE = "OPERATIONS_TO_INFORM_VALUE"
    
    @IBOutlet var lastResultLabel: UILabel!
    @IBOutlet var operationsTable: UITableView!
    var operations = [Operation]()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        setOperations()
    }
    
    private func setOperations() {
        let sum             = SumOperation()
        let subtraction     = SubtractionOperation()
        let multiplication  = MultiplicationOperation()
        let division        = DivisionOperation()
        
        operations.append(sum)
        operations.append(subtraction)
        operations.append(multiplication)
        operations.append(division)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setAdjustments()
    }
    
    private func setAdjustments() {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier! {
            
        case OPERATIONS_TO_INFORM_VALUE_SEGUE:
            let currentOperationIndex   = operationsTable.indexPathForSelectedRow?.row ?? 0
            let currentOperation        = operations[currentOperationIndex]
            let controller              = segue.destination  as! InformValuesViewController
            controller.operate          = currentOperation.getOperateClosure()
            controller.updateLastValue  = self.getUpdateLastResultClosure()
            controller.title            = currentOperation.operationType.name
            
        default:
            print("An unknown segue was called")
        }
    }
    
    /*private func getUpdateLastResultClosure()->((Double)->Void) {
     
        /*
            Write down a closure that receives a double value and show it on the screen and then return the closure.
            Remember to set the self.lastResultLabel.isHidden value to false. (We wanna show it!)
            Write it in this format: Texts.lastResult + " " + theReceivedValue

        */
    }*/
    
    private func getUpdateLastResultClosure()->((Double)->Void) {
        let closure = {[unowned self] (lastValue: Double) in
            self.lastResultLabel.isHidden   = false
            self.lastResultLabel.text       = "\(Texts.lastResult) \(lastValue)"
        }
        
        return closure
    }
}





extension MainMenuViewController: UITableViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: OPERATIONS_TO_INFORM_VALUE_SEGUE, sender: nil)
        tableView.deselectSelectedRow()
    }
}





extension MainMenuViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return operations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let OPERATION_CELL_ID = "OPERATION_CELL"
        
        let cIndex          = indexPath.row
        let cOperation      = operations[cIndex]
        let operationInfo   = OperationInfo(operation: cOperation)
        let cCell           = tableView.dequeueReusableCell(withIdentifier: OPERATION_CELL_ID,
                              for: indexPath) as! OperationsTableViewCell
        
        cCell.fillWithInfo(info: operationInfo)
        
        return cCell
    }
}







/*private func getUpdateLastResultClosure()->((Double)->Void) {
 let closure = {[unowned self] (lastValue: Double) in
 self.lastResultLabel.isHidden   = false
 self.lastResultLabel.text       = "\(Texts.lastResult) \(lastValue)"
 }
 
 return closure
 }*/

