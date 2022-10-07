//
//  EncodeStringsToBase64ViewController.swift
//  EncodeBase64Strings
//
//  Created by Micah Burnside on 10/6/22.
//
import Foundation
import UIKit

class EncodeStringsToBase64ViewController: BaseViewController {

//MARK: - Outlets
    @IBOutlet weak var encodedTextLabel: UILabel!
    @IBOutlet weak var inputTextField: UITextField!
    @IBOutlet weak var encodeStringButton: UIButton!
    @IBOutlet weak var copyEncodedTextButton: UIButton!
    
    //MARK: - User Interactions
    @IBAction func encodeStringToBase64Pressed(_ sender: UIButton) {
        //simple, not as re-usable
//        setLabelTextWithEncodedString()
        //more complex, params need to be renamed for readability, re-usable
        encodeStringAndSetLabelText(label: encodedTextLabel, inputText: encodeStringToBase64(string: getTextFieldText(inputTextField: inputTextField.text!)))
        
    }
    
    @IBAction func copyEncodedTextButtonPressed(_ sender: UIButton) {
         UIPasteboard.general.string = encodedTextLabel.text
        print("Pasteboard Value: \(getPasteboardString())")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //MARK: - TextField Methods

    func getInputTextFieldText()->String {
        let inputTextFieldText = getTextFieldText(inputTextField: inputTextField.text!)
        return inputTextFieldText
    }
    
    func getTextFieldText(inputTextField: String)->String {
        let inputTextField = inputTextField
        return inputTextField
    }
    
    func clearTextField() {
        inputTextField.text = nil
    }
    
//MARK: - Base64 Encoding
    func encodeStringToBase64(string: String) -> String {
        let string = string
        let utf8str = string.data(using: .utf8)
        let base64Encoded = utf8str?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        print("\(String(describing: base64Encoded))")
        return base64Encoded!
    }
    
    //MARK: - Base64 Decoding
    func decodeBase64(base64Text: String) -> String {
        let string = base64Text
        if let utf8str = string.data(using: .utf8) {
            if Data(base64Encoded: utf8str, options: Data.Base64DecodingOptions(rawValue: 0))
                .map({ String(data: $0, encoding: .utf8) }) != nil {
            }
        }
        return base64Text
    }
    
    func getLabelText(label:UILabel)->String{
        var label = String()
        encodedTextLabel.text = label
        return label
    }
    
    func setLabelText(input:String)->String{
        var input = String()
        encodedTextLabel.text = encodeStringToBase64(string: getInputTextFieldText())
        input = getLabelText(label: encodedTextLabel)
        return input
    }
    
    func setLabelTextWithEncodedString() {
        encodedTextLabel.text = encodeStringToBase64(string: getTextFieldText(inputTextField: inputTextField.text!))
        clearTextField()
    }
    
    func encodeStringAndSetLabelText(label: UILabel, inputText: String) {
        var label = label
        var inputText = inputText
        label.text = inputText
        clearTextField()
    }


}

