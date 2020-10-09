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
    
    @IBOutlet weak var menu: NSMenu?
    @IBOutlet weak var firstMenuItem: NSMenuItem?

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
        
        let itemImage = NSImage(named: "clock")
        itemImage?.isTemplate = true
        statusItem?.button?.image = itemImage
        
        if let menu = menu {
                statusItem?.menu = menu
            }
    }


}

