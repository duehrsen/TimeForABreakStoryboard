//
//  TimerViewController.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-10.
//

import UIKit

enum IntervalState {
    case inactive
    case working
    case breaking
    case paused
}

class TimerViewController : UIViewController {
    
    var userActivityState = IntervalState.inactive
    let workInterval = 60*20
    var startDate = Date()
    
    @IBOutlet weak var playBtn : UIButton!
    @IBOutlet weak var stopBtn : UIButton!
    @IBOutlet weak var timerLbl : UILabel!
    
    var timer = Timer()
       
    func convertSecondsToTime(timeinSeconds : Int) -> String {
        let minutes = timeinSeconds / 60
        let seconds = timeinSeconds % 60
        
        return String(format: "%02i:%02i", minutes,seconds)
    }
    
    func updateTimerLabel() {
        print("Update Timer Label invoked")
        let interval = -Int(startDate.timeIntervalSinceNow)
        timerLbl.text = convertSecondsToTime(timeinSeconds: interval)
    }
    
    @objc func timerAction(_ timer: Timer) {
        print("Timer Action invoked")
        self.updateTimerLabel()
    }
    
    func _foregroundTimer(repeated: Bool) {
        print("Foreground timer invoked")
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.timerAction(_:)), userInfo: nil, repeats: true)
    }
    
    @IBAction func playAction(_ sender : UIButton) {
        playButtonPressed()
    }
    
    @IBAction func stopAction(_ sender : UIButton) {
        stopButtonPressed()
    }
    
    func playButtonPressed() {
        if userActivityState == IntervalState.inactive {
            startDate = Date()
        }
        userActivityState = IntervalState.working
        print("Start working")
        playBtn.isHidden = true
        stopBtn.isHidden = false
        
        _foregroundTimer(repeated: true)

    }
    
    func stopButtonPressed() {
        timer.invalidate()
        userActivityState = IntervalState.paused
        print("Take a break")
        playBtn.isHidden = false
        stopBtn.isHidden = true

    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stopBtn.isHidden = true
        playBtn.isHidden = false
        
        timerLbl.text = "00:00"
        timer.invalidate()
    }
    
    
    
}
