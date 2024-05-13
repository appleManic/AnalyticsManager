//
//  AnalyticsManager.swift
//  BeatO
//
//  Created by Pawan Selokar on 13/03/24.
//  Copyright © 2024 Sandip Khedkar. All rights reserved.
//

import Foundation

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
    
    func setUser(services:[AnalyticsServiceType] = AnalyticsServiceType.allEvents, attributes: [String : String]?) {
        for service in services {
            service.service.setUser(attributes: attributes)
        }
    }
    
    func unsetUser() {
        for service in services {
            service.unsetUser()
        }
    }
}
