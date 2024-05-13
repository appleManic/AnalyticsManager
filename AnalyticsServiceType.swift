//
//  AnalyticsServiceTypes.swift
//  BeatO
//
//  Created by Pawan Selokar on 13/03/24.
//  Copyright © 2024 Sandip Khedkar. All rights reserved.
//

import Foundation

enum AnalyticsServiceType:CaseIterable {
   static var allEvents:[AnalyticsServiceType] {
        return [.moEnagage, .webengage, .internalEvents]
    }
    case moEnagage, webengage, internalEvents
    
    var service:AnalyticsService {
        switch self {
        case .moEnagage:
            return MoEngageAnalyticsService()
        default:
            return InternalAnalyticsService()
        }
    }
}
