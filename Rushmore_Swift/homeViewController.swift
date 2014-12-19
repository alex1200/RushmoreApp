//
//  ViewController.swift
//  Rushmore_Swift
//
//  Created by CyArk Intern on 10/15/14.
//  Copyright (c) 2014 CyArk. All rights reserved.
//
import Foundation
import UIKit

class homeViewController: UIViewController {
	var idleTimer = NSTimer()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		idleTimer = NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	@IBAction func unwindToViewController (segue: UIStoryboardSegue){
		println("unwind?")
	}

	override func touchesBegan(touches: NSSet, withEvent event: UIEvent) {
		println("touch began")
		self.resetIdleTimer()
	}
	override func touchesEnded(touches: NSSet, withEvent event: UIEvent) {
		println("touch ended")
		self.resetIdleTimer()
	}
	override func touchesMoved(touches: NSSet, withEvent event: UIEvent) {
		println("touch moved")
		self.resetIdleTimer()
	}
	override func touchesCancelled(touches: NSSet!, withEvent event: UIEvent!) {
		println("touch cancel")
		self.resetIdleTimer()
	}
	
	func resetIdleTimer() {
		if (idleTimer.valid) {
			idleTimer.invalidate()
		}
		
		idleTimer = NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)
		println("reset Idle")
	}
	
	func idleTimerExceeded() {
		println("idle time exceeded")
		performSegueWithIdentifier("restart", sender: self)
	}
	override func viewDidDisappear(animated: Bool) {
		idleTimer.invalidate()
	}

}





