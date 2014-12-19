//
//  PartnerViewController.swift
//  Rushmore_Swift
//
//  Created by CyArk Intern on 11/21/14.
//  Copyright (c) 2014 CyArk. All rights reserved.
//

import Foundation
import UIKit

class PartnerViewController : UIViewController {
	@IBOutlet weak var partnerText: UITextView!
	var idleTimer = NSTimer()
	
	@IBOutlet weak var npsButton: UIImageView!
	@IBOutlet weak var kffButton: UIImageView!
	@IBOutlet weak var cddvButton: UIImageView!
	@IBAction func unwindToViewController (segue: UIStoryboardSegue){
		println("unwind?")
	}
	
	@IBAction func changePartnerNPS(sender:UITapGestureRecognizer){
		partnerText.text = "The National Park Service (NPS) was created by an act of Congress in 1916. Today, it cares for and makes available for public enjoyment, education, and inspiration a nationwide system of parks, monuments, historic sites, and recreational areas.  With the help of partners and the American people, NPS safeguards these special scenic, historic, and cultural places, sharing their stories with hundreds of millions of visitors every year.\n\nMount Rushmore was designated as a National Memorial in 1925 and it has been in the care of the National Park Service since 1933 where its mission has been  to preserve and protect Mount Rushmore National Memorial while providing for the education and enjoyment of the public."
		npsButton.image = UIImage (named: "DigitalPreservation_NPS_on")
		kffButton.image = UIImage (named: "DigitalPreservation_CyArk_off")
		cddvButton.image = UIImage (named: "DigitalPreservation_CDDV_off")
	}
	@IBAction func changePartnerCDDV(sender:UITapGestureRecognizer){
		partnerText.text = "The Centre for Digital Documentation and Visualisation is a new commercial partnership between Historic Scotland and the Glasgow School of Art's Digital Design Studio - using state-of-the-art laser scanning technology and 3D visualisation software to digitally record heritage sites around the globe and enable virtual access.  The Centre grew from the Scottish Ten, a project launched in 2009 to digitally document Scotland's five World Heritage Sites in addition to five international World Heritage Sites."
		npsButton.image = UIImage (named: "DigitalPreservation_NPS_off")
		kffButton.image = UIImage (named: "DigitalPreservation_CyArk_off")
		cddvButton.image = UIImage (named: "DigitalPreservation_CDDV_on")
	}
	@IBAction func changePartnerKFF(sender:UITapGestureRecognizer){
		partnerText.text = "Originally a project of the Kacyra Family Foundation (KFF), CyArk is now an independent 501c3 nonprofit organization with the mission of digitally preserving cultural heritage sites through collecting, archiving, and providing open access to data created by laser scanning, digital modeling, and other state-of-the-art technologies.\n\nKFF/CyArk is working with the National Parks Service at the Mount Rushmore National Memorial in a multi-year project.  The first phase of this project was the digital preservation of Mount Rushmore through laser scanning, High Dynamic Range photography (HDR), and other state-of-the-art technologies.  With the data collected, KFF/CyArk has been working to create a complete digital model of the Mountain, drawings and other multimedia to be used by the park for conservation, and educational content to be used at the park and in classrooms everywhere.  The content within this app, and much more, are available for free online viewing at CyArk website.  If you like this free app, and would like to support us, consider donating to our cause. "
		npsButton.image = UIImage (named: "DigitalPreservation_NPS_off")
		kffButton.image = UIImage (named: "DigitalPreservation_CyArk_on")
		cddvButton.image = UIImage (named: "DigitalPreservation_CDDV_off")
	}
	@IBAction func changePartner(sender:UITapGestureRecognizer){
		partnerText.text = "The Digital Preservation of Mount Rushmore National Memorial was undertaken by the National Park service in collaboration with the Kacyra Family Foundation's CyArk project and the Centre for Digital Documentation and Visualisation (CDDV).\nField Documentation at Mount Rushmore, including laser scanning and photography, took place in May of 2010.  All the data collected has been used to create a variety of media for digital preservation.  This media will be used for the on-going preservation and conservation of the mountain and for public education and interpretation of the memorial."
		npsButton.image = UIImage (named: "DigitalPreservation_NPS_off")
		kffButton.image = UIImage (named: "DigitalPreservation_CyArk_off")
		cddvButton.image = UIImage (named: "DigitalPreservation_CDDV_off")
	}
	override func viewDidLoad(){
		idleTimer = NSTimer.scheduledTimerWithTimeInterval(60, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)
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
		npsButton.image = nil
		kffButton.image = nil
		cddvButton.image = nil
	}
}