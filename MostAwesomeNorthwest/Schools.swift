//
//  Schools.swift
//  MostAwesomeNorthwest
//
//  Created by Moyer,David C on 3/14/19.
//  Copyright © 2019 Moyer,David C. All rights reserved.
//

import Foundation
import UIKit

//Extension for notifications
extension Notification.Name {
    static let SchoolsRetrieved = Notification.Name("Schools Retrieved")
    static let TeamsForSelectedSchoolRetrieved = Notification.Name("Teams for Selected School Retrieved")
    static let TeamsRetrieved = Notification.Name("Teams Retrieved")
}

@objcMembers class Team: NSObject {
    
    var name:String?
    var students:[String]?
    
    var objcId:String?
    
    public override convenience init(){
        self.init(name:nil, students:[])
    
    }
    
    init(name:String?, students:[String]){
        self.name = name
        self.students = students
    }
    
}

@objcMembers class School: NSObject {
    
    var name:String?
    var coach:String?
    var teams:[Team] = []
    
    var objcId:String?
    
    public override convenience init(){
        self.init(name:nil, coach:nil)
    }

    init(name:String?, coach:String?){
        self.name = name
        self.coach = coach
    }
    
    func addTeam(name:String, students:[String]) {
        
    }
    
    
}

class Schools {
    
    // contains singleton (one reference to the call type)
    let shared = Schools()
    
    // creates reference to relations :IDataStore?
    var schoolDataStore:IDataStore!
    var teamDataStore:IDataStore!
    
    // holds selected School
    var selectedSchool: School!
    
    // creates a reference to allude to the shared instance stored in App Delegate
    private var schoolBackendless = (UIApplication.shared.delegate as! AppDelegate).backendless!
    
    private init() {
        //connections to the backendless table
        schoolDataStore = schoolBackendless.data.of(School.self)
        teamDataStore = schoolBackendless.data.of(Team.self)
    }
    
    static var shared = Schools()
    
    private var schools:[School] = []
    
    func add(school:School){
        schools.append(school)
    }
    
    func delete(shared:School){
        self.schools.removeAll(where: {$0.name! == shared.name})
    }
    
    func retrieveAllSchoolsAsynchronously() {
        //fetch all schools and the teams asychronously, storing results in schools
        let queryBuilder = DataQueryBuilder()
        queryBuilder!.setRelated(["teams"])
        queryBuilder!.setPageSize(100)
        schoolDataStore.find(queryBuilder, response: {(results) -> Void in
            self.schools = results as! [School]
            NotificationCenter.default.post(name: .SchoolsRetrieved, object:nil)
        }
            ,error: {(exception) -> Void in
            print(exception.debugDescription)
        })
    }
    
    func saveSchoolsAsynchronously(named name:String, coach:String) {
        
        var schoolToSave = School(name: name, coach: coach)
        schoolDataStore!.save(schoolToSave, response: {(result) -> Void in
            schoolToSave = result as! School
            self.retrieveAllSchoolsAsynchronously()},
                              error:{(exception) -> Void in
                                print(exception.debugDescription)
        })
    }
    
    func saveTeamForSelectedSchool(teams:Team) {
        print("Saving the team for the selected School...")
        let startingDate = Date()
        Types.tryblock({
            let savedTeam = self.teamDataStore.save(teams) as! Team
           // self.schoolDataStore.addRelation("teams:Teams:n", parentObjectId: self.selectedSchool!.objectId, childObjects: [savedTeam.objectId!])
            
        }, catchblock:{ (exception) -> Void in
            print(exception.debugDescription)
        })
        
        print("Done!! in \(Date().timeIntervalSince(startingDate)) seconds")
    }
    
    func removeSchool(objectId:String){
        self.schoolDataStore.remove(byId: objectId, response: nil, error: nil)
    }
 
}
