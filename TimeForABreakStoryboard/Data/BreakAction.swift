//
//  BreakAction.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-12.
//

import Foundation

struct BreakAction : Codable {
    var title : String
    var desc : String
    var duration : Int8
    var category : String
    var linkurl : URL?
}
