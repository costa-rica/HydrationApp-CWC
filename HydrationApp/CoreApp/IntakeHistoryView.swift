//
//  IntakeHistoryView.swift
//  HydrationApp
//
//  Created by Nick on 3/22/22.
//

import SwiftUI

struct IntakeHistoryView: View {
    @ObservedObject var contentModelVar = ContentModel()

//    var latestEntryId: Int {
//        var temp_id = 0
//        for i in contentModelVar.intakeHistory {
//            if temp_id<i.id {
//                temp_id = i.id
//            }
//        }
//        return temp_id
//    }
//    @State private var datePickerIndex = "11-04-2022"
//    @State private var datePickerIndex = LoginView.dates_login[-1]
//    var dates: [String]
    var dates: [String] {
        var temp_date: [String] = []
        for i in contentModelVar.intakeHistory {
            temp_date.append(i.date)
        }
        return temp_date
    }
    var datePickerIndex = dates[-1]
    
//    var dates: [String] {
//        var temp_date: [String] = []
//        for i in contentModelVar.intakeHistory {
//            temp_date.append(i.date)
//        }
//        return temp_date
//    }
    var cups_on_date:Int {
        for i in contentModelVar.intakeHistory {
            if i.date == datePickerIndex {
                return i.intake
            }
        }
        return 0
    }
//    @State private var datePickerIndex = dates[2]
    var body: some View {
        
        VStack{
            Spacer()
            Text("Table of intake history").font(.title)
            Spacer()

        VStack {
            Text("Select Date:").padding(0)
            Picker("Dates: ", selection: $datePickerIndex) {
                ForEach(dates, id: \.self) {
//                    Text(String(index)).tag(index)
                    Text($0).tag($0)
                }
            }
            .pickerStyle(WheelPickerStyle())
            .padding(0)
            
//            Text(String(datePickerIndex))
            Text("Number of cups drank: \(cups_on_date)")
            
        }
        .padding(5)
//            Text("number of cups today: \(contentModelVar.intakeHistory[datePickerIndex].intake)")
//            Divider()
//
//
//            Text("You have drank: \(contentModelVar.intakeHistory[latestEntryId].intake) today")
//            
            Spacer()
//            Divider()
//            Button {contentModelVar.deleteHistory()} label: {
//                ZStack{
//                    Rectangle()
//                        .foregroundColor(.red)
//                        .frame(height: 48)
//                        .cornerRadius(10)
//                    Text("Delete History")
//                }
//            }
//            .padding()

            
        }
        .background(.gray)
    }
}

struct IntakeHistoryView_Previews: PreviewProvider {
    static var previews: some View {
        IntakeHistoryView()
    }
}
