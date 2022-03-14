//
//  BreakActionCell.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-12.
//

import UIKit

class BreakActionCell : UITableViewCell {
    @IBOutlet weak var titleLbl: UILabel!
    
    func updateView(breakAction: BreakAction) {
        titleLbl.text = breakAction.title
    }
    
}
