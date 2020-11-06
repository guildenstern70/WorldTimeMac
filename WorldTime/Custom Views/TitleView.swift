//
//  DateTimeView.swift
//  WorldTime
//
//  Created by Alessio Saltarin.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Cocoa

class TitleView: NSView, LoadableView {

    @IBOutlet weak var titleLabel: NSTextField!
    
    var timer: Timer?
    var preferredTimezoneID: String?

    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        _ = load(fromNIBNamed: "TitleView")
        
        self.titleLabel.stringValue = "iCopy"
        
        guard let savedText = UserDefaults.standard.string(forKey: "textToRemember") else { return }
        
        print("Got saved text for icon = " + savedText)
        self.titleLabel.stringValue += " " + savedText
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    

    
}
