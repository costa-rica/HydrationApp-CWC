//
//  ContentModel.swift
//  HydrationApp
//
//  Created by Nick on 3/22/22.
//

import Foundation

class ContentModel: ObservableObject {
    
    @Published var intakeHistory = [DailyIntake]()
    @Published var loggedIn = 0
    @Published var coreView = 0
    
    var today_string: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: Date())
    }
    
    var intakeToday: DailyIntake {
        var dailyIntake_temp = intakeHistory[0]
        for i in intakeHistory {
            dailyIntake_temp = i
            if i.date == today_string {
                break
            }
        }
        return dailyIntake_temp
    }
    
    var id_latest: Int {
        var temp_value = 0
        for i in intakeHistory {
            if temp_value < i.id {
                temp_value = i.id
            }
        }
        return temp_value
    }
    
    private var manager_universal = FileManager.default
    lazy private var urlJson = manager_universal.urls(for: .documentDirectory, in: .userDomainMask).first
    lazy private var historyDir = urlJson?.appendingPathComponent("jsonFiles")
    lazy private var historyJson = historyDir?.appendingPathComponent("jsonFile01.json")
    
    init() {
        //if history exists use it, otherwise make folder and create new intakeHistory
        if checkForExistingHistory() == false {
//        //create insatnce of data service
//        let service = DataService()
//        self.intakeHistory = service.getLocalData()
            
        self.intakeHistory = [DailyIntake(id:0,date:today_string,intake:0)]
        createJsonDirectory()
        print("urlJson:::", urlJson!.path)
        print("created JsonDirectory")
        } else {
            self.intakeHistory = readHistory()
            print("urlJsonDir:::", historyDir!.path)
        }
        checkAndAddNewToday()
    }
    
    //if current date not found in historyJson add date
    func checkAndAddNewToday() {
        for i in intakeHistory {
            if today_string == i.date {
                print("today already exists")
                return
            }
        }
        let new_entry = DailyIntake(id:id_latest+1,date:today_string,intake:0)
        self.intakeHistory.append(new_entry)
        writeJson(intakeHistory: intakeHistory)
        print("created new entry")
        return
    }
    //RecordIntakeView - add cup of water button
    func addCup(date:String) {
        for i in intakeHistory {
            print("i.date:::",i.date, ":::",date)
            if date == i.date {
                let id_var=i.id
                print("id_var:::",id_var, type(of: id_var))
                intakeHistory[id_var].intake+=1
            }
        }
        writeJson(intakeHistory: intakeHistory)
    }
    //init
    func checkForExistingHistory() -> Bool {
        if manager_universal.fileExists(atPath: historyJson!.path) {
            return true
        } else {
            return false
        }
    }
    //init
    func createJsonDirectory() {
        do {
            try manager_universal.createDirectory(at: historyDir!, withIntermediateDirectories: true,attributes: [:])
        } catch {
            print(error)
        }
    }
    //RecordIntakeView - add cup of water button
    func writeJson(intakeHistory: [DailyIntake]) {
        let encodedString = try! JSONEncoder().encode(intakeHistory)
        manager_universal.createFile(atPath: historyJson!.path, contents: encodedString, attributes: [:])
        print("history written")
        print("In writeJson func:::", encodedString, intakeHistory)
    }
    //intake history
    func deleteHistory() {
        //create FileManager
//        let manager = FileManager.default
        
        //create object that knows where the file manager path should lead to
        guard let url = manager_universal.urls(for: .documentDirectory,
                                        in: .userDomainMask).first else {
            return
        }
        let newFolderUrl = url.appendingPathComponent("jsonFiles")
        
        //create object that knows the file to delete using the manager url immediately above
        let jsonFile01 = newFolderUrl.appendingPathComponent("jsonFile01.json")
        
        print("what is jsonFile01:::",type(of: jsonFile01))
        print("what is newFolderUrl:::",type(of: newFolderUrl))
        print("what is manager:::",type(of: manager_universal))
        print("what is url:::",type(of: url))
        //Delete file
        if manager_universal.fileExists(atPath: jsonFile01.path) {
            do {
                try manager_universal.removeItem(at: jsonFile01)
            } catch {
                print(error)
            }
        }
    }
    //used in init
    func readHistory() -> [DailyIntake]{
        print("reading exisiting history")
        let data = manager_universal.contents(atPath: historyJson!.path)
        guard data == nil else {
            do {
                let intakeData = try JSONDecoder().decode([DailyIntake].self, from: data!)
                return intakeData
            }
            catch {
                print("error parsing JSON")
            }
            return [DailyIntake]()
        }
        return [DailyIntake]()
    }
    //function to edit the number of cups in particular day
    func editHistory(date:String, numberOfCups: String) {
        for i in 0..<intakeHistory.count {
            if intakeHistory[i].date == date {
                intakeHistory[i].intake = Int(numberOfCups)!
            }
        }
        
        
        print("In editHistory func:::", intakeHistory)
        writeJson(intakeHistory: intakeHistory)
    }
}




//WATCH FileManager tutorial: https://www.youtube.com/watch?v=pUAcMruIBGg
//He shows us how to handles throws try/catch or do..
//Copy this file because it works-ish and try to do this work on another file.

//        OLD working-ish method
//        if let documentDirectory = FileManager.default.urls(for: .documentDirectory,                                                       in:.userDomainMask).first{
//            let pathWithFilename = documentDirectory.appendingPathComponent("myJsontString.json")
//
//            do {
//                try encodedString.write(to: pathWithFilename)
//                print("pathWithFilename",pathWithFilename)
//            } catch {
//                print("failed writing")
//            }
//        }
