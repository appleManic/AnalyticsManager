//
//  MoEngageAnalyticsService.swift
//  BeatO
//
//  Created by Pawan Selokar on 13/03/24.
//  Copyright © 2024 Sandip Khedkar. All rights reserved.
//

import Foundation
import MoEngageSDK

class MoEngageAnalyticsService: AnalyticsService {

    func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        //Initialisation of MoEngage
    }
    
    func track(event: AnalyticsEvent, params: [String : Any]?) {
        let userid = KeyManager.sharedInstance.getUserID()
        var everntParameters = event.parameters
        var parameters = [String : Any]()
        if let params = params {
            parameters = params
        }
        
        parameters["userid"] = "\(userid)"
        
        if let dict1 = everntParameters {
            parameters =  dict1.merging(parameters) { (_, new) in new }
        }
        
        
        let eventProperties = MoEngageProperties(withAttributes: parameters)
        MoEngageSDKAnalytics.sharedInstance.trackEvent(event.name, withProperties: eventProperties)
        
        print("MoEngageAnalyticsService Parameters \(parameters)")
        
    }
    
    
//    var trackingEvents: [AnalyticsEvent] {
//        return [
//            AnalyticsEvent.subscriptionPageViewed
//        ]
//    }
    
    func setUser(attributes: [String : String]?) {
        let userId = "\(KeyManager.sharedInstance.getUserID())"
        MoEngageSDKAnalytics.sharedInstance.setUniqueID(userId)
        
        MoEngageSDKAnalytics.sharedInstance.setLastName(KeyManager.sharedInstance.getUserLastName())
        MoEngageSDKAnalytics.sharedInstance.setFirstName(KeyManager.sharedInstance.getUserName())
        MoEngageSDKAnalytics.sharedInstance.setEmailID(KeyManager.sharedInstance.getUserEmail())
        MoEngageSDKAnalytics.sharedInstance.setMobileNumber(KeyManager.sharedInstance.getPhone())
    }
    
    func unsetUser() {
        
    
    }
}
