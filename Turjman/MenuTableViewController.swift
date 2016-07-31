//
//  MenuTableViewController.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/24/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit

class MenuTableViewController: UITableViewController {
    
    
    class var sharedInstance: MenuTableViewController {
        struct Static {
            static let instance: MenuTableViewController = MenuTableViewController()
        }
        return Static.instance
    }
    
    let loggedOutMenu = ["Profile","Orders","Invoices","Notifications","Languages","Settings","FAQ","Contact Us", "About Us"]
    let loggedInMenu = ["Profile","Orders","Invoices","Notifications","Languages","Settings","FAQ","Contact Us", "About Us","Change Password","Sign Out"]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize apperance of table view
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0) //
        tableView.backgroundColor = UIColor.blueColor()
        tableView.scrollsToTop = false
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source



    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        if (User.sharedInstance.isLoggedIn){
            return loggedInMenu.count
        }
        else {
            return loggedOutMenu.count
        }
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cellIdentifier = "menuCell"
        var cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier)
        if cell == nil {
            cell = UITableViewCell.init(style: .Default, reuseIdentifier:cellIdentifier)
        }

        // Configure the cell...
        customizeCell(cell, forIndexPath: indexPath)
        
        return cell!
    }
    
    func  customizeCell(cell:UITableViewCell?,forIndexPath indexPath:NSIndexPath){
        if (User.sharedInstance.isLoggedIn){
            if indexPath.row == 0 {
                cell!.textLabel?.text = User.sharedInstance.userData.firstName
                
            }
            else {
                cell!.textLabel?.text = loggedInMenu[indexPath.row]
                
            }
            
        }
        else {
            cell!.textLabel?.text = loggedOutMenu[indexPath.row]
        }
        cell!.selectionStyle = .None
        cell!.imageView?.image = nil
        cell!.backgroundColor = UIColor.clearColor()
        cell!.textLabel?.textColor = UIColor.whiteColor()
        cell!.textLabel?.font = UIFont.systemFontOfSize(15.0)
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
