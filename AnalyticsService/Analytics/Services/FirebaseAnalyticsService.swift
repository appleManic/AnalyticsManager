//
//  FirebaseAnalyticsService.swift
//  AnalyticsService
//
//  Created by Pawan Selokar on 14/03/24..
//

import UIKit

class FirebaseAnalyticsService:AnalyticsService {
    func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        
    }
    
    func track(event: AnalyticsEvent, params: [String : Any]?) {
        let everntParameters = event.parameters
        var parameters = [String : Any]()
        if let params = params {
            parameters = params
        }
        
        parameters["userid"] = "007"
        
        if let dict1 = everntParameters {
            parameters =  dict1.merging(parameters) { (_, new) in new }
        }
        TrackFirebaseLogs.shared.trackUserEvent(parameters: parameters)
    }
    
    func setUser() {
        let param = ["name": "Batman", "userid": 007] as [String : Any]
        TrackFirebaseLogs.shared.setUser(parameters: param)
    }
    
    func unsetUser() {
        
    }
    
    
}

class TrackFirebaseLogs {
    static let shared = TrackFirebaseLogs()
    func trackUserEvent(parameters:[String:Any]) {
        //Network call for Firebase logs
        print("TrackFirebaseLogs logs send successfully")
    }
    
    func setUser(parameters:[String:Any]) {
        print("TrackMonitorLogs user set successfully")
    }
}
