//
//  ParkingConfirmationViewController.swift
//  MicrosoftArrive
//
//  Created by Jonell Gabriel

import UIKit

class ParkingConfirmationViewController: UIViewController {
    
    // MARK: - Properties
    var session: Session!
    
    // MARK: - Actions
    @IBAction func yesPressed(_ sender: UIButton) {
        
        session.vehicleStatus = true
        let vehicleInformationVC = storyboard?.instantiateViewController(withIdentifier: "VehicleInformationViewController") as! VehicleInformationViewController
        
        vehicleInformationVC.session = session
        present(vehicleInformationVC, animated: true, completion: nil)
    }
    
    @IBAction func noPressed(_ sender: UIButton) {
        
        session.vehicleStatus = false
        let confirmationVC = storyboard?.instantiateViewController(withIdentifier: "ConfirmationViewController") as! ConfirmationViewController
        
        confirmationVC.session = session
        present(confirmationVC, animated: true, completion: nil)
    }
    
    @IBAction func startOverPressed(_ sender: UIButton) {
        returnToRoot(view: self.view)
    }
    
    @IBAction func privacyStatementPressed(_ sender: UIButton) {
        let alert = generateAlert(title: "Privacy Statement", message: "TODO: Display Privacy Statement")
        present(alert, animated: true, completion: nil)
    }

}

