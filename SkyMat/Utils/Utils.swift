//
//  Utils.swift
//  SkyMat
//
//  Created by Antoneos Philip on 23/06/2026.
//

import Foundation
class Utils{
   static func getNameByDate(date: String?) -> String {
        
        guard let dateString = date else {
            return ""
        }
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd"
        
        guard let convertedDate = formatter.date(from: dateString) else {
            return ""
        }
        
        formatter.dateFormat = "EEEE"
        
        return formatter.string(from: convertedDate)
    }
    static func formatHour(time: String?) -> String {
        
        guard let time else { return "" }
        
        let inputFormatter = DateFormatter()
        inputFormatter.dateFormat = "yyyy-MM-dd HH:mm"
        
        guard let date = inputFormatter.date(from: time) else {
            return ""
        }
        
        let outputFormatter = DateFormatter()
        outputFormatter.dateFormat = "h a"
        
        return outputFormatter.string(from: date)
    }
}
