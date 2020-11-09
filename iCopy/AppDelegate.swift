//
//  AppDelegate.swift
//  WorldTime
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    
    var statusItem: NSStatusItem?
    var titleView: TitleView?
    
    @IBOutlet weak var menu: NSMenu?
    @IBOutlet weak var copyMenuItem: NSMenuItem!
    @IBOutlet weak var firstMenuItem: NSMenuItem?
    
    @IBAction func clipboardCopy(_ sender: Any) {
        
        guard let savedClip = UserDefaults.standard.string(forKey: "textToRemember") else {
            self.copyMenuItem.isEnabled = false
            return
        }
        
        // Copy to clipboard
        let pasteboard = NSPasteboard.general
        pasteboard.declareTypes([.string], owner: nil)
        pasteboard.setString(savedClip, forType: .string)
        print("Clipboard copied -> " + savedClip)
        
    }
    
    @objc func validateMenuItem(menuItem: NSMenuItem) -> Bool {
        print("Validating " + menuItem.title)
        return true;
    }
    
    @IBAction func showPreferences(_ sender: Any) {
        let storyboard = NSStoryboard(name: "Main", bundle: nil)
            guard let vc = storyboard.instantiateController(withIdentifier: .init(stringLiteral: "preferencesID")) as? ViewController else { return }
        let window = NSWindow(contentViewController: vc)
            window.makeKeyAndOrderFront(nil)
        
    }
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        print("Welcome to iCopy")
    }
    
    func applicationWillTerminate(_ aNotification: Notification) {
        print("Goodbye..")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        let itemImage = NSImage(named: "clip")
        itemImage?.isTemplate = true
        statusItem?.button?.image = itemImage
        
        if let menu = menu {
            statusItem?.menu = menu
            menu.delegate = self
        }
        
        if let item = firstMenuItem {
            titleView = TitleView(frame: NSRect(x: 0.0, y: 0.0, width: 150.0, height: 64.0))
            item.view = titleView  
        }
        
    }
    
}

extension AppDelegate: NSMenuDelegate {
    func menuWillOpen(_ menu: NSMenu) {
        // Initialize value here
    }
    
}

