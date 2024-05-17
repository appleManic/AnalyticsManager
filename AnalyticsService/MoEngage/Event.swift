//
//  Event.swift
//  AnalyticsService
//
//  Created by Pawan Selokar on 14/03/24..
//

import Foundation

enum Event:AnalyticsEvent {
    
    case someEventHappen

    var name: String {
        switch self {
        case .someEventHappen: return "some_event_happen"
        }
    }
    
    var parameters: [String: Any]? {
        switch self {
        case .someEventHappen:
            return ["sessionID": "\(UUID(uuidString: "23472937hj1wefiuyu3eyr"))"]
        }
    }
}


