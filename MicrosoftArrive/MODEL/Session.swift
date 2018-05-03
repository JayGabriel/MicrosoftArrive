//
//  Session.swift
//  MicrosoftArrive
//
//  Created by Jonell Gabriel on 5/2/18.
//  Copyright © 2018 Jonell Gabriel. All rights reserved.
//

import Foundation

class Session {
    
    // MARK: Properties
    var visitorEmail: String!
    var visitorFirstName: String!
    var visitorLastName: String!
    var visitorCompany: String!
    
    var hostEmail: String!
    var hostFirstName: String!
    var hostLastName: String!
    
    var vehicleStatus: Bool!
    var vehicleLicensePlate: String!
    var vehicleState: String!
    var vehicleMake: String!
    var vehicleModel: String!
    
    init() {
        visitorEmail = ""
        visitorFirstName = ""
        visitorLastName = ""
        
        hostEmail = ""
        hostFirstName = ""
        hostLastName = ""
        
        vehicleStatus = true
        vehicleLicensePlate = ""
        vehicleState = ""
        vehicleMake = ""
        vehicleModel = ""
    }
}
