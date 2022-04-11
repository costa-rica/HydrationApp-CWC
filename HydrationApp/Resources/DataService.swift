//
//  DataService.swift
//  HydrationApp
//
//  Created by Nick on 3/23/22.
//

import Foundation

class DataService {
    func getLocalData() -> [DailyIntake] {
        
        //Get a url path to the json file
        let pathString = Bundle.main.path(forResource: "data", ofType: "json")
        
        //check if pathString is not nil, otherwise...
        guard pathString != nil else {
            return [DailyIntake]()
        }
        
        //create a url object
        let url = URL(fileURLWithPath: pathString!)
        
        do {
            //create a data object
            let data=try Data(contentsOf: url)
            
            let decoder = JSONDecoder()
//            let formatter = DateFormatter()
//            formatter.dateFormat = "dd-MM-yyyy"
//            decoder.dateDecodingStrategy = .formatted(formatter)
            do {
                let intakeData = try decoder.decode([DailyIntake].self, from: data)
                
//                for r in intakeData{
//                    r.id=UUID()
//                }
                return intakeData
            }
            catch {
                print("error parsing JSON")
            }
        }
        catch{
            print("url to data object error")
        }
        return [DailyIntake]()
    }
}
