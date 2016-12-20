//
//  Choice.swift
//  LetFateDecide
//
//  Created by Brian Heller on 12/19/16.
//  Copyright © 2016 Brian Heller. All rights reserved.
//

import Foundation


/*
 This is just a simple struct that will hold a choice. We could just use a string, but
 who knows; maybe in the future we want to do more with it? Like store it in a database
 somewhere.
 */
struct Choice {
    var display:String?
    var decided:Bool?
    
    init(name:String) {
        self.display = name
        self.decided = false
    }
}

