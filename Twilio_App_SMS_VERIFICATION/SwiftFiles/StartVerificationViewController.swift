//
//  StartVerificationViewController.swift
//  Twilio_App_SMS_VERIFICATION
//
//  Created by DeEp KapaDia on 25/11/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class StartVerificationViewController: UIViewController {

    @IBOutlet var phoneNumberField: UITextField! = UITextField()
    @IBOutlet var countryCodeField: UITextField! = UITextField()
    
    @IBAction func sendVerification() {
        if let phoneNumber = phoneNumberField.text,
            let countryCode = countryCodeField.text {
            VerifyAPI.sendVerificationCode(countryCode, phoneNumber)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dest = segue.destination as? CheckVerificationViewController {
            dest.countryCode = countryCodeField.text
            dest.phoneNumber = phoneNumberField.text
        }
    }

}
