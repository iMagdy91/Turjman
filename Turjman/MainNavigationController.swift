//
//  MainNavigationController.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/24/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit
import ENSwiftSideMenu

class MainNavigationController: ENSideMenuNavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        sideMenu = ENSideMenu(sourceView: self.view, menuViewController: MenuTableViewController(), menuPosition:.Left)
        view.bringSubviewToFront(navigationBar)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
