//
//  Tracks.swift
//  testi
//
//  Created by Jawad Ali on 09/09/2020.
//  Copyright © 2020 Jawad Ali. All rights reserved.
//

import Foundation
enum Tracks: Int {
    case full
    case upper
    case loswer
    
    var initialAngel: Int  {
        get {
            switch self {
            case .full:
                return 0
            default:
                return 180
            }
        }
    }
    
    var isClockWise: Bool {
        get {
            switch self {
            case .loswer:
               return false
            default:
               return true
            }
        }
    }
    
}
