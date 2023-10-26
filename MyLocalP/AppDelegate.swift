//
//  AppDelegate.swift
//  MyLocalP
//
//  Created by Dmitriy Khanin on 24.10.23..
//

import AppKit
import SwiftUI
import Foundation

class AppDelegate: NSObject, NSApplicationDelegate {
    var menu: NSMenu!
    var popover: NSPopover!
    
    var statusBarItem: NSStatusItem!

    func applicationDidFinishLaunching(_ notification: Notification) {
        
        // Close others window`s
        if let window = NSApplication.shared.windows.first {
            window.close()
        }
        
        // Build popover
        let mainView = MainView()
        let popover = NSPopover()
        popover.contentSize = NSSize(width: 300, height: 200)
        popover.behavior = .transient
        popover.contentViewController = NSHostingController(rootView: mainView)
        self.popover = popover
        
        // Build menu
        let statusBarMenu = NSMenu(title: "Actions")
        statusBarMenu.addItem(
            withTitle: "Close application",
            action: #selector(closeApp),
            keyEquivalent: ""
        )
        
        statusBarMenu.addItem(
            withTitle: "Launch after log-in",
            action: #selector(addToAutoRun),
            keyEquivalent: ""
        )
        
        self.menu = statusBarMenu;
        
        // Build status bar item
        self.statusBarItem = NSStatusBar.system.statusItem(withLength: CGFloat(NSStatusItem.variableLength))
        if let button = self.statusBarItem.button {
            button.image = NSImage(systemSymbolName: "globe", accessibilityDescription: "Globe icon")
            
            // Set status button actions
            button.action = #selector(statusItemClick(sender:))
            button.sendAction(on: [.leftMouseUp, .rightMouseUp])
        }
    }
    
    @objc func statusItemClick(sender: NSStatusItem) {
        let event = NSApp.currentEvent!
        let button = self.statusBarItem.button!
        
        if event.type == NSEvent.EventType.rightMouseUp {
            NSMenu.popUpContextMenu(self.menu!, with: event, for: button)
        } else {
            self.popover.show(relativeTo: button.bounds, of: button, preferredEdge: NSRectEdge.minY)
        }
    }
    
    @objc func closeApp() {
        NSApplication.shared.terminate(self)
    }
    
    @objc func addToAutoRun() {
    }
    
    
}
