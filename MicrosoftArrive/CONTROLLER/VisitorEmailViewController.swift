//
//  VisitorEmailViewController.swift
//  MicrosoftArrive
//
//  Created by Jonell Gabriel

import UIKit

class VisitorEmailViewController: UIViewController {
    
    // MARK:  - Properties
    var session: Session!
    
    // MARK: - Outlets
    @IBOutlet weak var userEmailTextField: UITextField!
    
    // MARK: - Actions
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if(userEmailTextField.text != "") {
            
            let hostNameVC = storyboard?.instantiateViewController(withIdentifier: "HostNameViewController") as! HostNameViewController
            
            session.visitorEmail = userEmailTextField.text
            hostNameVC.session = session
            present(hostNameVC, animated: true, completion: nil)
            
        } else {
            let fieldAlert = generateAlert(title: "Incomplete field", message: "Please enter your email address.")
            present(fieldAlert, animated: true, completion: nil)
        }
    }
    
    @IBAction func continueWithoutEmailPressed(_ sender: UIButton) {
        
        session.visitorEmail = ""
        let visitorNameVC = storyboard?.instantiateViewController(withIdentifier: "VisitorNameViewController") as! VisitorNameViewController
        
        visitorNameVC.session = session
        present(visitorNameVC, animated: true, completion: nil)
    }
    
    override func viewDidLoad() {
        userEmailTextField.delegate = self
    }
    
    @IBAction func startOverPressed(_ sender: UIButton) {
        returnToRoot(view: self.view)
    }
    
    @IBAction func privacyStatementPressed(_ sender: UIButton) {
        let alert = generateAlert(title: "Privacy Statement", message: "TODO: Display Privacy Statement")
        present(alert, animated: true, completion: nil)
    }
    
}

extension VisitorEmailViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
