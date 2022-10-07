//
//  UIViewController+.swift
//  EncodeBase64Strings
//
//  Created by Micah Burnside on 10/6/22.
//

import Foundation
import UIKit


extension UIViewController {
    @objc
    func showAlert(title: String, message: String, style: UIAlertController.Style, actions: [UIAlertAction] = [UIAlertAction(title: "Dismiss", style: .cancel, handler: nil)]) {
         let alertController: UIAlertController = .init(title: title, message: message, preferredStyle: style)
         for action in actions {
              alertController.addAction(action)
         }
         
         self.present(alertController, animated: true)
    }
    
    func showErrorAlert(error: Error) {
         let dismiss = UIAlertAction(title: "Dismiss", style: .default, handler: nil)
         self.showAlert(title: "Error", message: error.localizedDescription, style: .alert, actions: [dismiss])
    }
}
