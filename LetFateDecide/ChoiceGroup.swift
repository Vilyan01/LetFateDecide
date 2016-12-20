//
//  ChoiceGroup.swift
//  LetFateDecide
//
//  Created by Brian Heller on 12/19/16.
//  Copyright © 2016 Brian Heller. All rights reserved.
//

import Foundation

/*
 Pretty much just an array of choice objects, but we want to perform some basic operations on them.
 */

struct ChoiceGroup {
    private var choices = [Choice]()
    
    // Add a choice to the group.
    mutating func addChoiceToGroup(choice:Choice) {
        choices.append(choice)
    }
    
    // 'select' a choice at an index
    mutating func selectChoiceAtIndex(index:NSInteger) {
        if(index >= 0 && index < choices.count) {
            choices[index].decided = true
        }
    }
    
    // clear all choices
    mutating func clearAllChoices() {
        choices.removeAll()
    }
    
    // reset the choices back to default
    func resetChoices() {
        for var choice in choices {
            choice.decided = false
        }
    }
    
    // returns the number of choices in the array.
    func numberOfChoices() -> Int {
        return choices.count
    }
    
    // gets a choice for a given index path
    func choiceForIndexPath(indexPath:IndexPath) -> Choice {
        return choices[indexPath.row];
    }
}
