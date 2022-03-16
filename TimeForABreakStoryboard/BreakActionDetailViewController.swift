//
//  BreakActionDetailViewController.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-13.
//

import UIKit

class BreakActionDetailViewController : UIViewController {
    
    var breakAction : BreakAction?
    
    @IBOutlet weak var titleLabel : UILabel!
    @IBOutlet weak var descriptionLabel : UILabel!
    @IBOutlet weak var durationLabel : UILabel!
    @IBOutlet weak var categoryLabel : UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .lightGray
        title = breakAction?.title
        //print(breakAction?.desc)
        
        //categoryLabel.text = breakAction?.category ?? ""
        //titleLabel.text = breakAction?.title
        //descriptionLabel.text = breakAction?.desc
        //let durationMins : Int8 = breakAction?.duration ?? 0
        //durationLabel.text = String(durationMins) + " minutes"
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        titleLabel.text = breakAction?.title
    }
}
