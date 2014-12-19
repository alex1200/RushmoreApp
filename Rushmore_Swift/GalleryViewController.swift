//
//  ViewController.swift
//  UICollectionView
//
//  Created by Brian Coleman on 2014-09-04.
//  Copyright (c) 2014 Brian Coleman. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	
	@IBOutlet var collectionView: UICollectionView?
	@IBOutlet weak var mainView: UIView!
	@IBOutlet weak var segmentedControl: UISegmentedControl!
	@IBOutlet weak var imagePopView: UIImageView!
	@IBOutlet weak var popView: UIView!
	@IBOutlet weak var popTextView: UITextView!
	
	@IBOutlet weak var nextButton: UIImageView!
	@IBOutlet weak var lastButton: UIImageView!
	@IBAction func unwindToViewController (segue: UIStoryboardSegue){
		println("unwind?")
	}
	
	var idleTimer = NSTimer()
	var offset = 0
	var gallery = "p" //Contempoary
	var min = 0
	var max = 19;
	var lastImage = ""
	var indexArray = [String: String]()
	var textArray : [String: String] =
		["p6" : "Photograph of the carving marks inside the Hall of Records"
			, "p7" :"Photograph of the entrance to the Hall of Records, located in Monument Valley directly behind the Mountain Sculpture"
			, "p8" :  "Photograph of the team scanning inside the Hall of Records"
			, "p10" :  "Photograph of the Sculptor's Studio during the winter season"
			, "p11" :  "Photograph of George Washington and the granite mountain taken from below"
			, "p12" :  "Photograph of Lincoln overlooking the Black Hills landscape"
			, "p13" :  "Photograph of the ropes team performing a scan of Lincoln's face using the tripod rig"
			, "p14" :  "Photograph showing the honeycomb pattern on Theodore Roosevelt's moustache"
			, "p15" :  "Photograph of George Washington taken from the Talus Slope below the sculpture. The ropes team can be seen ascending the Mountain Sculpture."
			, "p16" :  "Photograph of the ropes team performing a scan of Jefferson's face using the tripod rig"
			, "p17" :  "Photograph of the ropes team performing a scan of Jefferson's face"
			, "p18" :  "Photograph looking into the Hall of Records. Workers drilled channels into the rock to place dynamite."
			, "p19" :  "Photograph of the carving marks inside the Hall of Records"
			, "p1" :  "Photograph of George Washington with the ropes team ascending the mountain"
			, "p2" :  "Photograph of the carving marks inside the Hall of Records"
			, "p3" :  "Photograph of the team scanning inside the Sculptor's Studio. The scale model of the Mountain Sculpture can be seen in the background."
			, "p4" :  "Photograph of the team scanning the presidents near Theodore Roosevelt"
			, "p5" :  "Photograph of the ropes team performing a scan of Lincoln's face using the tripod rig"
			, "h1" :  "Historic photograph of early construction work on the Lincoln sculpture, showing dust from the dynamite blasts"
			, "h2" :  "Historic photograph of the Mountain Sculpture with a historic road and car in the foreground"
			, "h3" :  "Historic photograph of an early scale model in the first studio at Mount Rushmore"
			, "h4" :  "Historic photograph of Washington under construction"
			, "h5" :  "Historic aerial photograph of Washington and Jefferson under construction"
			, "h6" :  "Historic photograph of Mount Rushmore"
			, "h7" :  "Historic photograph of the Black Hills, prior to the construction of Mount Rushmore. This granite mountain was sacred to the Lakota Native Americans, who called it \"Six Grandfathers\"."
			, "h8" :  "Historic aerial photograph of Mount Rushmore under construction"
			, "h9" :  "Historic photograph of early construction work on the second Jefferson sculpture. An earlier Jefferson sculpture was attempted on the left side of Washington and demolished due to poor granite."
			, "h11" :  "Historic photograph of Borglum's scale model of Mount Rushmore"
			, "h13" :  "Historic photograph of Gutzon Borglum and a worker ascending the mountain in front of Thomas Jefferson"
			, "h14" :  "Historic photograph of Gutzon Borglum and two drillers working on Mount Rushmore"
			, "h16" :  "Historic photograph of Mount Rushmore under construction"
			, "h40" :  "Historic photograph of Borglum's scale model of Mount Rushmore"
			, "h42" :  "Historic photograph of President Coolidge delivering the dedication speech on August 10, 1927"
			, "h19" :  "Historic photograph of the first Jefferson sculpture to the left of Washington"
			, "h24" :  "Historic photograph of a worker descending from Washington's head in a Bosun chair"
			, "h27" :  "Historic photograph of Washington, taken from the historic route taken by workers to get to the Mountain Sculpture"
			, "h29" :  "Historic photograph of a driller \"honeycombing\" the mountain"
			, "h33" :  "Historic photograph showing early construction work on the second Jefferson sculpture. An earlier Jefferson sculpture was attempted on the left side of Washington and demolished due to poor granite."
			, "h35" :  "Historic photograph of Gutzon Borglum inspecting the face of Thomas Jefferson"
			, "h37" :  "Historic photograph of Gutzon Borglum inspecting the face of Thomas Jefferson"
			, "h38" :  "Historic photograph of Gutzon Borglum repelling off Mount Rushmore in a Bosun chair"
			, "h39" :  "Historic photograph of Borglum mounting an American flag on Mount Rushmore"
			, "h41" :  "Historic photograph of drillers working the sculpture in Bosun chairs"
			, "persp1" :  "Perspective of Lincoln's Mask, created from close-range scan data"
			, "persp2" :  "Perspective of mesh data from the 1/12 scale model found within the Sculptor's Studio, created from laser scan data"
			, "persp3" :  "Perspective of Mount Rushmore, created from laser scan data"
			, "persp4" :  "Transition image of the four presidents of Mount Rushmore and the scanning team, created from photography and laser scan data"
			, "persp6" :  "Perspective of the honeycomb pattern inside the Hall of Records, created from photo-textured laser scan data"
			, "persp7" :  "Perspective of George Washington, created from laser scan data"
			, "persp8" :  "Perspective of the Hall of Records, created from laser scan data"
			, "persp9" :  "Perspective of the honeycomb pattern inside the Hall of Records, created from laser scan data"
			, "persp10" :  "Perspective of Borglum's Viewing Terrace, created from laser scan data"
			, "persp11" :  "Perspective of the carving details of Lincoln's right eye, created from laser scan data"
			, "persp12" :  "Perspective of the ropes team performing a scan of Washington's head"
			, "persp13" :  "Perspective of the Hall of Records, created from photo-textured laser scan data"
			, "persp15" :  "Perspective of the Borglum Terrace taken from the northwest, created from photo-textured laser scan data"
			, "persp16" :  "Perspective of the Sculptor's Studio created from photo-textured laser scan data"
			, "persp17" :  "Perspective of the Avenue of Flags, created from photo-textured laser scan data"
			, "persp18" :  "Perspective of Abraham Lincoln, created from laser scan data"
			, "persp19" :  "Perspective of Theodore Roosevelt, created from laser scan data"
			, "persp20" :  "Perspective of George Washington, created from laser scan data"
			, "persp21" :  "Perspective of Thomas Jefferson, created from laser scan data"
			, "persp22" :  "Perspective of the Avenue of Flags, created from laser scan data"
			, "persp23" :  "Aerial view of Mount Rushmore, created from laser scan data overlaid onto aerial imagery"
			, "persp24" :  "Mesh of Thomas Jefferson and Theodore Roosevelt, created from laser scan data"
			, "persp25" :  "Mesh of Mount Rushmore, created from photo-textured laser scan data"]
	
	@IBAction func segmentedChanged(sender:UISegmentedControl){
		println ("Click Move")
		switch segmentedControl.selectedSegmentIndex	{
			case 0:
				gallery = "p" //Contempoary
				max = 18
				segmentedControl.setImage(UIImage(named : "Images_PhotosTab_on")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 0)
				segmentedControl.setImage(UIImage(named : "Images_HistoricPhotosTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 1)
				segmentedControl.setImage(UIImage(named : "Images_PerspectivesTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 2)
			case 1:
				gallery = "h" //Historic
				max = 25
				segmentedControl.setImage(UIImage(named : "Images_PhotosTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 0)
				segmentedControl.setImage(UIImage(named : "Images_HistoricPhotosTab_on")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 1)
				segmentedControl.setImage(UIImage(named : "Images_PerspectivesTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 2)
			case 2:
				gallery = "persp" //PointCloud
				max = 23
				segmentedControl.setImage(UIImage(named : "Images_PhotosTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 0)
				segmentedControl.setImage(UIImage(named : "Images_HistoricPhotosTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 1)
				segmentedControl.setImage(UIImage(named : "Images_PerspectivesTab_on")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 2)
			default:
			break;
		}
		offset = 0
		println (gallery)
		collectionView?.reloadData()
		
		imagePopView.userInteractionEnabled = true
		imagePopView.multipleTouchEnabled = true
	}
	
	func swipe(){
		println("swipe")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		idleTimer = NSTimer.scheduledTimerWithTimeInterval(60*5, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)
		// Do any additional setup after loading the view, typically from a nib.
		let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
		layout.sectionInset = UIEdgeInsets(top: 20, left: 0, bottom: 10, right: 0)
		layout.itemSize = CGSize(width: 196, height: 120)
		collectionView!.dataSource = self
		collectionView!.delegate = self
		collectionView!.registerClass(CollectionViewCell.self, forCellWithReuseIdentifier: "CollectionViewCell")
		collectionView?.reloadData()

		segmentedControl.frame.size.height = 52
		segmentedControl.setImage(UIImage(named : "Images_PhotosTab_on")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 0)
		segmentedControl.setImage(UIImage(named : "Images_HistoricPhotosTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 1)
		segmentedControl.setImage(UIImage(named : "Images_PerspectivesTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 2)
	}
	
	func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return max
	}
	
	func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		while(UIImage(named: gallery+String(indexPath.row+offset)+"_thumb") == nil){
			offset++
		}
		let cell = collectionView.dequeueReusableCellWithReuseIdentifier("CollectionViewCell", forIndexPath: indexPath) as CollectionViewCell
		cell.backgroundColor = UIColor.blackColor()
		cell.imageView?.image = UIImage(named: gallery+String(indexPath.row+offset)+"_thumb")
		cell.imageView?.sizeToFit();
		println (String(indexPath.row)+"("+String(offset)+")")
		indexArray[String(indexPath.row)] = String(indexPath.row+offset)
		return cell

	}
	
	func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
		imagePopView.image = UIImage(named: gallery+indexArray[String(indexPath.row)]!)
		imagePopView.sizeToFit()
		var width = imagePopView.image?.size.width
		var height = imagePopView.image?.size.height
		var newLeftMargin = ( 1024 - width! ) / 2
		println (newLeftMargin)
		imagePopView.frame.origin.x = newLeftMargin

		popTextView.text = textArray[gallery+indexArray[String(indexPath.row)]!];
		popView.hidden = false
		lastImage = String(indexPath.row)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func popClick(sender: UITapGestureRecognizer) {
		println("hidepopup")
		popView.hidden = true
	}
	
	@IBAction func swipping (recognizer : UISwipeGestureRecognizer){
		println("swipe")
		last()
	}
	
	@IBAction func swippingRight (recognizer : UISwipeGestureRecognizer){
		println("swipeRight")
		next()
	}
	
	@IBAction func lastAction(sender: UITapGestureRecognizer) {
		last()
	}
	
	var globalIndex : String = ""
	var globalDirection : Int = 0
	
	func last() {
		nextButton.hidden = false
		println("lastButton")
		var index = String(lastImage.toInt()!-1)
		println(index)
		if (index.toInt() < min && gallery == "p"){
			println("end of p")
			lastButton.hidden = true
		}
		else{
			if (index.toInt() == min && gallery == "p"){
				println("end of p")
				lastButton.hidden = true
			}
			else{
				lastButton.hidden = false
			}
		
			if (index.toInt() < min && gallery != "p"){
				println("end of gallery")
				switch gallery	{
				case "h":
					gallery = "p" //Contempoary
					max = 18
					lastImage = String(17)
					index = String(lastImage.toInt()!)
					segmentedControl.setImage(UIImage(named : "Images_PhotosTab_on")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 0)
					segmentedControl.setImage(UIImage(named : "Images_HistoricPhotosTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 1)
					segmentedControl.setImage(UIImage(named : "Images_PerspectivesTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 2)
					println("h - p")
				case "persp":
					gallery = "h" //Historic
					max = 25
					lastImage = String(24)
					index = String(lastImage.toInt()!)
					segmentedControl.setImage(UIImage(named : "Images_PhotosTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 0)
					segmentedControl.setImage(UIImage(named : "Images_HistoricPhotosTab_on")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 1)
					segmentedControl.setImage(UIImage(named : "Images_PerspectivesTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 2)
					println("persp - h")
				default:
					break;
				}
				offset = 0
				globalDirection = -1
				globalIndex = index
				reloadCollection()

			}
			else{
				globalDirection = -1
				globalIndex = index
				printImage()
			}
		}
		
	}
	func printImage(){
		imagePopView.image = UIImage(named: gallery+indexArray[globalIndex]!)
		imagePopView.sizeToFit()
		var width = imagePopView.image?.size.width
		var height = imagePopView.image?.size.height
		var newLeftMargin = ( 1024 - width! ) / 2
		println (newLeftMargin)
		imagePopView.frame.origin.x = newLeftMargin
	
		popTextView.text = textArray[gallery+indexArray[globalIndex]!];
		popView.hidden = false
		lastImage = String(lastImage.toInt()!+globalDirection)
	}
	func reloadCollection(){
		collectionView?.reloadData()
		
		let aSelector : Selector = "reloadComplete"
		var timer = NSTimer.scheduledTimerWithTimeInterval(1,
			target: self,
			selector: aSelector,
			userInfo: nil,
			repeats: false)
		
		
	}

	func reloadComplete (){
		println("reload")
		printImage()
	}
	@IBAction func nextAction(sender: UITapGestureRecognizer) {
		next()
	}
	
	func next() {
		println("nextButton")
		lastButton.hidden = false
		var index : String = String(lastImage.toInt()!+1)
		if (index.toInt()  > (max-1) && gallery == "persp"){
			println("end of persp")
			nextButton.hidden = true
		}
		else{
			if (index.toInt()  == (max-1) && gallery == "persp"){
				println("end of persp")
				nextButton.hidden = true
			}
			else{
				nextButton.hidden = false
			}
			println("Gallery: " + gallery)
			println("index: " + String(index))
			println(" max: " + String(max))
			if (index.toInt()  > max-1 && gallery != "persp"){
				println("end of gallery")
				switch gallery	{
				case "p":
					gallery = "h" //Contempoary
					max = 25
					lastImage = String(0)
					index = String(lastImage.toInt()!)
					segmentedControl.setImage(UIImage(named : "Images_PhotosTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 0)
					segmentedControl.setImage(UIImage(named : "Images_HistoricPhotosTab_on")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 1)
					segmentedControl.setImage(UIImage(named : "Images_PerspectivesTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 2)
					println("p - h")
				case "h":
					gallery = "persp" //Historic
					max = 23
					lastImage = String(0)
					index = String(lastImage.toInt()!)
					segmentedControl.setImage(UIImage(named : "Images_PhotosTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 0)
					segmentedControl.setImage(UIImage(named : "Images_HistoricPhotosTab_off")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 1)
					segmentedControl.setImage(UIImage(named : "Images_PerspectivesTab_on")!.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal), forSegmentAtIndex: 2)
					println("h - persp")
				default:
					break;
				}
				offset = 0
				reloadCollection()
			}
			globalDirection = 1
			globalIndex = index
			printImage()
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
		idleTimer.invalidate()
		collectionView?.removeAllSubViews()
		collectionView?.removeFromSuperview()
		mainView.removeAllSubViews()
		mainView.removeFromSuperview()
		
	}
}


 