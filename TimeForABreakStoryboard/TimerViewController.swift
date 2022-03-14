//
//  TimerViewController.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-10.
//

import UIKit

class TimerViewController : UIViewController {
    
    @IBOutlet weak var playBtn : UIButton!
    @IBOutlet weak var timerLbl : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //countdown()
        
        playBtn.layer.cornerRadius = 20
    }
    
    func countdown() {
        let startTime : Date = Date()
        let duration: TimeInterval = 20 * 60
        
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute,.second]
        formatter.zeroFormattingBehavior = .dropLeading
        formatter.unitsStyle = .positional
        
        // Start at 0
        var runningTime : TimeInterval = 0
        
        var time : Date = Date()
        let cal : Calendar = Calendar.current
        repeat {
            time = cal.date(byAdding: .second, value: 1, to: time)!
            
            runningTime = time.timeIntervalSince(startTime)
            
            if runningTime < duration {
                timerLbl.text = formatter.string(from: duration - runningTime)!
            }
            
        } while runningTime < duration
        
    }
}
