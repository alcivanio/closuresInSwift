//
//  OperationsTableViewCell.swift
//  ClosuresInSwift
//
//  Created by Alcivanio on 1/31/17.
//  Copyright © 2017 Alcivanio. All rights reserved.
//

import UIKit

struct OperationInfo {
    let symbol: String
    let name:   String
    
    init(operation: Operation) {
        symbol  = operation.operationType.symbol
        name    = operation.operationType.name
    }
}

class OperationsTableViewCell: UITableViewCell {
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        if selected {
            self.backgroundView?.addSubview(UIView())
        }
        else {
            self.selectedBackgroundView?.addSubview(UIView())
        }
        
    }

    @IBOutlet weak var bigSymbol: UILabel!
    @IBOutlet weak var textDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func fillWithInfo(info:OperationInfo) {
        setValues(info)
    }
    
    private func setValues(_ info:OperationInfo) {
        bigSymbol.text       = info.symbol
        textDescription.text = info.name
    }
    
}
