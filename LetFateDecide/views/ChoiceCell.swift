//
//  ChoiceCell.swift
//  LetFateDecide
//
//  Created by Brian Heller on 12/19/16.
//  Copyright © 2016 Brian Heller. All rights reserved.
//

import UIKit

class ChoiceCell: UITableViewCell {

    @IBOutlet weak var displayLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func configure(choice:Choice) {
        self.displayLabel.text = choice.display!
        self.accessoryView?.isHidden = choice.decided!
    }

}
