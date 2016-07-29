//
//  LoginViewController.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/24/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit
import ENSwiftSideMenu
import GoogleSignIn
import MBProgressHUD

class LoginViewController: BaseViewController,GIDSignInUIDelegate {

    @IBOutlet weak var mailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func signInButtonPressed(sender: AnyObject) {
        if let errorMessage = validateFields() {
            showErrorMessage(errorMessage, title: "Validation Error")
        }
        else {
            LoginStore.loginWithEmail(mailTextField.text!, password: passwordTextField.text!)
        }
    }
   
    
    @IBAction func toggleSideMenu(sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    
    func signInWillDispatch(signIn: GIDSignIn!, error: NSError!) {
        MBProgressHUD.hideHUDForView(view, animated: true)
    }
    
    // Present a view that prompts the user to sign in with Google
    func signIn(signIn: GIDSignIn!,
                presentViewController viewController: UIViewController!) {
        self.presentViewController(viewController, animated: true, completion: nil)
    }
    
    // Dismiss the "Sign in with Google" view
    func signIn(signIn: GIDSignIn!,
                dismissViewController viewController: UIViewController!) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    func validateFields() -> String? {
        guard let mailText = mailTextField.text where !mailText.isEmpty else {
            return "Please enter your mail"
        }
        guard let passwordText = passwordTextField.text where !passwordText.isEmpty else {
            return "Please enter your password"
        }
      
        
        return nil
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
