//
//  PairTypeViewModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 16.08.2024.
//

import Foundation

final class PairTypeViewModel: ObservableObject {
    
    @Published var disciplines = [Discipline]()
    @Published var currentDiscipline = Discipline(time: "", name: "", groupName: "", teacherName: "", audienceID: "", subgroup: 0, type: .all)
    @Published var isPresentedInfo = false
    
    func setUpData(disciplines: [Discipline]) {
        self.disciplines = disciplines
    }
    
    func disciplinesCount()-> Int {
        
        var uniqueTimes: Set<String> = Set()
        
        for pair in disciplines {
            
            let times = pair.time.components(separatedBy: "-")
            let startTime = times[0]
            
            uniqueTimes.insert(startTime)
        }
        
        return uniqueTimes.count
    }
}
