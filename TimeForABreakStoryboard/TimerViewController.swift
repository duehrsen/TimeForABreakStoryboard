//
//  TimerViewController.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-10.
//

import UIKit

enum IntervalType : Int {
    case work = 600
    case notwork = 120
}

enum IntervalState {
    case inactive
    case active
    case paused
}


class TimerViewController : UIViewController {
    
    var totalTimeElapsed = 0
    var timeElapsed = 0
    var interval = 0
    
    var binaryDescendingTime = 1
    
    var userActivityState = IntervalState.inactive
    var intervalType = IntervalType.work
    var maxTimeInInterval = 0
    var startDate = Date()
    
    @IBOutlet weak var playBtn : UIButton!
    @IBOutlet weak var stopBtn : UIButton!
    
    @IBOutlet weak var breakBtn : UIButton!
    @IBOutlet weak var workBtn : UIButton!
    
    @IBOutlet weak var timerLbl : UILabel!
    @IBOutlet weak var workBreakLbl : UILabel!
    
    @IBAction func playAction(_ sender : UIButton) {
        playButtonPressed()
    }
    
    @IBAction func stopAction(_ sender : UIButton) {
        stopButtonPressed()
    }
    
    @IBAction func breakAction(_ sender : UIButton) {
        switchToBreak()
    }
    
    @IBAction func workAction(_ sender : UIButton) {
        switchToWork()
    }
    
    var timer = Timer()
    
    func getTimeToDisplay() -> Int {
        abs(binaryDescendingTime * intervalType.rawValue - (timeElapsed + interval))
    }
       
    func convertSecondsToTime(timeinSeconds : Int) -> String {
        let minutes = timeinSeconds / 60
        let seconds = timeinSeconds % 60
        
        return String(format: "%02i:%02i", minutes,seconds)
    }
    
    func clearTimes() {
        totalTimeElapsed = 0
        timeElapsed = 0
        interval = 0
    }
    
    func updateTimerLabel() {
        print("Update Timer Label invoked")
        interval =  -Int(startDate.timeIntervalSinceNow)
        timerLbl.text = convertSecondsToTime(timeinSeconds: getTimeToDisplay())
        if getTimeToDisplay() >= intervalType.rawValue
        {
            switchToBreak()
        }
    }
    
    func switchToBreak() {
        timer.invalidate()
        clearTimes()
        intervalType = IntervalType.notwork
        maxTimeInInterval = intervalType.rawValue
        breakBtn.isHidden = true
        workBtn.isHidden = false
        playBtn.isHidden = true
        stopBtn.isHidden = true
        workBreakLbl.text = "Time to relax"
        timerLbl.text = convertSecondsToTime(timeinSeconds: getTimeToDisplay())
        playButtonPressed()
    }
    
    func switchToWork() {
        timer.invalidate()
        clearTimes()
        intervalType = IntervalType.work
        maxTimeInInterval = intervalType.rawValue
        breakBtn.isHidden = false
        workBtn.isHidden = true
        playBtn.isHidden = false
        stopBtn.isHidden = true
        workBreakLbl.text = "Time to work"
        timerLbl.text = convertSecondsToTime(timeinSeconds: getTimeToDisplay())
    }
    
    @objc func timerAction(_ timer: Timer) {
        print("Timer Action invoked")
        self.updateTimerLabel()
    }
    
    func _foregroundTimer(repeated: Bool) {
        print("Foreground timer invoked")
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerAction(_:)), userInfo: nil, repeats: true)
    }
      
    func playButtonPressed() {
        if userActivityState == IntervalState.inactive {
            startDate = Date()
        } else if userActivityState == IntervalState.paused {
            startDate = Date()
        }
        userActivityState = IntervalState.active
        print("Start working")
        playBtn.isHidden = true
        stopBtn.isHidden = false
        
        _foregroundTimer(repeated: true)

    }
    
    func stopButtonPressed() {
        timeElapsed += interval
        print("Time elapsed \(String(timeElapsed))")
        timer.invalidate()
        userActivityState = IntervalState.paused
        print("Take a break")
        playBtn.isHidden = false
        stopBtn.isHidden = true
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        maxTimeInInterval = intervalType.rawValue
        
        stopBtn.isHidden = true
        workBtn.isHidden = true
        playBtn.isHidden = false
        breakBtn.isHidden = false
        
        
        workBreakLbl.text = "Time To Work"
        timerLbl.text = convertSecondsToTime(timeinSeconds: getTimeToDisplay())
        timer.invalidate()
    }
    
    
    
}
