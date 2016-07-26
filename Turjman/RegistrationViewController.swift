//
//  RegistrationViewController.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/25/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit

class RegistrationViewController: BaseViewController,UIScrollViewDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var phoneCodeTextField: UITextField!
    @IBOutlet weak var contactPhoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func registerButtonPressed(sender: TurjmanButton) {
        if let errorMessage = validateFields() {
            let alert = UIAlertController(title: "Validation Error", message: errorMessage, preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
        else {
            
        }
    }
    @IBAction func selectCountryButtonPressed(sender: UIButton) {
        RegistrationStore .getCountriesListWithSuccess({ (model) in
            
            }) { (error) in
                
        }
    }

    func validateFields() -> String? {
        guard let nameText = nameTextField.text where !nameText.isEmpty else {
            return "Please enter your name"
        }
        guard let companyText = companyNameTextField.text where !companyText.isEmpty else {
            return "Please enter a company name"
        }
        guard let contactPhoneText = contactPhoneTextField.text where !contactPhoneText.isEmpty else {
            return "Please enter a phone number"
        }
        guard let emailText = emailTextField.text where !emailText.isEmpty else {
            return "Please enter an email address"
        }
        guard let passwordText = passwordTextField.text where !passwordText.isEmpty else {
            return "Please enter a password"
        }
        guard let confirm = confirmPasswordTextField.text where confirm == passwordTextField.text else {
            return "Password and confirmation don't match"
    
        }

        return nil
    }
    
    func scrollViewWillBeginDragging(scrollView: UIScrollView) {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
