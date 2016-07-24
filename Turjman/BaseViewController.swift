//
//  BaseViewController.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/24/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class BaseViewController: UIViewController,ENSideMenuDelegate {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.sideMenuController()?.sideMenu?.delegate = self
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
        navigationController!.navigationBar.titleTextAttributes = titleDict as! [String : AnyObject]
        navigationController!.navigationBar.barTintColor = UIColor.blueColor()
    }
 
    func sideMenuWillOpen() {
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
