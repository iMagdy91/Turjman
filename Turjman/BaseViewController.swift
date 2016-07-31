//
//  BaseViewController.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/24/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit
import ENSwiftSideMenu
import MBProgressHUD

class BaseViewController: UIViewController,ENSideMenuDelegate,UITextFieldDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
        customizeNavigationBar()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        view.endEditing(true)
        if isSideMenuOpen(){
            hideSideMenuView()
        }
    }
    
    func customizeNavigationBar() {
        let titleDict: NSDictionary = [NSForegroundColorAttributeName: UIColor.whiteColor()]
        navigationController!.navigationBar.titleTextAttributes = titleDict as? [String : AnyObject]
        navigationController!.navigationBar.tintColor = UIColor.whiteColor()
        navigationController!.navigationBar.barTintColor = UIColor.blueColor()
        
        
        let btnName = UIButton()
//        btnName.setImage(UIImage(named: "imagename"), forState: .Normal)
        btnName.setTitle("Menu", forState: .Normal)
        btnName.frame = CGRectMake(0, 0, 60, 30)
        btnName.addTarget(self, action: #selector(toggleSideMenu), forControlEvents: .TouchUpInside)
        
        //.... Set Right/Left Bar Button item
        let leftBarButton = UIBarButtonItem()
        leftBarButton.customView = btnName
        self.navigationItem.leftBarButtonItem = leftBarButton

        
//        let sideMenuButton = UIBarButtonItem(barButtonSystemItem: .Refresh, target: self, action: Selector("toggleSideMenu"))
//        self.navigationItem.leftBarButtonItem = sideMenuButton
    }
    func toggleSideMenu(){
        toggleSideMenuView()
    }
    
    func sideMenuWillOpen() {
        view.endEditing(true)
    }
   
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        return textField.resignFirstResponder()
    }
    func textFieldDidBeginEditing(textField: UITextField) {
        if isSideMenuOpen(){
            hideSideMenuView()
        }
    }
    
    func showErrorMessage(message: String,title:String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    func loginSucceeded(){
        User.sharedInstance.isLoggedIn = true

        let ordersStoryboard = UIStoryboard(name: "Orders", bundle: nil)
        let ordersViewController = ordersStoryboard.instantiateViewControllerWithIdentifier("ordersViewController")
        
        sideMenuController()?.setContentViewController(ordersViewController)
        toggleSideMenu()
        MenuTableViewController.sharedInstance.tableView.reloadData()
    }
    
    func handleError(error: NSError?){
        MBProgressHUD.hideHUDForView(view, animated: true)
        if let currentError = error{
            self.showErrorMessage(currentError.description, title: "Error")
        }
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
