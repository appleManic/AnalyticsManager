//
//  InternalAnalyticsService.swift
//
//  AnalyticsService
//
//  Created by Pawan Selokar on 14/03/24..
//


import Foundation
import UIKit

class InternalAnalyticsService:AnalyticsService {
    
    func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey : Any]?) {
        
    }
    
    func track( event: AnalyticsEvent, params: [String : Any]?) {
        let userid = "userid"
        let everntParameters = event.parameters
        
        
        var parameters = [String : Any]()
        if let params = params {
            parameters = params
        }
        
        if let dict1 = everntParameters {
            parameters =  dict1.merging(parameters) { (_, new) in new }
        }
        
        let dict : [String : Any] = [  "userid": userid,
                                       "activity": event.name,
                                       "os": "ios",
                                       "phonemodel": UIDevice.current.name]
        
        TrackMonitorLogs.shared.trackUserEvent(parameters: dict)
    }
    
    func setUser() {
        let param = ["name": "Batman", "userid": 007] as [String : Any]
        TrackMonitorLogs.shared.setUser(parameters: param)
    }
    
    func unsetUser() {
        
    }
    
    
}

class TrackMonitorLogs {
    static let shared = TrackMonitorLogs()
    func trackUserEvent(parameters:[String:Any]) {
        //Network call for MonitoringLogs
        
        print("TrackMonitorLogs logs send successfully")
    }
    
    func setUser(parameters:[String:Any]) {
        print("TrackMonitorLogs user set successfully")
    }
}
