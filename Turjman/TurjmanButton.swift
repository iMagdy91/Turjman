//
//  TurjmanButton.swift
//  Turjman
//
//  Created by Mohamed Magdy on 7/24/16.
//  Copyright © 2016 Mohamed Magdy. All rights reserved.
//

import UIKit

class TurjmanButton: UIButton {

   
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.backgroundColor = UIColor.blueColor()
        self.setTitleColor(UIColor.whiteColor(), forState: .Normal)
        self.layer.cornerRadius = 10;
        self.clipsToBounds = true;
    }

 

}
