//
//  ExitButton.swift
//  HydrationApp
//
//  Created by Nick on 3/23/22.
//

import SwiftUI

struct ExitButton: View {
    @EnvironmentObject var model:ContentModel
    var body: some View {
        Button("Exit"){
            model.loggedIn = 0
        }
        
    }
}

struct ExitButton_Previews: PreviewProvider {
    static var previews: some View {
        ExitButton()
    }
}
