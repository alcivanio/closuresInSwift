//
//  Extensions.swift
//  ClosuresInSwift
//
//  Created by Alcivanio on 2/2/17.
//  Copyright © 2017 Alcivanio. All rights reserved.
//

import UIKit


extension String {
    public func convertToDouble()->Double? {
        let converted = Double(self)
        return converted
    }
}

extension UIViewController {
    public func showAlert(message: String) {
        let alert           = UIAlertController(title: message,message: nil,
                              preferredStyle: UIAlertControllerStyle.alert)
        let dismissAction   = UIAlertAction(title: Texts.done, style: UIAlertActionStyle.default, handler: nil)
        
        alert.addAction(dismissAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

extension UITableView {
    public func deselectSelectedRow(animated: Bool = true){
        if let currentRowIndex = self.indexPathForSelectedRow {
            self.deselectRow(at: currentRowIndex, animated: animated)
        }
    }
}
