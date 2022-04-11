//
//  LoginView.swift
//  HydrationApp
//
//  Created by Nick on 3/22/22.
//

import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var model: ContentModel
    
    private let turquoise = Color(red: 55/255, green: 197/255, blue: 192/255)
    
    var body: some View {
        GeometryReader{ geo in
            VStack {
                Spacer()
                Text("Hydration App")
                    .font(.largeTitle)
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                Spacer()
                Button{
                    //Go to app navigation of two screens
                    model.loggedIn=1
                    print("User Logged in")
                    print("model.loggedIn:::", model.loggedIn)

                } label: {
                    ZStack{
                        Rectangle()
                            .foregroundColor(.gray)
                            .frame(height: 48)
                            .cornerRadius(10)
                        Text("Login")
                    }
                }
                .padding()
//                .frame(maxWidth: .infinity, alignment: .trailing)
                Spacer()
            }
            .onAppear(perform: showLoggedIn)
//            .multilineTextAlignment(.center)
            
            
        }
        .ignoresSafeArea()
        .background(turquoise)
    }
    
    func showLoggedIn() {
        print("model.loggedIn:::", model.intakeHistory[0].date)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
