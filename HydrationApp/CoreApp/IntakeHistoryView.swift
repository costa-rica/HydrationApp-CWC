//
//  IntakeHistoryView.swift
//  HydrationApp
//
//  Created by Nick on 3/22/22.
//

import SwiftUI

struct IntakeHistoryView: View {
    @ObservedObject var contentModelVar = ContentModel()
//    @EnvironmentObject var model:ContentModel
    
//    var timeVar: String {
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd-MM-yyyy"
//        return formatter.string(from: model.intakeHistory[0].date)
//    }
    var latestEntryId: Int {
        var temp_id = 0
        for i in contentModelVar.intakeHistory {
            if temp_id<i.id {
                temp_id = i.id
            }
        }
        return temp_id
    }

    var body: some View {
        
        VStack{
            Spacer()
            Text("Table of intake history").font(.title)
            Spacer()
//            Text(String(model.intakeHistory[0].intake))
//            Text(model.intakeHistory[1].date)
            Text(contentModelVar.intakeToday.date)
            Divider()
//            Text("You have drank: \(model.intakeHistory[0].intake) today.")
            Text("You have drank: \(contentModelVar.intakeHistory[latestEntryId].intake) today")
            Spacer()
            Divider()
            Button {contentModelVar.deleteHistory()} label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.red)
                        .frame(height: 48)
                        .cornerRadius(10)
                    Text("Delete History")
                }
            }
            .padding()
//            Spacer()
//            Divider()
            Button {contentModelVar.readHistory()} label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.blue)
                        .frame(height: 48)
                        .cornerRadius(10)
                    Text("Read History")
                }
            }
//            Spacer()
            
        }
        .background(.gray)
    }
}

struct IntakeHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        IntakeHistoryView()
    }
}
