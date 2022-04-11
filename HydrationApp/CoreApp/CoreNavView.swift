//
//  CoreNavView.swift
//  HydrationApp
//
//  Created by Nick on 3/22/22.
//

import SwiftUI

struct CoreNavView: View {
    
    @EnvironmentObject var model: ContentModel
    
    var body: some View {
        
        TabView(){
            RecordIntakeView()
                .tabItem{
                    VStack {
                        Image(systemName: "star.fill")
                        Text("Add")
                    }
                }
            
            IntakeHistoryView()
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
