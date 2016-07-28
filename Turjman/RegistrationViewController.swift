//
//  RegistrationViewController.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/25/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit
import SBPickerSelector
import MBProgressHUD

class RegistrationViewController: BaseViewController,UIScrollViewDelegate,SBPickerSelectorDelegate {

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var companyNameTextField: UITextField!
    @IBOutlet weak var phoneCodeTextField: UITextField!
    @IBOutlet weak var contactPhoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!
    @IBOutlet weak var selectCountryButton: UIButton!
    
    var countriesArray: Array<CountriesModel>?
    var selectedCountry: CountriesModel?
    
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
            showErrorMessage(errorMessage, title: "Validation Error")
        }
        else {
            RegistrationStore.registerUserWithFirstName(nameTextField.text!, company: companyNameTextField.text!, phoneCode: phoneCodeTextField.text, phone: contactPhoneTextField.text!, email: emailTextField.text!, password: passwordTextField.text!, countryID: "10", iemeiNumber: Device.udid, success: { (userID) in
                
                }, failure: { (error) in
                    
                }, businessFailure: { (busniessError) in
                    
            })
        }
    }
    @IBAction func selectCountryButtonPressed(sender: UIButton) {
        view.endEditing(true)
        MBProgressHUD.showHUDAddedTo(view, animated: true)
        RegistrationStore .getCountriesListWithSuccess({ (model) in
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            self.countriesArray = model
            self.presentCountriesPicker()

            }) { (error) in
                if let currentError = error{
                    self.showErrorMessage(currentError.description, title: "Error")
                    
                }
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
    
    func presentCountriesPicker() {
        let countries = self.countriesArray!.map {$0.countryName!}
       
        
        let picker: SBPickerSelector = SBPickerSelector.picker()
        picker.pickerData = countries
        picker.delegate = self
        picker.pickerType = SBPickerSelectorType.Text
        picker.doneButtonTitle = "Done"
        picker.cancelButtonTitle = "Cancel"

        let point: CGPoint = view.convertPoint(view.frame.origin, fromView: view)
        var frame: CGRect = view.frame
        frame.origin = point
        picker.showPickerIpadFromRect(frame, inView: view)
       
    
    }
    
    func pickerSelector(selector: SBPickerSelector!, selectedValue value: String!, index idx: Int) {
        selectedCountry = countriesArray![idx]
        selectCountryButton.setTitle(value, forState: .Normal)
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
