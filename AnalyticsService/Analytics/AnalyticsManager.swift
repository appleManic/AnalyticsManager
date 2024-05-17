//
//  AnalyticsManager.swift
//  AnalyticsService
//
//  Created by Pawan Selokar on 14/03/24..
//


import Foundation
import UIKit

class AnalyticsManager {
    
    private(set) var services = [AnalyticsService]()
    
    static let shared = AnalyticsManager()
    private init() {}
    
    func add(services: [AnalyticsServiceType]) {
        services.forEach { type in
            self.services.append(type.service)
        }
    }
    
    func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?) {
        for service in services {
            service.initialize(
                application     : application,
                launchOptions   : launchOptions
            )
        }
    }
    
    func track(services:[AnalyticsServiceType] = AnalyticsServiceType.allEvents,event: AnalyticsEvent, params: [String : Any]? = nil) {
        for service in services {
            service.service.track(event: event, params: params)
        }
    }
    
    func setUser(services:[AnalyticsServiceType] = AnalyticsServiceType.allEvents) {
        for service in services {
            service.service.setUser()
        }
    }
    
    func unsetUser(services:[AnalyticsServiceType] = AnalyticsServiceType.allEvents) {
        for service in services {
            service.service.unsetUser()
        }
    }
}
