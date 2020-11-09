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
    @IBOutlet weak var storedValueLabel: NSTextField!
    
    var storedValue: String? = nil
    
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        _ = load(fromNIBNamed: "TitleView")
        
        self.titleLabel.stringValue = "iCopy"
        
        guard let savedText = UserDefaults.standard.string(forKey: "textToRemember") else { return }
        
        print("Got saved text  = " + savedText)
        self.storedValue = savedText
        self.storedValueLabel.stringValue = self.getSyntheticData()
    }
    
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    open func getSyntheticData() -> String
    {
        var synthData = "?"
        if (self.storedValue != nil)
        {
            if (self.storedValue!.count > 5)
            {
                synthData = self.storedValue!.prefix(5) + "..."
            }
            else
            {
                synthData = self.storedValue!
            }
        }
        return synthData
    }
    

    
}
