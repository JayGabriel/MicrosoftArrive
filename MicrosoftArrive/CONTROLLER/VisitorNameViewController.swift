//
//  VisitorNameViewController.swift
//  MicrosoftArrive
//
//  Created by Jonell Gabriel

import UIKit

class VisitorNameViewController: UIViewController {
    
    // MARK: - Properties
    var session: Session!
    
    // MARK: - Outlets
    @IBOutlet weak var visitorFirstNameTextField: UITextField!
    @IBOutlet weak var visitorLastNameTextField: UITextField!
    @IBOutlet weak var visitorCompanyTextField: UITextField!
    
    // MARK: - Actions
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if visitorFirstNameTextField.text != "" &&
            visitorLastNameTextField.text != "" &&
            visitorCompanyTextField.text != "" {
            
            let hostNameVC = storyboard?.instantiateViewController(withIdentifier: "HostNameViewController") as! HostNameViewController
            
            session.visitorFirstName = visitorFirstNameTextField.text
            session.visitorLastName = visitorLastNameTextField.text
            session.visitorCompany = visitorCompanyTextField.text
            hostNameVC.session = session
            present(hostNameVC, animated: true, completion: nil)
            
        } else {
            
            var fieldAlertMessage: [String] = []
            
            if visitorFirstNameTextField.text == "" {
                fieldAlertMessage.append("first name")
            }
            
            if visitorLastNameTextField.text == "" {
                fieldAlertMessage.append("last name")
            }
            
            if visitorCompanyTextField.text == "" {
                fieldAlertMessage.append("company")
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
        visitorFirstNameTextField.delegate = self
        visitorLastNameTextField.delegate = self
        visitorCompanyTextField.delegate = self
        
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }
    
    // MARK: - Keyboard Rearrangement
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if visitorLastNameTextField.isFirstResponder || visitorCompanyTextField.isFirstResponder {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                if self.view.frame.origin.y == 0{
                    self.view.frame.origin.y -= keyboardSize.height
                }
            }
        }
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        
        if visitorLastNameTextField.isFirstResponder || visitorCompanyTextField.isFirstResponder {
            if let keyboardSize = (notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                if self.view.frame.origin.y != 0{
                    self.view.frame.origin.y += keyboardSize.height
                    
                    if visitorLastNameTextField.isFirstResponder {
                        visitorLastNameTextField.resignFirstResponder()
                    }  else {
                        visitorCompanyTextField.resignFirstResponder()
                    }
                }
            }
        }
    }
    
}

extension VisitorNameViewController: UITextFieldDelegate {
    
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
