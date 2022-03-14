//
//  HomeViewController.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-10.
//

import UIKit

class HomeViewController : UIViewController {
    
    @IBOutlet weak var startBtn : UIButton!
    @IBOutlet weak var actionsBtn : UIButton!
    @IBOutlet weak var loginBtn : UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        
        startBtn.layer.cornerRadius = 20
        actionsBtn.layer.cornerRadius = 20
        loginBtn.layer.cornerRadius = 20
    }
}
