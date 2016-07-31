//
//  OrdersViewController.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/31/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit
import MBProgressHUD

class OrdersViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        getOrders()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func getOrders() {
        MBProgressHUD.showHUDAddedTo(view, animated: true)
        OrderStore.getOrderListWithSuccess({ (model) in
            MBProgressHUD.hideHUDForView(self.view, animated: true)
            }) { (error) in
            self.handleError(error)
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
