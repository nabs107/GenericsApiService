//
//  Dictionary + Extensions.swift
//  GenericsApiService
//
//  Created by Nabin Shrestha on 5/5/20.
//  Copyright © 2020 Nabin Shrestha. All rights reserved.
//

import Foundation


public extension Dictionary {
    
    func printAsJSON() {
        if let theJSONData = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted),
            let theJSONText = String(data: theJSONData, encoding: String.Encoding.ascii) {
            print("\(theJSONText)")
        }
    }
}
