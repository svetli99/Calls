//
//  CallStore.swift
//  Calls
//
//  Created by Svetlio on 16.04.21.
//

import UIKit

class Call {
    var name: String
    var phoneType: String
    var date: Date
    var isMissed: Bool
    var hasIcon: Bool
    var inSeriesCount = 1 {
        didSet {
            name += " (\(inSeriesCount))"
        }
    }
    
    init(name: String, phoneType: String, date: Date, isMissed: Bool, hasIcon: Bool) {
        self.name = name
        self.phoneType = phoneType
        self.date = date
        self.isMissed = isMissed
        self.hasIcon = hasIcon
    }
}

class CallStore {
    var allCalls = [Call]()
    
    @discardableResult func createCall(name: String, phoneType: String, date: Date, isMissed: Bool, hasIcon: Bool) -> Call {
        let newCall = Call(name: name, phoneType: phoneType, date: date, isMissed: isMissed, hasIcon: hasIcon)
        if let lastCall = allCalls.last, lastCall.name == newCall.name && lastCall.isMissed == newCall.isMissed{
            lastCall.inSeriesCount += 1
        } else{
            allCalls.append(newCall)
        }
        return newCall
    }
    
    func getCall(row: Int) -> Call {
        return allCalls[row]
    }
    
    func loadCalls() {
        let name = "Refik"
        let phoneType = "mobile"
        let date = Date()
        var isMissed = false
        var hasIcon = true
        
        for _ in 1...15 {
           createCall(name: name, phoneType: phoneType, date: date, isMissed: isMissed, hasIcon: hasIcon)
            isMissed.toggle()
            hasIcon.toggle()
        }
    }
}
