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
}
