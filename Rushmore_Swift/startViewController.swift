//
//  startViewController.swift
//  Rushmore_Swift3D
//
//  Created by CyArk Intern on 12/18/14.
//  Copyright (c) 2014 CyArk. All rights reserved.
//

import Foundation
import UIKit

class startViewController : UIViewController{
	var firstTime = true
	override func viewDidAppear(animated: Bool) {
		firstTime=false
		println("reset to false")
	}
	override func viewWillAppear(animated: Bool) {
		let appDelegate = UIApplication.sharedApplication().delegate as AppDelegate
		println("tryreset")
		if (!firstTime){
			appDelegate.appReset()
			firstTime=false
			println("appreset")
		}
	}

}

