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
        self.inputTextView.superview?.postsBoundsChangedNotifications = true
//        NotificationCenter.default.addObserver(self, selector: #selector(AppDelegate.textDidChange), name: NSNotification.Name.NSViewBoundsDidChange, object: self.inputTextView)
    }
    
//    func boundDidChange(notification:NSNotification){
//        print("did scroll")
//    }

    func applicationWillTerminate(aNotification: NSNotification) {
        // Insert code here to tear down your application
    }

    /** Method to copy text into pasteboard for pasting
     *
     *  @param sender button to trigger the event
     */
    @IBAction func copyOutputText(sender: NSButton) {
        
        let pasteboard = NSPasteboard.general
        pasteboard.clearContents()
        pasteboard.setString(self.outputTextView.string, forType: .string)
    }
    //MARK: Textfield Delegate
    func textDidChange(_ notification: Notification) {

        DispatchQueue.main.async(execute: { () -> Void in
            
            // text did change -> update the output
            let content:String = self.inputTextView.string.convertHanziToPinyin()
            self.outputTextView.string = content
        })
    }

}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToNSPasteboardPasteboardTypeArray(_ input: [String]) -> [NSPasteboard.PasteboardType] {
	return input.map { key in NSPasteboard.PasteboardType(key) }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToNSPasteboardPasteboardType(_ input: String) -> NSPasteboard.PasteboardType {
	return NSPasteboard.PasteboardType(rawValue: input)
}
