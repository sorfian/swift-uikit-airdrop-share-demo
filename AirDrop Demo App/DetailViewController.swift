//
//  DetailViewController.swift
//  AirDrop Demo App
//
//  Created by Sorfian on 05/04/23.
//

import UIKit
import WebKit

class DetailViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var actionButtonItem: UIBarButtonItem!
    
    var filename: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        Get the full path of file
        if let fileURL = fileToURL(file: filename) {
            let urlRequest = URLRequest(url: fileURL)
            webView.load(urlRequest)
        }

    }
    
    func fileToURL(file: String) -> URL? {
        let fileComponents = file.components(separatedBy: ".")
        
        if let filePath = Bundle.main.path(forResource: fileComponents[0], ofType: fileComponents[1]) {
            return URL(filePath: filePath)
        }
        return nil
    }
    
    @IBAction func share(sender: AnyObject) {
        if let fileURL = fileToURL(file: filename) {
            let objectsToShare = [fileURL]
            let activityController = UIActivityViewController(activityItems: objectsToShare, applicationActivities: nil)
            let excludedActivities = [
                UIActivity.ActivityType.postToFlickr,
                UIActivity.ActivityType.postToWeibo,
                UIActivity.ActivityType.message,
                UIActivity.ActivityType .mail,
                UIActivity.ActivityType.print,
                UIActivity.ActivityType.copyToPasteboard,
                UIActivity.ActivityType.assignToContact,
                UIActivity.ActivityType.saveToCameraRoll,
                UIActivity.ActivityType.addToReadingList,
                UIActivity.ActivityType.postToFlickr,
                UIActivity.ActivityType.postToVimeo,
                UIActivity.ActivityType.postToTencentWeibo
            ]
            activityController.excludedActivityTypes = excludedActivities
            
            if let popOverController = activityController.popoverPresentationController {
                popOverController.barButtonItem = actionButtonItem
            }
            present(activityController, animated: true, completion: nil)
        }
    }

}
