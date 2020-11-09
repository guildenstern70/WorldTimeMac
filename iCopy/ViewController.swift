//
//  ViewController.swift
//  WorldTime
//
//  Created by Gabriel Theodoropoulos.
//  Copyright © 2020 AppCoda. All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override var representedObject: Any? {
        didSet {
        }
    }
    
    override func viewWillAppear() {
        super.viewWillAppear()
     
        view.window?.styleMask.remove(.resizable)
        view.window?.styleMask.remove(.miniaturizable)
        view.window?.center()
        
        let preferencesView = PreferencesView(frame: self.view.bounds)
            preferencesView.add(toView: self.view)
    }

    
}

