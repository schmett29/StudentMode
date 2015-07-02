//
//  AppDelegate.swift
//  StudentMode
//
//  Created by David Schmetterling on 3/1/15.
//  Copyright (c) 2015 David Schmetterling. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var statusMenu: NSMenu!
    
    let statusItem = NSStatusBar.systemStatusBar().statusItemWithLength(-1)


    func applicationDidFinishLaunching(aNotification: NSNotification) {
        let icon = NSImage(named: "statusIcon")
        //icon?.setTemplate = true
        
        statusItem.image = icon
        statusItem.menu = statusMenu
    }

//    func applicationWillTerminate(aNotification: NSNotification) {
//        // Insert code here to tear down your application
//    }

    @IBAction func menuClicked(sender: NSMenuItem) {
        let task = NSTask()
        task.launchPath = "/usr/bin/defaults"
        
        
//        let location = "/usr/Library/Preferences/com.apple.screensaver.plist"
//        var dictionary = NSDictionary(contentsOfFile: <#String#>)
    
        //        let path = NSBundle.mainBundle().pathForResource("com.apple.screensaver", ofType: "plist")
        //        let dict = NSDictionary(contentsOfFile: path)
        
        if(sender.state == NSOnState) {
            sender.state = NSOffState
            let icon = NSImage(named: "statusIcon")
            //icon?.setTemplate = true
            
            statusItem.image = icon
            statusItem.menu = statusMenu
            task.arguments = ["write", "com.apple.screensaver", "askForPassword", "1"]
        }
        else {
            sender.state = NSOnState
            let icon = NSImage(named: "unlocked")
            //icon?.setTemplate = true
            
            statusItem.image = icon
            statusItem.menu = statusMenu
            task.arguments = ["write", "com.apple.screensaver", "askForPassword", "0"]
        }
        
        task.launch()
        task.waitUntilExit()
        
        //  for apps that need to relaunch finder:
        //        let killtask = NSTask()
        //        killtask.launchPath = "/usr/bin/killall"
        //        killtask.arguments = ["Finder"]
        //        killtask.launch()
        
    }
    
    @IBAction func Quit(sender: AnyObject) {
        exit(0)
    }

}

