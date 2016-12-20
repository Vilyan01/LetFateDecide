//
//  DecisionViewController.swift
//  LetFateDecide
//
//  Created by Brian Heller on 12/19/16.
//  Copyright © 2016 Brian Heller. All rights reserved.
//

import UIKit

class DecisionViewController: UITableViewController {
    
    var choiceGroup:ChoiceGroup?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Load choice group from app delegate.
        choiceGroup = (UIApplication.shared.delegate as! AppDelegate).choiceGroup
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return choiceGroup!.numberOfChoices()
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! ChoiceCell

        cell.configure(choice: choiceGroup!.choiceForIndexPath(indexPath: indexPath))

        return cell
    }
    

    


    // MARK: - Actions
    @IBAction func letFateDecideTapped(_ sender: Any) {
    }
    
    // Handle the adding of choices to the choice group.
    @IBAction func addChoiceTapped(_ sender: Any) {
        
        var input:UITextField?
        
        // show alert with text field to add the file
        let controller = UIAlertController(title: "Add choice", message: "Enter an option to add to the list.", preferredStyle: .alert)
        
        // add text field to controller
        controller.addTextField { (textField) in
            textField.placeholder = "Option..."
            input = textField
        }
        
        controller.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action) in
            // get input from text field
            if input!.text! != "" {
                // create a new choice and add it to the group.
                let choice = Choice(name: input!.text!)
                self.choiceGroup?.addChoiceToGroup(choice: choice)
                self.tableView.reloadData()
            }
        }))
        
        controller.addAction(UIAlertAction(title: "Cancel", style: .destructive, handler: nil))
        
        self.present(controller, animated: true, completion: nil)
    }
    
    @IBAction func clearAllChoicesTapped(_ sender: Any) {
        // display alert controller to see if this is what the user REALLY wants
        let controller = UIAlertController(title: "Clear all", message: "Continuing will clear all choices from the pool.", preferredStyle: .alert)
        
        controller.addAction(UIAlertAction(title: "Continue", style: .destructive, handler: { (action) in
            self.choiceGroup?.clearAllChoices()
            self.tableView.reloadData()
        }))
        
        controller.addAction(UIAlertAction(title: "Back", style: .default, handler: nil))
        
        self.present(controller, animated: true, completion: nil)
    }
}
