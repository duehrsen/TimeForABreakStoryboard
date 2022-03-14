//
//  ActionCollectionViewController.swift
//  TimeForABreakStoryboard
//
//  Created by Chris Duehrsen on 2022-03-11.
//

import UIKit

class ActionCollectionViewController : UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var data = DataProvider.mockData()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        title = "Break Actions"
    }
    
    func deletionHandler(_ indexSection: Int, _ indexRow: Int) {
        // Make a copy of the section to change
        var sectionToChange = data[indexSection].1
        // Remove the deleted row
        sectionToChange.remove(at: indexRow)
        // Replace the section if there are any items left
        if sectionToChange.count > 0
        {
            data[indexSection].1 = sectionToChange
        }
        // Otherwise remove the section completely
        else
        {
            data.remove(at: indexSection)
        }
        
        // Update the data provider
        DataProvider.data = data
        
        // Refresh the view
        tableView.reloadData()
    }
}

extension ActionCollectionViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BreakActionCell
        
        let actionData = data[indexPath.section].1
        cell.updateView(breakAction: actionData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return data[section].0
    }
    
    // Swipe left to delete
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let action = UIContextualAction(style: .normal, title: "Delete") { [weak self] (action,view,completionHandler) in
            self?.deletionHandler(indexPath.section,indexPath.row)
            completionHandler(true)
        }
        
        action.backgroundColor = .red
               
        
        return UISwipeActionsConfiguration(actions: [action])
    }

}


extension ActionCollectionViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].1.count
    }
    
    
}
