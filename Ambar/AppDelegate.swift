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
    
    let statusItem = NSStatusBar.system.statusItem(withLength: NSStatusItem.variableLength)
    
    func applicationDidFinishLaunching(_ aNotification: Notification) {

        let menu = NSMenu()
        
        let item1 = NSMenuItem(title: "Connect", action: #selector(connect), keyEquivalent: "")
        connect()
        item1.target = self
        menu.addItem(item1)
        let item2 = NSMenuItem(title: "Disconnect", action: #selector(disconnect), keyEquivalent: "")
        item2.target = self
        menu.addItem(item2)
        let item3 = NSMenuItem(title: "Help", action: #selector(connect), keyEquivalent: "")
        item3.target = self
        menu.addItem(item3)
        let item4 = NSMenuItem(title: "Quit", action: #selector(quit), keyEquivalent: "")
        item4.target = self
        menu.addItem(item4)
        
        statusItem.button?.image = NSImage.init(named: "AppIcon")
        statusItem.button?.image?.size =  NSSize(width: 18, height: 18)
        statusItem.length = 18
        statusItem.menu = menu
 
        
    }
    
    @objc func connect() -> Void {

        let taskOne = Process()
            taskOne.launchPath = "/bin/echo"
            taskOne.arguments = ["2226"]

            let taskTwo = Process()
            taskTwo.launchPath = "/usr/bin/sudo"
            taskTwo.arguments = ["-S", "sysctl", "-w", "net.inet.ip.ttl=65"]
            //taskTwo.arguments = ["-S", "/usr/bin/touch", "/tmp/foo.bar.baz"]
//        sudo sysctl -w net.inet.ip.ttl=65
            let pipeBetween:Pipe = Pipe()
            taskOne.standardOutput = pipeBetween
            taskTwo.standardInput = pipeBetween

            let pipeToMe = Pipe()
            taskTwo.standardOutput = pipeToMe
            taskTwo.standardError = pipeToMe

            taskOne.launch()
            taskTwo.launch()

            let data = pipeToMe.fileHandleForReading.readDataToEndOfFile()
        let output : String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
            print(output)
    }
    
    @objc func disconnect() -> Void {

        let taskOne = Process()
            taskOne.launchPath = "/bin/echo"
            taskOne.arguments = ["2226"]

            let taskTwo = Process()
            taskTwo.launchPath = "/usr/bin/sudo"
            taskTwo.arguments = ["-S", "sysctl", "-w", "net.inet.ip.ttl=64"]
            //taskTwo.arguments = ["-S", "/usr/bin/touch", "/tmp/foo.bar.baz"]
//        sudo sysctl -w net.inet.ip.ttl=65
            let pipeBetween:Pipe = Pipe()
            taskOne.standardOutput = pipeBetween
            taskTwo.standardInput = pipeBetween

            let pipeToMe = Pipe()
            taskTwo.standardOutput = pipeToMe
            taskTwo.standardError = pipeToMe

            taskOne.launch()
            taskTwo.launch()

            let data = pipeToMe.fileHandleForReading.readDataToEndOfFile()
        let output : String = NSString(data: data, encoding: String.Encoding.utf8.rawValue)! as String
            print(output)
    }
    
    @objc func quit() -> Void {
        NSApplication.shared.terminate(self)
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

