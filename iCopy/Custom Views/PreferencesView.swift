//
//  PreferencesView.swift
//  WorldTime
//
//  Created by Alessio Saltarin.
//  Copyright © 2020 LittleLite.net. All rights reserved.
//

import Cocoa

class PreferencesView: NSView, LoadableView {
    
    @IBOutlet weak var rememberText: NSTextField!
    var clipboardText: String? = nil
        
    override init(frame frameRect: NSRect) {
        super.init(frame: frameRect)
        
        if load(fromNIBNamed: "PreferencesView") {
            self.initializeTextToRemember()
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    @IBAction func applySelection(_ sender: Any) {
        if (self.rememberText.stringValue.count > 0)
        {
            let clipboardString = self.rememberText.stringValue
            print("Your text = " + clipboardString)
            self.clipboardCopy(copyString: clipboardString)
            self.dismissPreferences(self)
        }
        else
        {
            print("Clicked Apply but no value!")
        }
    }
    
    @IBAction func dismissPreferences(_ sender: Any) {
        self.window?.performClose(self)
    }
    
    func initializeTextToRemember()
    {
        guard let savedText = UserDefaults.standard.string(forKey: "textToRemember") else { return }
        
        print("Got saved text = " + savedText)
        self.clipboardText = savedText
        self.rememberText.stringValue = savedText
    }
    
    func clipboardCopy(copyString strCopy: String)
    {
        // Copy to clipboard
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(strCopy, forType: .string)
        
        // Persist for next times
        UserDefaults.standard.set(strCopy, forKey: "textToRemember")
    }
    
    
}
