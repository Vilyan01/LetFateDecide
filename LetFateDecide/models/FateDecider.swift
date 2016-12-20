//
//  FateDecider.swift
//  LetFateDecide
//
//  Created by Brian Heller on 12/19/16.
//  Copyright © 2016 Brian Heller. All rights reserved.
//

import UIKit

public class FateDecider: NSObject {
    
    // Interates through the choice group and selects a winner. Returns the index of the winner.
    func decideFate(choiceGroup:ChoiceGroup) -> Int {
        // maximum random number
        let max = choiceGroup.numberOfChoices()
        
        // create an array to hold the numbers
        var collection = generateStartingArray(count: max)
        
        // loop 10000 times and select a random number to increment
        for _ in 0...10000 {
            let decision = Int(arc4random()) % max
            collection[decision] += 1
        }
        
        // find the index for the object with the most numbers
        return findMaxIndex(collection: collection)
    }
    
    private func findMaxIndex(collection:[Int]) -> Int {
        // initial values of 0
        var max = 0
        var maxValue = 0
        
        // loop through collection and find the maxnumber
        for i in 0...collection.count - 1{
            if collection[i] > maxValue {
                max = i
                maxValue = collection[i]
            }
        }
        
        // return the index of the max number
        return max
    }
    
    // Generates an array full of 0s
    private func generateStartingArray(count:Int) -> [Int] {
        var collection = [Int]()
        for _ in 0...count - 1 {
            collection.append(0)
        }
        return collection
    }
}
