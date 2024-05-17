//
//  AnalyticsServiceTypes.swift
//
//  AnalyticsService
//
//  Created by Pawan Selokar on 14/03/24..
//

import Foundation

enum AnalyticsServiceType:CaseIterable {
   static var allEvents:[AnalyticsServiceType] {
       return allCases
    }
    case  internalService , firebase
    
    var service:AnalyticsService {
        switch self {
        case .firebase:
            return FirebaseAnalyticsService()
        case .internalService:
            return InternalAnalyticsService()
        }
    }
}
