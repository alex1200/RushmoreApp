//
//  GameViewController.swift
//  3D_test2
//
//  Created by CyArk Intern on 11/5/14.
//  Copyright (c) 2014 CyArk. All rights reserved.
//

import UIKit
import QuartzCore
import SceneKit
import SpriteKit

class GameViewController: UIViewController {

	var idleTimer = NSTimer()

	@IBOutlet weak var mainView: UIView!
	@IBOutlet weak var sceneView: SCNView!
	@IBOutlet weak var titleText: UILabel!
	@IBOutlet weak var textView: UITextView!
	@IBOutlet weak var image1View: UIImageView!
	@IBOutlet weak var image2View: UIImageView!
	@IBOutlet weak var imagePopView: UIImageView!
	@IBOutlet weak var popView: UIView!
	@IBOutlet weak var popTextView: UITextView!
	
	@IBOutlet weak var loadingBGView: UIImageView!
	@IBOutlet weak var loadingView: UIActivityIndicatorView!

	@IBOutlet weak var arrowButtonLeft: UIButton!
	@IBOutlet weak var arrowButtonRight: UIButton!
	
	var sceneName = ""
	var oldScene = ""
	var refererName = ""
	var scene = SCNScene()
	
	var image1Main : UIImage!
	var image2Main : UIImage!
	
	var popText: String = ""
	var popText2: String = ""
	var modelArray: [String] = ["JeffHead","Sculpture","WashHead","Protractor","LinkHead","WinchMotor","Bricks","Pulley","Winch","HoneyComb","Wrench","Hammer","MashBit","Handle","HammerHeads","Drill","Crutch","Sledge","Tong","DrillBits","DrillHeads","WedgeHeads"]
	
	var devText : String = "On the 24th of February, 1815, the look-out at Notre-Dame de la Garde signalled the three-master, the Pharaon from Smyrna, Trieste, and Naples. As usual, a pilot put off immediately, and rounding the Chateau d'If, got on board the vessel between Cape Morgion and Rion island. Immediately, and according to custom, the ramparts of Fort Saint-Jean were covered with spectators; it is always an event at Marseilles for a ship to come into port, especially when this ship, like the Pharaon, has been built, rigged, and laden at the old Phocee docks, and belongs to an owner of the city."
	
	var timer = NSTimer()
    override func viewDidLoad() {
		println("start View")
        super.viewDidLoad()
		sceneSetup()

			idleTimer = NSTimer.scheduledTimerWithTimeInterval(60*10, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)

    }
	func sceneSetup (){
		// create a new scene
		println("start scene")
		oldScene = sceneName

		//This is where all the Artifact information is contained
		image1Main = nil
		image2Main = nil
		image1View.image = nil
		image2View.image = nil
		for node in scene.rootNode.childNodes as [SCNNode] {
			node.removeFromParentNode()
		}		
		scene = SCNScene()
		image1View.hidden = false
		image2View.hidden = false
		
		switch sceneName {
			case "JeffHead" :
				titleText.text = "Jefferson Mask"
				scene = SCNScene(named: "art.scnassets/JeffHead/JeffHead.dae")!
				image1View.image = UIImage(named: "Pulley 1_thumb")
				image2View.image = UIImage(named: "Pulley 2_thumb")
				image1Main = UIImage(named: "Pulley 2_thumb")!
				image2Main = UIImage(named: "Pulley 2_thumb")!
				textView.text = "Borglum was an experienced portrait sculptor.  To allow his team to see his vision, Borglum created plaster models or “guides” for the workmen. The mountain often caused Borglum to change his overall plan and he would have to create new plaster models. Can you spot any differences between the plaster model and the final sculpture?"
				popText = ""
				popText2 = ""
				refererName = "Studio"
				println("JeffHead")
			case "Sculpture" :
				titleText.text = "Sculpture"
				scene = SCNScene(named: "art.scnassets/Sculpture/Sculpture.dae")!
				image1View.image = UIImage(named: "Full Sculpture Model 1_thumb")
				image2View.image = UIImage(named: "Pulley 2_thumb")
				image1Main = UIImage(named: "Full Sculpture Model 1")!
				image2Main = UIImage(named: "Pulley 2_thumb")!
				textView.text = "In the Sculptor’s Studio, Gutzon Borglum built a scaled three-dimensional model of the complete sculpture. This allowed Borglum to transfer the dimensions of the model to the mountain by using a “Pointing Tool,” which proportioned the sculpture with a simple ratio of 1:12. One inch on the model represented one foot on the sculpture. "
				popText = "Sculptor Gutzon Borglum built a full model of the sculpture in his studio at the base of the mountain. He would adapt this sculpture when any artistic changes were made on the mountain."
				popText2 = ""
				refererName = "Studio"
				println("Sculpture")
			case "WashHead" :
				titleText.text = "Washington Mask"
				scene = SCNScene(named: "art.scnassets/WashHead/WashHead.dae")!
				image1View.image = UIImage(named: "Pulley 1_thumb")
				image2View.image = UIImage(named: "Pulley 2_thumb")
				image1Main = UIImage(named: "Pulley 2_thumb")!
				image2Main = UIImage(named: "Pulley 2_thumb")!
				textView.text = "Borglum was an experienced portrait sculptor. To allow his team to see his vision, Borglum created plaster models or “guides” for the workmen. The mountain often caused Borglum to change his overall plan and he would have to create new plaster models. Can you spot any differences between the plaster model and the final sculpture?"
				popText = ""
				popText2 = ""
				refererName = "Studio"
				println("WashHead")
			case "Protractor" :
				titleText.text = "Borglum Pointing Tool"
				scene = SCNScene(named: "art.scnassets/Protractor/Protractor.dae")!
				image1View.image = UIImage(named: "Pointing Tool 1_thumb")
				image2View.image = UIImage(named: "Pointing Tool 2_thumb")
				image1Main = UIImage(named: "Pointing Tool 1")!
				image2Main = UIImage(named: "Pointing Tool 2")!
				textView.text = "Sculptor Gutzon Borglum built a scaled three-dimensional model of the complete sculpture in his studio. This allowed Borglum to transfer the dimensions of the model to the mountain by using a “Pointing Tool.” This simple system was used in ancient Greece and allowed Borglum to find specific points using angles and measurements.\n\nSee the diagram below to learn how Borglum used this pointing tool!"
				popText = "Sculptor Gutzon Borglum would place the pointing tool on top of the models heads in the studio and a much larger one on the mountain where each head would be carved. By measuring specific points and angles he could find the precise locations for the heads. The sculpture was proportioned with a simple ratio of 1:12. One inch on the model represented one foot on the sculpture."
				popText2 = "The pointing tool was used to ensure that the mountain sculpture was to scale. Look for this special pointing tool balanced on top of one of the president’s heads in the Sculptor’s Studio! Because Borglum’s measurement system operates on a ratio of 1:12, one inch on this model equaled one foot on the mountain. "
				refererName = "Studio"
				println("Protractor")
			case "LinkHead" :
				titleText.text = "Lincoln Mask"
				scene = SCNScene(named: "art.scnassets/LinkHead/LinkHead.dae")!
				image1View.image = UIImage(named: "Lincoln Mask 1_thumb")
				image2View.image = UIImage(named: "Pulley 2_thumb")
				image1Main = UIImage(named: "Lincoln Mask 1")!
				image2Main = UIImage(named: "Pulley 2_thumb")!
				textView.text = "Borglum was an experienced portrait sculptor.  To allow his team to see his vision, Borglum created plaster models or “guides” for the workmen. The mountain often caused Borglum to change his overall plan and he would have to create new plaster models. Can you spot any differences between the plaster model and the final sculpture?"
				popText = "Presidential masks were brought up to the sculpture worksite to serve as a reference for the workmen."
				popText2 = ""
				refererName = "Studio"
				println("LinkHead")
			case "WinchMotor" :
				titleText.text = "Motorized Winch"
				scene = SCNScene(named: "art.scnassets/WinchMotor/WinchMotor.dae")!
				image1View.image = UIImage(named: "Motorized Winch 1_thumb")
				image2View.image = UIImage(named: "Motorized Winch 2_thumb")
				image1Main = UIImage(named: "Motorized Winch 1")!
				image2Main = UIImage(named: "Motorized Winch 2")!
				textView.text = "A motorized winch is used to pull in (wind up) or let out (wind out) or otherwise adjust the “tension” of a rope or cable. A motorized winch may be powered by electric, pneumatic, or internal combustion drives. This electric motorized winch powered the extensive transportation system carrying workers and equipment from the ground to the top of the sculpture and back."
				popText = "The electric motorized winch was located in the small shed, or winch house, visible here in the background. Cables are also visible, which supported the tram car. This winch was used to transport workers and equipment to and from the top of the mountain sculpture."
				popText2 = "Tram cars, such as the one pictured here, were supported by tensioned cables connected to solid anchor points. Look carefully at the cables to see how it is being impacted by the load of the tram car."
				refererName = "Outside"
				println("WinchMotor")
			case "Bricks" :
				titleText.text = "Blasting Cap Box"
				scene = SCNScene(named: "art.scnassets/Bricks/Bricks.dae")!
				image1View.image = UIImage(named: "Blasting Box 1_thumb")
				image2View.image = UIImage(named: "Pulley 2_thumb")
				image1Main = UIImage(named: "Blasting Box 1")!
				image2Main = UIImage(named: "Pulley 2_thumb")!
				textView.text = "Carving Mount Rushmore was exciting, but dangerous work. Over 90% of the mountain was carved using dynamite. The powdermen would cut and set charges of dynamite of specific size to remove precise amounts of rock.\n\nBlasting caps that came in boxes such as this one are small sensitive explosive devices that are generally used to detonate the larger and more powerful dynamite charges. "
				popText = "The dynamite was detonated at specific times of day, once at noon and again at 4pm ending the day. The dynamite was only detonated once all the workers were safely off the face of the sculpture. Due to safety measures like these, not one fatality occurred during the 14 years of construction."
				popText2 = ""
				refererName = "Outside"
				println("Bricks")
			case "Pulley" :
				titleText.text = "Pulley"
				scene = SCNScene(named: "art.scnassets/Pulley/Pulley.dae")!
				image1View.image = UIImage(named: "Pulley 1_thumb")
				image2View.image = UIImage(named: "Pulley 2_thumb")
				image1Main = UIImage(named: "Pulley 1")!
				image2Main = UIImage(named: "Pulley 2")!
				textView.text = "A pulley is a wheel on an axle designed to support the movement and change of direction of a cable or rope along the wheel’s circumference. This technique is used to increase the applied force when lifting heavy weights. A pulley also decreases friction or resistance when the same rope or cable is used to travel in a different direction under tension.\n\nPulleys were essential in transporting heavy materials and resources to the top of Mount Rushmore and for lifting heavy loads."
				popText = "Transportation of workers to the top of the mountain offered a unique challenge during the construction. A tram car such as this one carrying sculptor Gutzon Borglum (forefront) relied heavily on a system of winches and pulleys, and was used to move passengers and equipment to the top of the sculpture and back."
				popText2 = "A pulley is a wheel on an axle, and is designed to support the movement and change of direction of a cable or rope along the wheels circumference. This technique is used to increase the applied force when lifting heavy weights. A pulley also decreases friction or resistance when the same rope or cable is used to travel in a different direction under tension."
				refererName = "Outside"
				println("pulley")
			case "Winch" :
				titleText.text = "Mechanical Winch"
				scene = SCNScene(named: "art.scnassets/Winch/Winch.dae")!
				image1View.image = UIImage(named: "Mechanical Winch 1_thumb")
				image2View.image = UIImage(named: "Mechanical Winch 2a_thumb")
				image1Main = UIImage(named: "Mechanical Winch 1")!
				image2Main = UIImage(named: "Mechanical Winch 2a")!
				textView.text = "A mechanical winch is used to manually adjust the tension of a rope or cable. Consisting of a spool, or winch drum, and a hand crank, these winches were located on top of the sculpture and would lower the drillers over the face of the mountain.\n\nSee the diagram below to learn more about how this winch works!"
				popText = "Mechanical winch operators allowed the drillers, in their bosun chairs, to be safely lowered and raised on the mountain."
				popText2 = "Workers would hand crank mechanical winches to raise and lower the drillers over the face of the mountain. If the winch operators cranked too fast, the drillers in their bosun chairs could lose their balance and collide with the mountain. To help prevent this from occurring, “call boys” were hired to sit at the edge of the mountain and shout messages between the winch men and the driller to ensure safe transportation up and down the mountain. During the 14 years of construction, not a single worker was fatally injured."
				refererName = "Outside"
				println("Winch")
			case "HoneyComb" :
				titleText.text = "Honeycomb Stone"
				scene = SCNScene(named: "art.scnassets/HoneyComb/HoneyComb.dae")!
				image1View.image = UIImage(named: "Honeycomb 1_thumb")
				image2View.image = UIImage(named: "Honeycomb 2_thumb")
				image1Main = UIImage(named: "Honeycomb 1")!
				image2Main = UIImage(named: "Honeycomb 2")!
				textView.text = "To remove the last three to six inches of the carving surface, drillers and assistant carvers would drill holes into the granite very close together in a process called “honeycombing.”  The closely drilled holes would weaken the granite to the depth of the holes so that it could be removed by chisel or wedge tool.This 3D model shows a fragment of honeycombed granite. Such fragments were often sold to visitors as souvenirs when Mount Rushmore was being carved. "
				popText = "This diagram shows how workers used drills and wedge tools to break off large pieces of rock.\n\nCan you spot other tools in the collection in this diagram?"
				popText2 = "This driller is \"honeycombing\" a section of the mountain. After boring holes into the rock with a drill, the rock would be broken off using wedge tools and chisels. The surface underneath would then be smoothed to create the polished finish we see today."
				refererName = "Outside"
				println("HoneyComb")
			case "Wrench" :
				titleText.text = "Box-end wrench"
				scene = SCNScene(named: "art.scnassets/Wrench/Wrench.dae")!
				image1View.image = UIImage(named: "Box-end Wrench 1_thumb")
				image2View.image = UIImage(named: "Pulley 2_thumb")
				image1Main = UIImage(named: "Box-end Wrench 1")!
				image2Main = UIImage(named: "Pulley 2_thumb")!
				textView.text = "A box-end wrench is a wrench with a closed loop (called a socket) that fits over a nut or bolt head. Wrenches are used to tighten or loosen nuts in place."
				popText = "This diagram shows how a box-end wrench is used to tighten or loosen threaded fasteners.\n\nCan you imagine other tools that rely upon torque, or rotational force, to function?"
				popText2 = ""
				refererName = "BlackSmith"
				println("Wrench")
			case "Hammer" :
				titleText.text = "Small Sledgehammer"
				scene = SCNScene(named: "art.scnassets/Hammer/Hammer.dae")!
				image1View.image = UIImage(named: "Sledgehammer 1_thumb")
				image2View.image = UIImage(named: "Pulley 2_thumb")
				image1Main = UIImage(named: "Sledgehammer 1")!
				image2Main = UIImage(named: "Pulley 2_thumb")!
				textView.text = "Sledgehammers are heavy hammers used for jobs that require significant force, such as breaking through rock or melding hot iron.\n\nSledgehammers like the one modeled here were used in the Blacksmith’s Workshop to hammer hot iron to forge tools. The Blacksmith was responsible for making and repairing hundreds of tools every day to support the other workers at Mount Rushmore."
				popText = "The Blacksmith’s Workshop was located at the base of Mount Rushmore, and held a variety of tools."
				popText2 = ""
				refererName = "BlackSmith"
				println("Hammer")
			case "MashBit" :
				titleText.text = "Bumping Bit"
				scene = SCNScene(named: "art.scnassets/MashBit/MashBit.dae")!
				image1View.image = UIImage(named: "Bumping Bit 1_thumb")
				image2View.image = UIImage(named: "Bumping Bit 2_thumb")
				image1Main = UIImage(named: "Bumping Bit 1")!
				image2Main = UIImage(named: "Bumping Bit 2")!
				textView.text = "After dynamiting, workers broke away smaller sections of rock by honeycombing. This final process of smoothing the rock was known as “bumping.” The pneumatic drill was fit with a special bumping bit like this one to create a finished surface as smooth as a sidewalk."
				popText = "This photograph, taken at the entrance to the Hall of Records, shows the difference between the smoothed surface of the entrance and the surrounding rough textured rock. "
				popText2 = "The bumping process made it possible to create smooth complexions and defined facial features. Looking at the smooth rock that makes Washington’s and Jefferson’s profile, it is hard to believe this was once rough granite. "
				refererName = "BlackSmith"
				println("MashBit")
			case "Handle" :
				titleText.text = "Socket Wrench / Tire Iron"
				scene = SCNScene(named: "art.scnassets/Handle/Handle.dae")!
				image1View.image = UIImage(named: "Pulley 1_thumb")
				image2View.image = UIImage(named: "Pulley 2_thumb")
				image1Main = UIImage(named: "Pulley 2_thumb")!
				image2Main = UIImage(named: "Pulley 2_thumb")!
				textView.text = "Sometimes the blacksmith was called upon to create new tools to meet the workers' needs. This tool seems to combine features of a wrench with a punch tool. Can you imagine how it might have been used by the blacksmith? "
				popText = ""
				popText2 = ""
				refererName = "BlackSmith"
				println("Handle")
			case "HammerHeads" :
				titleText.text = "Backing Out Punch"
				scene = SCNScene(named: "art.scnassets/HammerHeads/HammerHeads.dae")!
				image1View.image = UIImage(named: "Pulley 1_thumb")
				image2View.image = UIImage(named: "Pulley 2_thumb")
				image1Main = UIImage(named: "Pulley 2_thumb")!
				image2Main = UIImage(named: "Pulley 2_thumb")!
				textView.text = "This blacksmithing tool is one type of blacksmith hole punch used to create holes in pieces of iron. Punches were used at the anvil to create and repair other tools used at the top of the mountain."
				popText = ""
				popText2 = ""
				refererName = "BlackSmith"
				println("HammerHeads")
			case "Drill" :
				titleText.text = "Pneumatic Drill"
				scene = SCNScene(named: "art.scnassets/Drill/Drill.dae")!
				image1View.image = UIImage(named: "Pneumatic Drill 1_thumb")
				image2View.image = UIImage(named: "Pneumatic Drill 2_thumb")
				image1Main = UIImage(named: "Pneumatic Drill 1")!
				image2Main = UIImage(named: "Pneumatic Drill 2")!
				textView.text = "Hand-held pneumatic drills, and jackhammers, are tools driven by compressed air. These tools are most commonly used today to drill holes, and break up rock, pavement, and concrete. Drillers at Mount Rushmore used these 75-pound pneumatic drills to carve into the mountain. These drills were powered by compressed air transported by steel pipe from compressors located at the base of the mountain. During the rigorous construction process, the drill bits would quickly become dull and need replacement."
				popText = "Blacksmiths were essential for the repair of drills and other tools used for the tough work of carving Mount Rushmore. The blacksmiths repaired and sharpened hundreds of tools each day in their workshop. Their efforts to support the carvers working on the memorial enabled these tools to stay in use during the demanding carving process.  "
				popText2 = "Many of the presidential features at Mount Rushmore were carved using drills with different shaped drill bits. Look for the different kinds of markings pneumatic drills make on the rock surface."
				refererName = "BlackSmith"
				println("Drill")
			case "Crutch" :
				titleText.text = "Shaper"
				scene = SCNScene(named: "art.scnassets/Crutch/Crutch.dae")!
				image1View.image = UIImage(named: "Shaper 1_thumb")
				image2View.image = UIImage(named: "Shaper 2_thumb")
				image1Main = UIImage(named: "Shaper 1")!
				image2Main = UIImage(named: "Shaper 2")!
				textView.text = "Shapers are blacksmithing tools used in anvils to mold metal or other material into a particular pattern or form. Blacksmiths worked every day in the workshop to make, repair, and sharpen all tools used on the top of the mountain sculpture."
				popText = "The variety of tools used on the mountain sculpture was extensive. These tools were fixed and maintained daily in the workshop at the base of the mountain."
				popText2 = "This blacksmith is engaging the press in the workshop. Tools, such as shapers, were used in the Blacksmith’s Workshop to help create and fix tools and materials needed for the construction."
				refererName = "BlackSmith"
				println("Crutch")
			case "Sledge" :
				titleText.text = "Fuller"
				scene = SCNScene(named: "art.scnassets/Sledge/Sledge.dae")!
				image1View.image = UIImage(named: "Fuller 1_thumb")
				image2View.image = UIImage(named: "Fuller 2_thumb")
				image1Main = UIImage(named: "Fuller 1")!
				image2Main = UIImage(named: "Fuller 2")!
				textView.text = "A fuller is a blacksmithing tool used in anvils to produce a rounded or bevel groove on a surface. Fullers are a type of swage, or shaping tools, that have a cylindrical or beveled face, as visualized in this model."
				popText = "The Blacksmith’s Workshop was located at the base of Mount Rushmore, and held a variety of tools used in the creation and maintenance of carving tools. Take a look at some of the tools stored in the workshop."
				popText2 = "Tools like fullers and other shaping tools were used at the anvil to shape hot metal to create, repair, and sharpen sculpting tools. Here, you can see the forge (L) and the press (R) in their original positions within the Blacksmith’s Shop."
				refererName = "BlackSmith"
				println("Sledge")
			case "Tong" :
				titleText.text = "Blacksmith Tong"
				scene = SCNScene(named: "art.scnassets/Tong/Tong.dae")!
				image1View.image = UIImage(named: "Blacksmith Tong 1_thumb")
				image2View.image = UIImage(named: "Blacksmith Tong 2_thumb")
				image1Main = UIImage(named: "Blacksmith Tong 1")!
				image2Main = UIImage(named: "Blacksmith Tong 2")!
				textView.text = "Blacksmith tongs are used to assist a blacksmith in holding hot iron at the anvil, forge, or press. By holding the iron using tongs, a blacksmith is able to safely move the metal from the forge to the anvil or press. The blacksmith can then flatten the metal or deliver heavy blows using a sledgehammer with their other hand."
				popText = "Tools like blacksmith tongs were used to hold hot iron at the forge, anvil, or press as the blacksmith shapes the metal. Here, you can see the forge (L) and the press (R) in their original positions within the Blacksmith’s Shop."
				popText2 = "This blacksmith holds a heated tool with tongs while engaging the press to flatten and reshape the metal."
				refererName = "BlackSmith"
				println("Tong")
			case "DrillBits" :
				titleText.text = "Drill Bit"
				scene = SCNScene(named: "art.scnassets/DrillBits/DrillBits.dae")!
				image1View.image = UIImage(named: "Drill Bit 1_thumb")
				image2View.image = UIImage(named: "Drill Bit 2_thumb")
				image1Main = UIImage(named: "Drill Bit 1")!
				image2Main = UIImage(named: "Drill Bit 2")!
				textView.text = "Drill bits can be a variety of different sizes and shapes according to the type of application.\n\nDrill bits at Mount Rushmore were attached to pneumatic drills. Because of the difficult task of breaking up the granite, drill bits became dull after a few minutes of work and needed regular replacement. The blacksmiths working at Mount Rushmore would reshape hundreds of drill bits each day."
				popText = "Sculptor Gutzon Borglum (foreground) regularly inspected the worker’s progress on the mountain sculpture. "
				popText2 = "The blacksmiths at Mount Rushmore worked daily to reshape and reform tools, especially drill bits, in the press. "
				refererName = "BlackSmith"
				println("DrillBits")
			case "DrillHeads" :
				titleText.text = "Wedge Tool"
				scene = SCNScene(named: "art.scnassets/DrillHeads/DrillHeads.dae")!
				image1View.image = UIImage(named: "Wedge Tool 1_thumb")
				image2View.image = UIImage(named: "Wedge Tool 2_thumb")
				image1Main = UIImage(named: "Wedge Tool 1")!
				image2Main = UIImage(named: "Wedge Tool 2")!
				textView.text = "The wedge tool, characterized by a shaped or beveled cutting edge at its end, is fitted to a jackhammer. This tool was used to remove honeycombed sections of rock."
				popText = "The vertical and horizontal lines in the eye, below the worker, and to the workers left are remnants of the wedge tool after removal of the honeycombed rock.\n\nMount Rushmore’s workers used drills with wedge tools to connect the holes in the honeycombed rock continuing the rock removal process."
				popText2 = "Workers first were able to drill mostly vertical holes, spaced closely together using dynamite for removal of large sections of rock. The powderman were able to blast off these large portions of rock to within 3 to 6 inches of what was going to become the finished sculpture. The workers then drilled closely spaced horizontal holes to the depth of the finished sculpture to weaken the rock; this step was called “honeycombing” the granite. Then the workers used drills with wedge tools to connect the holes in the honeycombed rock removing sections at a time. The rock would then be smoothed to create the polished surface we see today."
				refererName = "BlackSmith"
				println("DrillHeads")
			case "WedgeHeads" :
				titleText.text = "Hardy Tool"
				scene = SCNScene(named: "art.scnassets/WedgeHeads/WedgeHeads.dae")!
				image1View.image = UIImage(named: "Hardy Tool 1_thumb")
				image2View.image = UIImage(named: "Hardy Tool 2_thumb")
				image1Main = UIImage(named: "Hardy Tool 1")!
				image2Main = UIImage(named: "Hardy Tool 2")!
				textView.text = "A hardy tool is a blacksmithing tool used in anvils. The hardy tool has a square shank, and rests in the hardy hole of an anvil. Different hardy tools are used to form and cut metal for different purposes. "
				popText = "This photograph shows a hardy in the hardy hole of an anvil. The hardy has a square shank to prevent the tool from rotating during use."
				popText2 = "This diagram shows how a hardy tool works. By placing the hardy in the hardy hole of an anvil, a blacksmith can meld and shape different kinds of tools used in the construction of Mount Rushmore."
				refererName = "BlackSmith"
				println("WedgeHeads")

			default:
				scene = SCNScene(named: "art.scnassets/ship.dae")!
				println("default")
				break
		}
		
		if (popText == ""){
			image1View.hidden = true
			}
		if (popText2 == ""){
			image2View.hidden = true
			}
		// create and add a camera to the scene
		let cameraNode = SCNNode()
		cameraNode.camera = SCNCamera()
		scene.rootNode.addChildNode(cameraNode)
		
		// place the camera
		cameraNode.position = SCNVector3(x: 0, y: 0, z: 2)
		// create and add a light to the scene
		let lightNode = SCNNode()
		lightNode.light = SCNLight()
		lightNode.light!.type = SCNLightTypeOmni
		lightNode.position = SCNVector3(x: 0, y: 1, z: 10)
		scene.rootNode.addChildNode(lightNode)

		// create and add a light to the scene
		let lightNode2 = SCNNode()
		lightNode2.light = SCNLight()
		lightNode2.light!.type = SCNLightTypeOmni
		lightNode2.position = SCNVector3(x: 0, y: -15, z: -15)
		scene.rootNode.addChildNode(lightNode2)
		
		// create and add an ambient light to the scene
		let ambientLightNode = SCNNode()
		ambientLightNode.light = SCNLight()
		ambientLightNode.light!.type = SCNLightTypeAmbient
		ambientLightNode.light!.color = UIColor.darkGrayColor()
		scene.rootNode.addChildNode(ambientLightNode)
		

		switch refererName {
			case "BlackSmith":
				if (sceneName == "Wrench" || sceneName == "Hammer" || sceneName == "MashBit" || sceneName == "Handle" || sceneName == "HammerHeads" || sceneName == "Drill") {
					scene.background.contents = UIImage(named: "6_blacksmith_bench_bg")
					println("6_blacksmith_bench_bg")
				}
				else {
					scene.background.contents = UIImage(named: "8_blacksmith_forge_bg")
					println("8_blacksmith_forge_bg")
				}
			case "Outside" :
				scene.background.contents = UIImage(named: "9_winch_house_bg")
				println("9_winch_house_bg")
			case "Studio" :
				scene.background.contents = UIImage(named: "3_sculptors_studio_bg")
				println("3_sculptors_studio_bg")
			default:
				break
		}

		sceneView.scene = scene
		sceneView.allowsCameraControl = true
		
		// configure the view
		sceneView.backgroundColor = UIColor.blackColor()
		
		timer = NSTimer.scheduledTimerWithTimeInterval(3, target: self, selector: "loadTimer", userInfo: nil, repeats: true)

	}
	
	func loadTimer(){
		arrowButtonLeft.enabled = true
		arrowButtonRight.enabled = true
		loadingBGView.hidden = true
		loadingView.hidden = true
		timer.invalidate()
	}

	@IBAction func image1Click(sender: UITapGestureRecognizer) {
		imagePopView.image = image1Main
		if popText == "" {popText = devText}
		popTextView.text = popText;
		popView.hidden = false
	}
	
	@IBAction func image2Click(sender: UITapGestureRecognizer) {
		imagePopView.image = image2Main
		if popText2 == "" {popText2 = devText}
		popTextView.text = popText2;
		popView.hidden = false
	}
	
	@IBAction func popClick(sender: UITapGestureRecognizer) {
		popView.hidden = true
	}
	
	@IBAction func backButton(sender: UIBarButtonItem) {
		switch refererName {
		case "BlackSmith" :
			sceneView.removeAllSubViews()
			self.presentingViewController?.dismissViewControllerAnimated(false, completion:nil)
			NSURLCache.sharedURLCache().removeAllCachedResponses()
		case "Outside" :
			sceneView.removeAllSubViews()
			self.dismissViewControllerAnimated(false, completion:nil)
			NSURLCache.sharedURLCache().removeAllCachedResponses()
		case "Studio" :
			sceneView.removeAllSubViews()
			self.dismissViewControllerAnimated(false, completion:nil)
		default:
			sceneView.removeAllSubViews()
			self.dismissViewControllerAnimated(false, completion:nil)
			NSURLCache.sharedURLCache().removeAllCachedResponses()
		break
		}
		
		
	}
	override func viewWillDisappear(animated: Bool) {
	}
	
	@IBAction func nexModelClick(sender: UIButton) {
		timer.invalidate()
		arrowButtonLeft.enabled = false
		arrowButtonRight.enabled = false
		loadingBGView.hidden = false
		loadingView.hidden = false

		var index = find(modelArray, sceneName)
		if (index == modelArray.count-1){
			index! = -1
		}
		sceneName = modelArray[index!+1]
		sceneView.removeAllSubViews()
		sceneSetup ()
		println (sceneName)

	}
	
	@IBAction func lastModelClick(sender: UIButton) {
		timer.invalidate()
		arrowButtonLeft.enabled = false
		arrowButtonRight.enabled = false
		loadingBGView.hidden = false
		loadingView.hidden = false

		var index = find(modelArray, sceneName)
		if (index! == 0){
			index! = modelArray.count
		}
		sceneName = modelArray[index!-1]
		println (sceneName)
		sceneSetup ()
		
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
	override func viewDidDisappear(animated: Bool) {
		image1Main = nil
		image2Main = nil
		image1View.image = nil
		image2View.image = nil
		timer.invalidate()
		idleTimer.invalidate()
		for node in scene.rootNode.childNodes as [SCNNode] {
			node.removeFromParentNode()
		}
		sceneView.removeAllSubViews()
		sceneView.removeFromSuperview()
		sceneView = nil
		mainView.removeAllSubViews()
		mainView.removeFromSuperview()

		println("ByeBye Memory");
	}
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Release any cached data, images, etc that aren't in use.
		NSURLCache.sharedURLCache().removeAllCachedResponses()
		println("removeCache")
    }
	
	override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {

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
}
