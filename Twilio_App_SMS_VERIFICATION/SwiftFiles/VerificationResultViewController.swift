//
//  VerificationResultViewController.swift
//  Twilio_App_SMS_VERIFICATION
//
//  Created by DeEp KapaDia on 25/11/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class VerificationResultViewController: UIViewController {

    @IBOutlet var successIndication: UILabel! = UILabel()
    
    var message: String?
    
    override func viewDidLoad() {
        if let resultToDisplay = message {
            successIndication.text = resultToDisplay
        } else {
            successIndication.text = "Something went wrong!"
        }
        super.viewDidLoad()
    }

}
