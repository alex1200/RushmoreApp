//
//  ImageViewController.swift
//  3D_test2
//
//  Created by CyArk Intern on 11/7/14.
//  Copyright (c) 2014 CyArk. All rights reserved.
//

import Foundation
import UIKit
import MediaPlayer

class ImageViewController: UIViewController {
	
	var idleTimer = NSTimer()
	
	@IBOutlet weak var mainView: UIView!
	@IBOutlet weak var imageView: UIImageView!
	@IBOutlet weak var startAnimation1: UIButton!
	@IBOutlet weak var startAnimation2: UIButton!
	@IBOutlet weak var buttonWrench: UIButton!
	@IBOutlet weak var buttonHammer: UIButton!
	@IBOutlet weak var buttonMashBit: UIButton!
	@IBOutlet weak var buttonHandle: UIButton!
	@IBOutlet weak var buttonDrill: UIButton!
	@IBOutlet weak var buttonHammerHeads: UIButton!
	@IBOutlet weak var buttonCrutch: UIButton!
	@IBOutlet weak var buttonSledge: UIButton!
	@IBOutlet weak var buttonTong: UIButton!
	@IBOutlet weak var buttonDrillBits: UIButton!
	@IBOutlet weak var buttonDrillHeads: UIButton!
	@IBOutlet weak var buttonWedgeHeads: UIButton!
	
	var buttonLocation: String = ""
	var images = NSMutableArray()
	
	var moviePlayer : MPMoviePlayerController?
	var movieView = UIView()
	override func viewDidLoad() {
				idleTimer = NSTimer.scheduledTimerWithTimeInterval(60*10, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)
	}
	
	@IBAction func image1Click(sender: UIButton) {
		
		buttonLocation = "6_blacksmith_bench"
		println("1")
		startAnimation1.hidden = true
		startAnimation2.hidden = true
		playVideo("www/Bench_Anim1")
		println("4")
		let aSelector : Selector = "animationStopped"
		var timer = NSTimer.scheduledTimerWithTimeInterval(8,
			target: self,
			selector: aSelector,
			userInfo: nil,
			repeats: false)
		
		println("5")
	}
	@IBAction func image2Click(sender: UIButton) {
		
		buttonLocation = "8_blacksmith_forge"
		startAnimation1.hidden = true
		startAnimation2.hidden = true
		playVideo("www/Forge_Anim1")
		let aSelector : Selector = "animationStopped"
		var timer = NSTimer.scheduledTimerWithTimeInterval(8,
			target: self,
			selector: aSelector,
			userInfo: nil,
			repeats: false)

		
	}
	func animationStopped(){
		println(buttonLocation)
		removeVideo()
		switch buttonLocation {
		case "6_blacksmith_bench" :
			buttonWrench.hidden = false
			buttonHammer.hidden = false
			buttonMashBit.hidden = false
			buttonHandle.hidden = false
			buttonHammerHeads.hidden = false
			buttonDrill.hidden = false
		case "8_blacksmith_forge" :
			buttonCrutch.hidden = false
			buttonSledge.hidden = false
			buttonTong.hidden = false
			buttonDrillBits.hidden = false
			buttonDrillHeads.hidden = false
			buttonWedgeHeads.hidden = false
		default:
			
			break
		}
		imageView.image = UIImage(named: buttonLocation)
	}
	func playVideo(moviePath : String) {
		let path = NSBundle.mainBundle().pathForResource(moviePath, ofType:"mov")
		println(path)
		
		let url = NSURL.fileURLWithPath(path!)
		moviePlayer = MPMoviePlayerController(contentURL: url)
		if let player = moviePlayer {
			player.view.frame = mainView.bounds
			player.prepareToPlay()
			player.scalingMode = .AspectFill
			movieView.addSubview(player.view)
			mainView.insertSubview(movieView, aboveSubview: imageView)
		}
	}
	func removeVideo(){
		movieView.removeFromSuperview()
		println("remove")
	}
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
		println("seque")
		movieView.removeFromSuperview()
		if((segue.identifier) != "back" && (segue.identifier) != "restart"){
			let viewController:GameViewController = segue.destinationViewController as GameViewController
			if ((segue.identifier) != nil){
				viewController.sceneName = segue.identifier!
				viewController.refererName = self.restorationIdentifier!
			}
		}		
	}
	
	override func shouldAutorotate() -> Bool {
		return true
	}
	
	override func prefersStatusBarHidden() -> Bool {
		return true
	}
	
	override func supportedInterfaceOrientations() -> Int {
		if UIDevice.currentDevice().userInterfaceIdiom == .Phone {
			return Int(UIInterfaceOrientationMask.AllButUpsideDown.rawValue)
		} else {
			return Int(UIInterfaceOrientationMask.All.rawValue)
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Release any cached data, images, etc that aren't in use.
		NSURLCache.sharedURLCache().removeAllCachedResponses()
		println("removeCache")
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
		
		idleTimer = NSTimer.scheduledTimerWithTimeInterval(60*10, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)
		println("reset Idle")
	}
	
	func idleTimerExceeded() {
		println("idle time exceeded")
		performSegueWithIdentifier("restart", sender: self)
		
	}
	@IBAction func unwindToViewController (segue: UIStoryboardSegue){
		println("unwind?")
	}
	
}
