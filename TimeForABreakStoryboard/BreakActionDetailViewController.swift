//
//  BreakActionDetailViewController.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-13.
//

import UIKit

class BreakActionDetailViewController : UIViewController {
    
    var breakAction : BreakAction?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = breakAction?.title
    }
}
