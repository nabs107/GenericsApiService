//
//  Data + Extensions.swift
//  GenericsApiService
//
//  Created by Nabin Shrestha on 5/5/20.
//  Copyright © 2020 Nabin Shrestha. All rights reserved.
//

import Foundation

extension Data {
    
    func printAsJSON() {
        if let theJSONData = try? JSONSerialization.jsonObject(with: self, options: []) as? NSDictionary {
            var swiftDict: [String: Any] = [:]
            for key in theJSONData.allKeys {
                let stringKey = key as? String
                if let key = stringKey, let keyValue = theJSONData.value(forKey: key) {
                    swiftDict[key] = keyValue
                }
            }
            swiftDict.printAsJSON()
        }
    }
}
