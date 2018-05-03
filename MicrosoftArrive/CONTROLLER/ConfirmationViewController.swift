//
//  ConfirmationViewController.swift
//  MicrosoftArrive
//
//  Created by Jonell Gabriel

import UIKit

class ConfirmationViewController: UIViewController {
    
    // MARK: - Properties
    var session: Session!

    // MARK: - Outlets
    @IBOutlet weak var visitorInformationLabel: UILabel!
    @IBOutlet weak var vehicleInformationTitleLabel: UILabel!
    @IBOutlet weak var vehicleInformationLabel: UILabel!
    @IBOutlet weak var hostInformationLabel: UILabel!
    
    // MARK: - Actions
    override func viewDidLoad() {
        
        if session.visitorFirstName != "" && session.visitorLastName != "" {
            visitorInformationLabel.text = "\(session.visitorFirstName!) \(session.visitorLastName!)"
        } else {
            visitorInformationLabel.text = "\(session.visitorEmail!)"
        }
        
        if session.vehicleStatus {
            vehicleInformationLabel.text = "\(session.vehicleLicensePlate!) / \(session.vehicleState!) /\(session.vehicleMake!) / \(session.vehicleModel!)"
        } else {
            vehicleInformationTitleLabel.isHidden = true
            vehicleInformationLabel.isHidden = true
        }
        
        if session.hostEmail != "" {
             hostInformationLabel.text = "\(session.hostEmail!)"
        } else {
            hostInformationLabel.text = "\(session.hostFirstName!) \(session.hostLastName!)"
        }
    }
    
    
    @IBAction func confirmPressed(_ sender: UIButton) {
        let completionAlert = UIAlertController(title: "Microsoft Arrive Workflow Complete", message: "Successfully completed the Microsoft Arrive check-in process with the following values: \n\nVisitor Email: \(session.visitorEmail!) \nVisitor First Name: \(session.visitorFirstName!) \nVisitor Last Name: \(session.visitorFirstName!) \nHost First Name: \(session.hostFirstName!) \nHost Last Name: \(session.hostLastName!) \nHost Email: \(session.hostEmail!) \nLicense Plate Number: \(session.vehicleLicensePlate!) \nVehicle State: \(session.vehicleState!) \nVehicleMake: \(session.vehicleMake!) \nVehicle Model: \(session.vehicleModel!)", preferredStyle: .alert)
        completionAlert.addAction(UIAlertAction(title: "Return to start", style: .default, handler: { (true) in
            returnToRoot(view: self.view)
        }))
        
        present(completionAlert, animated: true, completion: nil)
        
    }
    
    @IBAction func startOverPressed(_ sender: UIButton) {
        returnToRoot(view: self.view)
    }
    
    @IBAction func privacyStatementPressed(_ sender: UIButton) {
        let alert = generateAlert(title: "Privacy Statement", message: "TODO: Display Privacy Statement")
        present(alert, animated: true, completion: nil)
    }
    
    
}
