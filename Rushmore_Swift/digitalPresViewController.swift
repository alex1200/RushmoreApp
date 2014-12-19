//
//  digitalPresViewController.swift
//  Rushmore_Swift
//
//  Created by CyArk Intern on 11/24/14.
//  Copyright (c) 2014 CyArk. All rights reserved.
//

import Foundation
import MediaPlayer


class digitalPresViewController : UIViewController{
	
	var moviePlayer : MPMoviePlayerController?
	var idleTimer = NSTimer()
	@IBOutlet weak var mainView: UIView!
	override func viewDidLoad() {
		super.viewDidLoad()
		playVideo("www/img-rus/media/video_2_1")
		idleTimer = NSTimer.scheduledTimerWithTimeInterval(60*5, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)
	}
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
		moviePlayer?.stop()
		println("seque")
		
	}
	@IBAction func unwindToViewController (segue: UIStoryboardSegue){
		println("unwind?digi")
		moviePlayer?.play()
	}

/**************************************************/
@IBOutlet weak var whyDigiButton: UIImageView!
@IBOutlet weak var introDigiButton: UIImageView!
@IBOutlet weak var scanDigiButton: UIImageView!
@IBOutlet weak var movieView: UIView!
@IBOutlet weak var textDigiView: UITextView!
/*****Digital Preservation*********************************************/
@IBAction func changeMoviewhyDigi(sender:UITapGestureRecognizer){
	removeVideo()
	whyDigiButton.image = UIImage(named: "DigitalPreservationProject_buttons_1_on")
	introDigiButton.image = UIImage(named: "DigitalPreservationProject_buttons_2")
	scanDigiButton.image = UIImage(named: "DigitalPreservationProject_buttons_3")
	playVideo("www/img-rus/media/video_2_1_large")
	textDigiView.text = "CyArk founder, Ben Kacyra, speaks from the Sculptor's Studio at Mount Rushmore National Memorial about the importance of safeguarding our collective history by digitally preserving imporant cultural heritage monuments. Film by Mike Brooks of Historic Scotland. Music: 6 a.m taxi (Jahzzar) / CC BY-SA 3.0"
}
@IBAction func changeMovieintroDigi(sender:UITapGestureRecognizer){
	removeVideo()
	whyDigiButton.image = UIImage(named: "DigitalPreservationProject_buttons_1")
	introDigiButton.image = UIImage(named: "DigitalPreservationProject_buttons_2_on")
	scanDigiButton.image = UIImage(named: "DigitalPreservationProject_buttons_3")
	playVideo("www/img-rus/media/video_2_2_large")
	textDigiView.text = "Digital Preservation is a process that utilizes new technologies in surveying and imaging to document heritage sites in 3D and to accuracies that were never-before possible. The core technology is the portable 3D laser scanner, which was developed by CyArk founder, Ben Kacyra. Music: gentle marimba (Alastair Cameron) / CC BY 3.0"
}
@IBAction func changeMoviescanDigi(sender:UITapGestureRecognizer){
	removeVideo()
	whyDigiButton.image = UIImage(named: "DigitalPreservationProject_buttons_1")
	introDigiButton.image = UIImage(named: "DigitalPreservationProject_buttons_2")
	scanDigiButton.image = UIImage(named: "DigitalPreservationProject_buttons_3_on")
	playVideo("www/img-rus/media/video_2_3_large")
	textDigiView.text = "In May of 2010, the National Park Service collaborated with CyArk and the Centre for Digital Documentation and Visualisation to laser scan the entire Mount Rushmore sculpture in order to create the most accurate model of it to-date. The resulting materials also allow for virtual tourism and new educational content which is freely accessible at CyArk's Mount Rushmore Portal. Music: Old Strange ( Black Twig Pickers and Steve Gunn ) / CC BY-NC 3.0 and  gentle marimba ( Alastair Cameron ) / CC BY 3.0"
}

	func playVideo(moviePath : String) {
		let path = NSBundle.mainBundle().pathForResource(moviePath, ofType:"mov")
		println(path)
		let url = NSURL.fileURLWithPath(path!)
		moviePlayer = MPMoviePlayerController(contentURL: url)
		if let player = moviePlayer {
			player.view.frame = movieView.bounds
			player.prepareToPlay()
			player.scalingMode = .AspectFill
			movieView.addSubview(player.view)
		}
	}
	func removeVideo(){
		movieView.removeAllSubViews()
		println("remove")
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
		moviePlayer?.stop()
		movieView.removeAllSubViews()
		movieView.removeFromSuperview()
		whyDigiButton.image = nil
		introDigiButton.image = nil
		scanDigiButton.image = nil
		idleTimer.invalidate()
		mainView.removeAllSubViews()
		mainView.removeFromSuperview()
	}
}

extension UIView
{
	func removeAllSubViews()
	{
		for subView :AnyObject in self.subviews
		{
			subView.removeFromSuperview()
		}
	}
	
}
