//
//  OptionsViewController.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-11.
//

import UIKit

class OptionsViewController : UIViewController {
    @IBOutlet weak var countlabel: UILabel!
    @IBOutlet weak var breaktimeslider: UISlider!
    @IBOutlet weak var breaktimesliderlabel: UILabel!
    @IBOutlet weak var worktimeslider: UISlider!
    @IBOutlet weak var worktimesliderlabel: UILabel!
    @IBOutlet weak var timedirectionswitch : UISwitch!
    
    func convertSecondsToTime(timeinSeconds : Int) -> String {
        let minutes = timeinSeconds / 60
        let seconds = timeinSeconds % 60
        
        return String(format: "%2i minutes %02i seconds", minutes,seconds)
    }
    
    @IBAction func breakTimeAction(_ sender : UISlider) {
        breaktimesliderlabel.text =  "\(convertSecondsToTime(timeinSeconds: Int(sender.value)))"
        GlobalOptions.intBreakSeconds = Int(round(sender.value))
    }
    
    @IBAction func workTimeAction(_ sender : UISlider) {
        worktimesliderlabel.text =  "\(convertSecondsToTime(timeinSeconds: Int(sender.value)))"
    }
    
    @IBAction func switchAction(_ sender: UISwitch) {
        countlabel.text = sender.isOn == true ? "On" : "Off"
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
