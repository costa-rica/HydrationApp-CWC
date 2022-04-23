//
//  EditHistModalView.swift
//  HydrationApp
//
//  Created by Nick on 4/12/22.
//

import SwiftUI

struct EditHistModalView: View {
    
    var date: String
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    @State var numberOfCups:String
    @EnvironmentObject var model: ContentModel
    var body: some View {
        VStack {
            Spacer()
            Text("Edit values for \(date)").font(.title)
                .padding(.bottom,30)
            
            TextField("Enter number of cups for this day:", text:$numberOfCups).padding()
            Button{
                print("number of cups:::", numberOfCups)
                model.editHistory(date: date, numberOfCups: numberOfCups)
            } label: {
                ZStack{
                    Rectangle()
                        .foregroundColor(.green)
                        .frame(height: 48)
                        .cornerRadius(10)
                    Text("Submit")
                }
            }
            Spacer()
        }
        .background(turquoise)
        
    }
}

struct EditHistModalView_Previews: PreviewProvider {
    static var previews: some View {
        EditHistModalView(date:"12-04-2022", numberOfCups: "0")
    }
}
