//
//  CRTextConverter.swift
//  iHapilator
//
//  Created by Vinh Tran on 02/07/16.
//  Copyright © 2016 Truong Vinh Tran. All rights reserved.
//

import Foundation
import CoreFoundation

extension String{
    
    
    func convertHanziToPinyin() -> String {
        
        let mutableString = NSMutableString(string: self) as CFMutableString
        var range = CFRangeMake(0, CFStringGetLength(mutableString))
        //kCFStringTransformMandarinLatin
        CFStringTransform(mutableString, &range, kCFStringTransformToLatin, Bool(0))
        
        return mutableString as String
    }
}