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
    @IBOutlet weak var labelEncodedText: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var buttonEncodeString: UIButton!
    @IBOutlet weak var buttonCopyEncodedLabelText: UIButton!
    
    //MARK: - User Interactions
    @IBAction func encodeStringToBase64Pressed(_ sender: UIButton) {
        //encodes a string and sets the label text to the encoded string text value
        //pass in a label to receive the encoded text, pass in a reference to a textField.text object to be encoded and displayed
        encodeStringAndSetLabelText(label: labelEncodedText, inputText: encodeStringToBase64(string: getTextFieldText(inputTextField: textField.text!)))
        //tells the user their string was encoded
        showAlert(title: "Encoded", message: "You string was encoded", style: .alert)
        
    }
    
    @IBAction func copyEncodedTextButtonPressed(_ sender: UIButton) {
         UIPasteboard.general.string = labelEncodedText.text
        print("Pasteboard Value: \(getPasteboardString())")
        //tells the user the encoded label text was copied to the Pasteboard
        showAlert(title: "Copied", message: "Encoded String Copied", style: .alert)

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    //MARK: - TextField Methods
    
    //usage: Pass in a textfield.text to return it's string value
    func getTextFieldText(inputTextField: String)->String {
        let inputTextField = inputTextFieldS
        return inputTextField
    }
    
    func clearTextField() {
        //sets textField.text to nil
        textField.text = nil
    }
    
//MARK: - Base64 Encoding
    ///func encodeStringToBase64(string: String) -> String
    /// pass in any String type object to be encoded using Base64 encdoing
    func encodeStringToBase64(string: String) -> String {
        //assigns string to function paramter "string"
        let string = string
        //string.data(using:.utf8) calls and returns`Data` containing a representation of the `String` encoded using UTF8 encoding.
        let utf8str = string.data(using: .utf8)
        //encodes the utf8str using Base64 encoding
        let base64Encoded = utf8str?.base64EncodedString(options: Data.Base64EncodingOptions(rawValue: 0))
        print("\(String(describing: base64Encoded))")
        //returns base64Encoded to satisfy the String return type requirement
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
    
    //reads and returns the label.text value from a given label as a String
    func getLabelText(label:UILabel)->String{
        let label = label
        label.text = label.text
        return label.text!
    }
    
    //sets labelEncoded.text to a string that has been encoded with Base64 encoding
    //hard coded, but simplifed to a function call when used.
    //could be modified with more function parameters
    func setLabelTextWithEncodedString() {
        labelEncodedText.text = encodeStringToBase64(string: getTextFieldText(inputTextField: textField.text!))
        clearTextField()
    }
    
    func encodeStringAndSetLabelText(label: UILabel, inputText: String) {
        let label = label
        let inputText = inputText
        label.text = inputText
        clearTextField()
    }


}

