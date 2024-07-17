//
//  Teacher.swift
//  ASPU-App-Watch Watch App
//
//  Created by Марк Киричко on 17.07.2024.
//

import Foundation
import Vapor
import Fluent

final class Teacher: Model, Content {
    
    @ID(custom: "id")
    var id: Int?
    
    static let schema = "teachers"
    
    @Field(key: "first_name")
    var firstName: String
    
    @Field(key: "last_name")
    var lastName: String
    
    @Field(key: "father_name")
    var fatherName: String?
    
    init() { }
    
    init(id: Int?, lastName: String, firstName: String, fatherName: String? = nil) {
        self.id = id
        self.lastName = lastName
        self.firstName = firstName
        self.fatherName = fatherName
    }
}

struct TeacherModel: Identifiable {
    let id: Int
    let firstName: String
    let lastName: String
    let fatherName: String
}
