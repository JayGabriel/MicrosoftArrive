//
//  UtilityMethods.swift
//  MicrosoftArrive
//
//  Created by Jonell Gabriel on 5/2/18.
//  Copyright © 2018 Jonell Gabriel. All rights reserved.
//

import UIKit

func generateAlert(title: String, message: String) -> UIAlertController {
    
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    
    alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel, handler: nil))
    
    return alert
}

func returnToRoot(view: UIView) {
    view.window!.rootViewController?.dismiss(animated: false, completion: nil)
}
