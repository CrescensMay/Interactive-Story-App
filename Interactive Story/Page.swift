//
//  Page.swift
//  Interactive Story
//
//  Created by Mac on 18/10/2017.
//  Copyright © 2017 Smart Soft. All rights reserved.
//

import Foundation

class Page {
    let story: Story
    
    typealias Choice = (title: String, page: Page)
    
    var firstChoice: Choice?
    var secondChoice: Choice?
    
    init(story: Story) {
        self.story = story
    }
}







