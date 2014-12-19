import Foundation
import UIKit
import WebKit

class WebViewController: UIViewController, UIWebViewDelegate {
	
	var idleTimer = NSTimer()
	
	@IBOutlet weak var mainView: UIView!
	@IBOutlet weak var containerView : UIView! = nil
	@IBOutlet weak var mainWebView : UIWebView!
	@IBOutlet weak var loading : UIActivityIndicatorView!
	@IBAction func unwindToViewController (segue: UIStoryboardSegue){
		println("unwind?")
	}
	
	func webView(webView: UIWebView!, didFailLoadWithError error: NSError!) {
		print("Webview fail with error \(error)");
	}
	
	func webViewDidStartLoad(webView: UIWebView!) {
		print("Webview started Loading")
	}
	
	func webViewDidFinishLoad(webView: UIWebView!) {
		print("Webview did finish load")
		loading.hidden = true
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		var urlpath = NSBundle.mainBundle().pathForResource("www/index-ipad", ofType: "html");
		println (urlpath)
		println (urlpath!)
		var url = NSURL(string:urlpath!)
		var req = NSURLRequest(URL:url!)
		mainWebView.delegate = self;
		mainWebView.loadRequest(req)
		
		mainWebView.mediaPlaybackRequiresUserAction = false
		
		idleTimer = NSTimer.scheduledTimerWithTimeInterval(60*10, target: self, selector: "idleTimerExceeded", userInfo: nil, repeats: true)
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		NSURLCache.sharedURLCache().removeAllCachedResponses()
		println("removeCache")
	}
	
	
	override func viewWillDisappear (animated:Bool) {
		println("viewUnload")
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
	override func viewDidDisappear(animated: Bool) {
		idleTimer.invalidate()
		mainWebView.removeAllSubViews()
		mainWebView.removeFromSuperview()
		mainWebView = nil
		
		mainView.removeAllSubViews()
		mainView.removeFromSuperview()
	}

}