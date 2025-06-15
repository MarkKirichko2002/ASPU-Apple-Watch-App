//
//  String + Extensions.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation

extension String {
    
    func abbreviation()-> Self {
        let str = self.components(separatedBy: " ")
        let firstLetter =  String(str[1].first!)
        let secondLetter = String(str[2].first!)
        let result = "\(str[0]) \(firstLetter).\(secondLetter)."
        return result
    }
    
    func facultyAbbreviation()-> String {
        
        if self == "Аспирантура" {
            return self
        }
        
        var result = ""
        let modifiedStroke = self.replacingOccurrences(of: ",", with: "").replacingOccurrences(of: "-", with: " ")
        
        let sntns = modifiedStroke.components(separatedBy: "(")
        
        if modifiedStroke.lowercased().contains("исторический факультет") {
            result = "ИстФак"
        } else {
            let words = sntns[0].components(separatedBy: " ")
            for word in words {
                if word.count == 1 {
                    result += word.lowercased()
                } else {
                    result += String(word.uppercased().prefix(1))
                }
            }
        }
        
        if self.contains("(очная форма обучения)") {
            result += " (очно)"
        } else if self.contains("(заочная форма обучения)") {
            result += " (заочно)"
        }
        
        return result
    }
    
    func mixedcased()-> Self {
        var str = ""
        let arr = Array(self)
        for i in 0..<arr.count {
            if i == 0 {
                str += String(arr[i]).uppercased()
            } else {
                str += String(arr[i]).lowercased()
            }
        }
        return str
    }
}
