//
//  DailyIntake.swift
//  HydrationApp
//
//  Created by Nick on 3/23/22.
//

import Foundation

struct DailyIntake: Identifiable, Codable {
//    var id:UUID?
    var id:Int
    var date:String
    var intake:Int
}
