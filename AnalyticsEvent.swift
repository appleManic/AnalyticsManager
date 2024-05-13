//
//  MoEngageEvents.swift
//  BeatO
//
//  Created by Pawan Selokar on 13/03/24.
//  Copyright © 2024 Sandip Khedkar. All rights reserved.
//

import Foundation

protocol AnalyticsEvent {
    var name:String {get}
    var parameters:[String: Any]? {get}
}

