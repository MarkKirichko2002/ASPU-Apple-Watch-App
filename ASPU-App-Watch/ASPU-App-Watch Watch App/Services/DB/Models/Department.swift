//
//  Department.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation
import Vapor
import Fluent

final class Department: Model, Content {
    
    static let schema = "departments"
    
    @ID(custom: "id")
    var id: Int?
    
    @Field(key: "name")
    var name: String
    
    init() { }
    
    init(id: Int?, name: String) {
        self.id = id
        self.name = name
    }
}

struct DepartmentModel: Identifiable {
    let id: Int
    let name: String
}
