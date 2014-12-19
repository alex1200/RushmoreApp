//
//  movieViewController.swift
//  Rushmore_Swift
//
//  Created by CyArk Intern on 11/21/14.
//  Copyright (c) 2014 CyArk. All rights reserved.
//

import Foundation
import MediaPlayer

class movieViewController : UIViewController{

	var moviePlayer : MPMoviePlayerController?
	var idleTimer = NSTimer()
	@IBOutlet weak var mainView: UIView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		playVideo("www/img-rus/media/mountrushmoreintensity")
		idleTimer = NSTimer.scheduledTimerWithTimeInterval(60*5, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)
	}
	@IBAction func unwindToViewController (segue: UIStoryboardSegue){
		println("unwind?movie")
		moviePlayer?.play()
	}
	/**************************************************/
	@IBOutlet weak var MtScButton: UIImageView!
	@IBOutlet weak var GeWaButton: UIImageView!
	@IBOutlet weak var ThJeButton: UIImageView!
	@IBOutlet weak var AbLiButton: UIImageView!
	@IBOutlet weak var ThRoButton: UIImageView!
	@IBOutlet weak var HaReButton: UIImageView!
	@IBOutlet weak var movieView: UIView!
	@IBOutlet weak var textView: UITextView!

	@IBAction func changeMovieMtSc(sender:UITapGestureRecognizer){
		MtScButton.image = UIImage(named: "video_1_on")
		GeWaButton.image = UIImage(named: "video_2")
		ThJeButton.image = UIImage(named: "video_3")
		AbLiButton.image = UIImage(named: "video_4")
		ThRoButton.image = UIImage(named: "video_5")
		HaReButton.image = UIImage(named: "video_6")
		playVideo("www/img-rus/media/mountrushmoreintensity_large")
		textView.text = "Mount Rushmore, also known as the Shrine of Democracy, is a National Memorial depicting four of the most prominent presidents of the first 150 years of the United States - George Washington, Abraham Lincoln, Theodore Roosevelt, and Thomas Jefferson. Mount Rushmore was carved into South Dakota's Black Hills from 1927 to 1941 under the direction of sculptor Gutzon Borglum. The project took a team of 400 drillers and assistant carvers fourteen years to complete. Over 1.7 billion pounds of stone were removed using dynamite, detailed drilling, and finishing processes."
	}
	@IBAction func changeMovieGeWa(sender:UITapGestureRecognizer){
		MtScButton.image = UIImage(named: "video_1")
		GeWaButton.image = UIImage(named: "video_2_on")
		ThJeButton.image = UIImage(named: "video_3")
		AbLiButton.image = UIImage(named: "video_4")
		ThRoButton.image = UIImage(named: "video_5")
		HaReButton.image = UIImage(named: "video_6")
		playVideo("www/img-rus/media/gw_head_large")
		textView.text = "George Washington, first president of the United States, led the early colonists in the American Revolutionary War to win independence from Great Britain. He was the father of the new country and laid the foundation of American democracy. Because of his importance, Washington is the most prominent figure on the mountain (1732-1799). George Washington's sculpture was started first on the mountain and dedicated on Independence Day in 1934."
	}
	@IBAction func changeMovieThJe(sender:UITapGestureRecognizer){
		MtScButton.image = UIImage(named: "video_1")
		GeWaButton.image = UIImage(named: "video_2")
		ThJeButton.image = UIImage(named: "video_3_on")
		AbLiButton.image = UIImage(named: "video_4")
		ThRoButton.image = UIImage(named: "video_5")
		HaReButton.image = UIImage(named: "video_6")
		playVideo("www/img-rus/media/tj_head_large")
		textView.text = "Thomas Jefferson, third president of the United States, was the author of the Declaration of Independence, a document which inspires democracies around the world. He also purchased the Louisiana Territory from France in 1803 which doubled the size of our country, adding all or part of fifteen present-day states (1743-1826). Thomas Jefferson's sculpture was started second on the mountain. Originally, the sculpture was started to the left of Washington but was later blasted off because of poor rock quality. A second Jefferson sculpture was started to the right of Washington and dedicated in 1936."
	}
	@IBAction func changeMovieAbLi(sender:UITapGestureRecognizer){
		MtScButton.image = UIImage(named: "video_1")
		GeWaButton.image = UIImage(named: "video_2")
		ThJeButton.image = UIImage(named: "video_3")
		AbLiButton.image = UIImage(named: "video_4_on")
		ThRoButton.image = UIImage(named: "video_5")
		HaReButton.image = UIImage(named: "video_6")
		playVideo("www/img-rus/media/al_head_large")
		textView.text = "Abraham Lincoln, the 16th president of the United States, held the nation together during its greatest trial, the Civil War. Lincoln believed his most sacred duty was the preservation of the union. It was his firm conviction that slavery must be abolished (1809-1865). Abraham Lincoln's sculpture was started third on the mountain and was placed on the far right side of the cliff. The dedication ceremony took place on September 17, 1937, the 150th anniversary of the signing of the Constitution of the United States in 1787."
	}
	@IBAction func changeMovieThRo(sender:UITapGestureRecognizer){
		MtScButton.image = UIImage(named: "video_1")
		GeWaButton.image = UIImage(named: "video_2")
		ThJeButton.image = UIImage(named: "video_3")
		AbLiButton.image = UIImage(named: "video_4")
		ThRoButton.image = UIImage(named: "video_5_on")
		HaReButton.image = UIImage(named: "video_6")
		playVideo("www/img-rus/media/tr_head_large")
		textView.text = "Theodore Roosevelt, 26th president of the United States, provided leadership when America experienced rapid economic growth as it entered the 20th Century. He was instrumental in negotiating the construction of the Panama Canal, linking the east and the west. He was known as the \"trust buster\" for his work to end large corporate monopolies and ensure the rights of the common working man (1858-1919). Theodore Roosevelt's sculpture was started fourth and had to be cut deeper into the mountain where there was better granite. The dedication ceremony took place on July 2, 1939."
	}
	@IBAction func changeMovieHaRe(sender:UITapGestureRecognizer){
		MtScButton.image = UIImage(named: "video_1")
		GeWaButton.image = UIImage(named: "video_2")
		ThJeButton.image = UIImage(named: "video_3")
		AbLiButton.image = UIImage(named: "video_4")
		ThRoButton.image = UIImage(named: "video_5")
		HaReButton.image = UIImage(named: "video_6_on")
		playVideo("www/img-rus/media/hall_of_records_large")
		textView.text = "Located along the small canyon behind the Mountain Sculpture, the Hall of Records is an unfinished chamber which was intended by sculptor Gutzon Borglum to be a repository of the American Story. Construction of the hall took place between July 1938 and July 1939, when a 70-foot tunnel was blasted into the mountain. It remains very roughly cut, and tapers to a point at the back. Work halted in 1939 when Congress directed that construction should be executed only on the faces. With Borglum's death in 1941 and American involvement in World War II, all work on the memorial came to a close on October 31, 1941."
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
		MtScButton.image = nil
		GeWaButton.image = nil
		ThJeButton.image = nil
		AbLiButton.image = nil
		ThRoButton.image = nil
		HaReButton.image = nil
		idleTimer.invalidate()
		moviePlayer?.stop()
		movieView.removeAllSubViews()
		movieView.removeFromSuperview()
		mainView.removeAllSubViews()
		mainView.removeFromSuperview()
	}
}