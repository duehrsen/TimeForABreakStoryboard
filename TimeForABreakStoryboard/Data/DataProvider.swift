//
//  DataProvider.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-12.
//

import UIKit

class DataProvider {
    static var data = [(String, [BreakAction])]()
    
    static func mockData() -> [(String, [BreakAction])] {
        var relaxSection:  [BreakAction] = []
        var cleanSection: [BreakAction] = []
        var exerciseSection: [BreakAction] = []
        
        relaxSection.append(
        BreakAction(title: "Look into distance", desc: "Look at an an object at least 50 m away for 20 seconds", duration: 2, category: "relax"))
        relaxSection.append(
        BreakAction(title: "Walk", desc: "Walk outside your computer area", duration: 3, category: "relax"))
        relaxSection.append(
        BreakAction(title: "Drink", desc: "Drink water or some other beverage", duration: 3, category: "relax"))
        
        cleanSection.append(
        BreakAction(title: "Load / Unload dishes", desc: "Put dishes into or out of dishwasher", duration: 7, category: "clean"))
        cleanSection.append(
        BreakAction(title: "Wipe", desc: "Wipe down a surface to clean it", duration: 2, category: "clean", linkurl: URL(string: "https://www.cdc.gov/coronavirus/2019-ncov/prevent-getting-sick/disinfecting-your-home.html")))
        cleanSection.append(
        BreakAction(title: "Vacuum", desc: "Run the vacuum cleaner over one section of your home", duration: 5, category: "clean"))
        cleanSection.append(
        BreakAction(title: "Tidy", desc: "Take objects from one section of your home and put them into their appropriate storage location", duration: 4, category: "clean"))
        
        exerciseSection.append(
        BreakAction(title: "Pushups", desc: "Laying on your belly with your hands on the ground by your shoulders, push up with your arms until extended. Do a set that tires you", duration: 4, category: "exercise"))
        exerciseSection.append(BreakAction(title: "Bridges", desc: "Lie on your back with your knees bent. Tighten your abdominal muscles. Raise your hips off the floor until your hips are aligned with your knees and shoulders. Hold for three deep breaths. Return to the starting position and repeat.", duration: 4, category: "exercise", linkurl: URL(string: "https://www.mayoclinic.org/healthy-lifestyle/labor-and-delivery/multimedia/bridge-exercise/img-20006409")))
        
        data = [("Relax", relaxSection),("Clean", cleanSection),("Exercise", exerciseSection)]
        
        return data
    }
    
}
