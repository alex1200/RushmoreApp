//
//  helpViewController.swift
//  Rushmore_Swift
//
//  Created by CyArk Intern on 11/24/14.
//  Copyright (c) 2014 CyArk. All rights reserved.
//

import Foundation
import UIKit

class helpViewController : UIViewController{
	@IBOutlet weak var helpText: UITextView!
	var idleTimer = NSTimer()
	
	@IBAction func unwindToViewController (segue: UIStoryboardSegue){
		println("unwind?")
	}
	
	override func viewDidLoad() {
		idleTimer = NSTimer.scheduledTimerWithTimeInterval(60*5, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)
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
		
		idleTimer = NSTimer.scheduledTimerWithTimeInterval(60*5, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)
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

