//
//  ViewController.swift
//  AnalyticsService
//
//  Created by Pawan Selokar on 29/04/24.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        AnalyticsManager.shared.setUser(services: AnalyticsServiceType.allEvents)
    }

    @IBAction func onClick_trackEvent(_ sender: Any) {
        AnalyticsManager.shared.track(services: [.internalService], event: Event.someEventHappen, params: ["event":"Tracking Button click event"])
    }
    
}

