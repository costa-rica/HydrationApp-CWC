//
//  CoreNavView.swift
//  HydrationApp
//
//  Created by Nick on 3/22/22.
//

import SwiftUI

struct CoreNavView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var dates: [String] {
        var temp_date: [String] = []
        for i in model.intakeHistory {
            temp_date.append(i.date)
        }
        return temp_date
    }
    
    
    var body: some View {
        
        TabView(){
            RecordIntakeView()
                .tabItem{
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Add")
                    }
                }
            
            IntakeHistoryView(dates: dates)
                .tabItem{
                    VStack {
                        Image(systemName: "list.bullet")
                        Text("History")
                    }

                }
        }
    }
}

struct CoreNavView_Previews: PreviewProvider {
    static var previews: some View {
        CoreNavView()
    }
}
