//
//  AppDelegate.swift
//  Ambar
//
//  Created by Anagh Sharma on 12/11/19.
//  Copyright © 2019 Anagh Sharma. All rights reserved.
//

import Cocoa
import SwiftUI

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {
    var popover = NSPopover.init()
    var statusBar: StatusBarController?
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Create the SwiftUI view that provides the contents
        let contentView = ContentView()

        // Set the SwiftUI's ContentView to the Popover's ContentViewController
//        popover.contentViewController = MainViewController()
//        popover.contentSize = NSSize(width: 150, height: 150)
//        popover.contentViewController?.view = NSHostingView(rootView: contentView)
//
//        let contentView = VStack {
//            Text("Test Text")
//            Spacer()
//            HStack {
//                Text("Test Text")
//                Text("Test Text")
//            }
//            Spacer()
//            Text("Test Text")
//        }
        let view = NSHostingView(rootView: contentView)
        // Don't forget to set the frame, otherwise it won't be shown.
        view.frame = NSRect(x: 0, y: 0, width: 150, height: 105)
        
        let menuItem = NSMenuItem()
        menuItem.view = view
        
        let menu = NSMenu()
        menu.addItem(menuItem)
        
        // StatusItem is stored as a class property.
//        statusItem.title = "Text"
        statusItem.button?.image = NSImage.init(named: "AppIcon")
        statusItem.button?.image?.size =  NSSize(width: 18, height: 18)
        statusItem.length = 18
        statusItem.menu = menu
 
        
        // Create the Status Bar Item with the Popover
//        statusBar = StatusBarController.
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

