//
//  NSString+DecodedStrings.swift
//  WalmartLabs
//
//  Created by Charles Kang on 9/12/16.
//  Copyright © 2016 Charles Kang. All rights reserved.
//

import Foundation
import UIKit

extension String {
    
    init(htmlEncodedString: String) {
        if let encodedData = htmlEncodedString.dataUsingEncoding(NSUTF8StringEncoding) {
            let attributedOptions: [String: AnyObject] = [
                NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType,
                NSCharacterEncodingDocumentAttribute: NSUTF8StringEncoding
            ]
            do {
                if let attributedString: NSAttributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil) {
                    self.init(attributedString.string)
                } else {
                    print("An error occured)")
                    self.init(htmlEncodedString)
                }
            } catch {
                print("error: \(error)")
                self.init(htmlEncodedString)
            }
        } else {
            self.init(htmlEncodedString)
        }
    }
}
/*
 http://stackoverflow.com/questions/25607247/how-do-i-decode-html-entities-in-swift
 */