//
//  RecordIntakeView.swift
//  HydrationApp
//
//  Created by Nick on 3/22/22.
//

import SwiftUI

struct RecordIntakeView: View {
    
    @EnvironmentObject var model: ContentModel
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
//    @Binding var intake: DailyIntake?
    var today: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: Date())
    }
    var body: some View {
        
        
        VStack{
            HStack{
                Spacer()
                ExitButton()
                    .padding()
            }
            Spacer()
            Text("Record You water intake").font(.title)
            Spacer()
            
            Divider()
                        
            Button {
                model.addCup(date: today)
                print(today)
                model.writeJson(intakeHistory: model.intakeHistory)
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.gray)
                        .frame(height: 48)
                        .cornerRadius(10)
                    Text("Add Cup of Water")
                }

            }.padding()
            Spacer()

            

        }
        .background(turquoise)
        .onAppear(perform: getCoreView)
        
    }
    
    func getCoreView() {
        print("model.coreView:::", model.coreView)
        print("number of cups:::",model.intakeHistory[0].intake)
    }
}

struct RecordIntakeView_Previews: PreviewProvider {
    static var previews: some View {
        RecordIntakeView()
    }
}
