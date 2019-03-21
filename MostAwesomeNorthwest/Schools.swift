//
//  Schools.swift
//  MostAwesomeNorthwest
//
//  Created by Moyer,David C on 3/14/19.
//  Copyright © 2019 Moyer,David C. All rights reserved.
//

import Foundation

class Team {
    
    var name:String
    var students:([String])
    
    init(name:String, students:([String])){
        self.name = name
        self.students = students
    }
    
}

class School {
    
    var name:String
    var coach:String
    var teams:[Team] = []

    init(name:String, coach:String){
        self.name = name
        self.coach = coach
    }
    
    func addTeam(name:String, students:[String]) {
        
    }
    
    
}

class Schools {
    
    private init() {}
    
    static var shared = Schools()
    
    private var schools:[School] = []
    
    func numSchools() -> Int {
        return schools.count
    }
    
    subscript(index:Int) -> School {
        return schools[index]
    }
    
    func add(school:School){
        schools.append(school)
    }
    
    func delete(shared:School){
        for i in 0 ..< schools.count {
            if schools[i].name == shared.name {
                schools.remove(at: i)
                break
            }
        }
    }
}
