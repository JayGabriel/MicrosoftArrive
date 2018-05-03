//
//  HostNameViewController.swift
//  MicrosoftArrive
//
//  Created by Jonell Gabriel

import UIKit

class HostNameViewController: UIViewController {
    
    // MARK: - Properties
    var session: Session!

    // MARK: - Outlets
    @IBOutlet weak var hostFirstNameTextField: UITextField!
    @IBOutlet weak var hostLastNameTextField: UITextField!
    
    // MARK: - Actions
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if hostFirstNameTextField.text != "" &&
            hostLastNameTextField.text != "" {
            let parkingConfirmationVC = storyboard?.instantiateViewController(withIdentifier: "ParkingConfirmationViewController") as! ParkingConfirmationViewController
            
            session.hostFirstName = hostFirstNameTextField.text
            session.hostLastName = hostLastNameTextField.text
            parkingConfirmationVC.session = session
            present(parkingConfirmationVC, animated: true, completion: nil)
            
        } else {
            
            var fieldAlertMessage: [String] = []
            
            if hostFirstNameTextField.text == "" {
                fieldAlertMessage.append("first name")
            }
            
            if hostLastNameTextField.text == "" {
                fieldAlertMessage.append("last name")
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
    
    @IBAction func enterHostEmailPressed(_ sender: UIButton) {
        
        let hostEmailVC = storyboard?.instantiateViewController(withIdentifier: "HostEmailViewController") as! HostEmailViewController
        
        session.hostFirstName = ""
        session.hostLastName = ""
        hostEmailVC.session = session
        present(hostEmailVC, animated: true, completion: nil)
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
        hostFirstNameTextField.delegate = self
        hostLastNameTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // MARK: - Keyboard Rearrangement
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if hostLastNameTextField.isFirstResponder {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                if self.view.frame.origin.y == 0{
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        if hostLastNameTextField.isFirstResponder {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y != 0{
                    self.view.frame.origin.y += keyboardSize.height
                    
                   hostLastNameTextField.resignFirstResponder()
                }
            }
        }
    }
    
}

extension HostNameViewController: UITextFieldDelegate {
    
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
