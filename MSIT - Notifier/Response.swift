//
//  Response.swift
//  MSIT - Notifier
//
//  Created by Abhishek Sansanwal on 18/01/19.
//  Copyright © 2019 Verved. All rights reserved.
//

import Foundation
import SwiftSoup


enum HTMLError: Error {
    case badInnerHTML
    
}

struct Response{
    
    init(_innerHTML: Any?) throws {
        guard let htmlString = _innerHTML as? String else { throw
           HTMLError.badInnerHTML }
        let doc = try SwiftSoup.parse(htmlString)
        let author = try doc.getElementsByClass("tab-content").array()
        
        print(author)
        print("hi")
        
        for i in 0..<author.count {
            let autho = try author[i].text()
            
        print(autho)
            
            print("\n")
        }
    }
    
}
