//
//  PairTypeFilterModel.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 16.08.2024.
//

import Foundation

struct PairTypeFilterModel: Identifiable {
    let id: Int
    let name: String
    let type: PairType
    var count: Int
}

struct PairTypes {
    
    static var types = [
        PairTypeFilterModel(id: 1, name: PairType.lec.title, type: .lec, count: 0),
        PairTypeFilterModel(id: 2, name: PairType.prac.title, type: .prac, count: 0),
        PairTypeFilterModel(id: 3, name: PairType.exam.title, type: .exam, count: 0),
        PairTypeFilterModel(id: 4, name: PairType.lab.title, type: .lab, count: 0),
        PairTypeFilterModel(id: 5, name: PairType.hol.title, type: .hol, count: 0),
        PairTypeFilterModel(id: 6, name: PairType.cred.title, type: .cred, count: 0),
        PairTypeFilterModel(id: 7, name: PairType.fepo.title, type: .fepo, count: 0),
        PairTypeFilterModel(id: 8, name: PairType.cons.title, type: .cons, count: 0),
        PairTypeFilterModel(id: 9, name: PairType.cours.title, type: .cours, count: 0),
        PairTypeFilterModel(id: 10, name: PairType.none.title, type: .none, count: 0),
        PairTypeFilterModel(id: 11, name: PairType.leftToday.title, type: .leftToday, count: 0),
        PairTypeFilterModel(id: 12, name: PairType.all.title, type: .all, count: 0)
    ]
}

