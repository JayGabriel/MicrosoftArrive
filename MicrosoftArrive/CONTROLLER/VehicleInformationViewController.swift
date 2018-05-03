//
//  VehicleInformationViewController.swift
//  MicrosoftArrive
//
//  Created by Jonell Gabriel

import UIKit

class VehicleInformationViewController: UIViewController {
    
    // MARK: - Properties
    var session: Session!

    // MARK: - Outlets
    @IBOutlet weak var licensePlateTextField: UITextField!
    @IBOutlet weak var stateTextField: UITextField!
    @IBOutlet weak var makeTextField: UITextField!
    @IBOutlet weak var modelTextField: UITextField!
    
    // MARK: - Actions
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if licensePlateTextField.text != "" &&
            stateTextField.text != "" &&
            makeTextField.text != "" &&
            modelTextField.text != "" {
            
            let confirmationVC = storyboard?.instantiateViewController(withIdentifier: "ConfirmationViewController") as! ConfirmationViewController
            
            session.vehicleLicensePlate = licensePlateTextField.text
            session.vehicleState = stateTextField.text
            session.vehicleMake = makeTextField.text
            session.vehicleModel = modelTextField.text
            confirmationVC.session = session
            present(confirmationVC, animated: true, completion: nil)
            
        } else {
            
            var fieldAlertMessage: [String] = []
            
            if licensePlateTextField.text == "" {
                fieldAlertMessage.append("license plate number")
            }
            
            if stateTextField.text == "" {
                fieldAlertMessage.append("state")
            }
            
            if makeTextField.text == "" {
                fieldAlertMessage.append("make")
            }
            
            if modelTextField.text == "" {
                fieldAlertMessage.append("model")
            }
            
            var message: String = ""
            for i in 0..<fieldAlertMessage.count {
                message += fieldAlertMessage[i]
                if(fieldAlertMessage.count > 1 && i < fieldAlertMessage.count - 1) {
                    message += ","
                }
            }
            
            let fieldAlert = generateAlert(title: "Incomplete fields", message: "Please complete the following fields: \(message)")
            present(fieldAlert, animated: true, completion: nil)
            
            
        }
        
    }
    @IBAction func startOverPressed(_ sender: UIButton) {
        returnToRoot(view: self.view)
    }
    
    @IBAction func privacyStatementPressed(_ sender: UIButton) {
        let alert = generateAlert(title: "Privacy Statement", message: "TODO: Display Privacy Statement")
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - View
    override func viewDidLoad() {
        licensePlateTextField.delegate = self
        stateTextField.delegate = self
        makeTextField.delegate = self
        modelTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // MARK: - Keyboard Rearrangement
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if makeTextField.isFirstResponder || modelTextField.isFirstResponder {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                if self.view.frame.origin.y == 0{
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        if makeTextField.isFirstResponder || modelTextField.isFirstResponder {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y != 0{
                    self.view.frame.origin.y += keyboardSize.height
                    
                    if makeTextField.isFirstResponder {
                        makeTextField.resignFirstResponder()
                    }  else {
                        modelTextField.resignFirstResponder()
                    }
                }
            }
        }
    }
    
}

extension VehicleInformationViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
