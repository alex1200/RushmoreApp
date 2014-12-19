//
//  ViewController.swift
//  Rushmore_Swift
//
//  Created by CyArk Intern on 10/15/14.
//  Copyright (c) 2014 CyArk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}

	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	@IBAction func unwindToViewController (segue: UIStoryboardSegue){
		println("unwind?")
	}


}





