//
//  AppDelegate.swift
//  iHapilator
//
//  Created by Vinh Tran on 02/07/16.
//  Copyright © 2016 Truong Vinh Tran. All rights reserved.
//

import Cocoa

@NSApplicationMain

class AppDelegate: NSObject, NSApplicationDelegate,NSTextViewDelegate {

    @IBOutlet weak var window: NSWindow!

    /// text view with the text input
    @IBOutlet var inputTextView: NSTextView!

    @IBOutlet var outputTextView: NSTextView!
    
    func applicationDidFinishLaunching(aNotification: NSNotification) {
        // Insert code here to initialize your application
        
        
        self.inputTextView.delegate = self
    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    /** Method to copy text into pasteboard for pasting
     *
     *  @param sender button to trigger the event
     */
    @IBAction func copyOutputText(sender: NSButton) {
        
        let pasteboard = NSPasteboard.generalPasteboard()
        pasteboard.declareTypes([NSStringPboardType], owner: nil)
        pasteboard.setString(self.outputTextView.string!, forType: NSStringPboardType)
        
    }
    //MARK: Textfield Delegate
    func textDidChange(notification: NSNotification) {
        dispatch_async(dispatch_get_main_queue()) { 
            
            // text did change -> update the output
            let v:String = self.inputTextView.string!.convertHanziToPinyin()
            self.outputTextView.string = v
        }
    }

}