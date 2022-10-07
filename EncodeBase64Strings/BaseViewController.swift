//
//  BaseViewController.swift
//  EncodeBase64Strings
//
//  Created by Micah Burnside on 10/6/22.
//

import UIKit

class BaseViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func getPasteboardString()->String{
        let pasteboardString = UIPasteboard.general.string
        return pasteboardString!
    }
}
