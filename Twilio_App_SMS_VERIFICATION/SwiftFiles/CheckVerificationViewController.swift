//
//  CheckVerificationViewController.swift
//  Twilio_App_SMS_VERIFICATION
//
//  Created by DeEp KapaDia on 25/11/18.
//  Copyright © 2018 DeEp KapaDia. All rights reserved.
//

import UIKit

class CheckVerificationViewController: UIViewController {

    @IBOutlet var codeField: UITextField! = UITextField()
    @IBOutlet var errorLabel: UILabel! = UILabel()
    
    var countryCode: String?
    var phoneNumber: String?
    var resultMessage: String?
    
    @IBAction func validateCode() {
        self.errorLabel.text = nil // reset
        if let code = codeField.text {
            VerifyAPI.validateVerificationCode(self.countryCode!, self.phoneNumber!, code) { checked in
                if (checked.success) {
                    self.resultMessage = checked.message
                    self.performSegue(withIdentifier: "checkResultSegue", sender: nil)
                } else {
                    self.errorLabel.text = checked.message
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "checkResultSegue",
            let dest = segue.destination as? VerificationResultViewController {
            dest.message = resultMessage
        }
    }
    
}
