//
//  String+.swift
//  EncodeBase64Strings
//
//  Created by Micah Burnside on 10/7/22.
//

import Foundation
import UIKit

extension String {
    
    func base64Encoded() -> String? {
        data(using: .utf8)?.base64EncodedString()
    }
    
    func base64Decoded() -> String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        return String(data: data, encoding: .utf8)
    }
}

