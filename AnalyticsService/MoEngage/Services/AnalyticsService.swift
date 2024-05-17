//
//  AnalyticsService.swift
//
//  AnalyticsService
//
//  Created by Pawan Selokar on 14/03/24..
//


import Foundation
import UIKit

protocol AnalyticsService {
    
    func initialize(application: UIApplication, launchOptions: [UIApplication.LaunchOptionsKey: Any]?)
    
    func track( event: AnalyticsEvent, params: [String : Any]?)

    func setUser()
    
    func unsetUser()
}
