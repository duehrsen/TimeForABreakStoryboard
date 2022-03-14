//
//  BreakActionCell.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-12.
//

import UIKit

class BreakActionCell : UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    
    func updateView(breakAction: BreakAction) {
        titleLbl.text = breakAction.title
        timeLabel.text = String(breakAction.duration) + " min"
    }
    
}
