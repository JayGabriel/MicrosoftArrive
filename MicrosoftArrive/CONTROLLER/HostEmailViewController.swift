//
//  HostEmailViewController.swift
//  MicrosoftArrive
//
//  Created by Jonell Gabriel

import UIKit

class HostEmailViewController: UIViewController {
    
    // MARK: - Properties
    var session: Session!

    // MARK: - Outlets
    @IBOutlet weak var hostEmailTextField: UITextField!
    
    // MARK: - Actions
    @IBAction func nextPressed(_ sender: UIButton) {
        
        if hostEmailTextField.text != "" {
            let parkingConfirmationVC = storyboard?.instantiateViewController(withIdentifier: "ParkingConfirmationViewController") as! ParkingConfirmationViewController
            
            session.hostEmail = hostEmailTextField.text
            parkingConfirmationVC.session = session
            present(parkingConfirmationVC, animated: true, completion: nil)
            
        } else {
            
            let fieldAlert = generateAlert(title: "Incomplete field", message: "Please complete the host email field.")
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
        hostEmailTextField.delegate = self
    }
    
}

extension HostEmailViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
