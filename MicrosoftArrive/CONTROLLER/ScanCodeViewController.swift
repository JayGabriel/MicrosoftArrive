//
//  ScanCodeViewController.swift
//  MicrosoftArrive
//
//  Created by Jonell Gabriel

import UIKit

class ScanCodeViewController: UIViewController {
    
    // MARK: - Properties
    var session: Session!
    
    // MARK: - Actions
    @IBAction func scanCodePressed(_ sender: UIButton) {
        
        let visitorEmailVC = storyboard?.instantiateViewController(withIdentifier: "VisitorEmailViewController") as! VisitorEmailViewController
        
        visitorEmailVC.session = session
        present(visitorEmailVC, animated: true, completion: nil)
    }
    
    @IBAction func noCodePressed(_ sender: UIButton) {
        let alert = generateAlert(title: "No QR Code", message: "TODO: Perform workflow for No Code Pressed")
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func employeePressed(_ sender: UIButton) {
        let alert = generateAlert(title: "Employee", message: "TODO: Perform workflow for Employee Button Pressed")
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func privacyStatementPressed(_ sender: UIButton) {
        let alert = generateAlert(title: "Privacy Statement", message: "TODO: Display Privacy Statement")
        present(alert, animated: true, completion: nil)
    }
    
    // MARK: - View
    override func viewDidLoad() {
        session = Session()
        

    }
}
