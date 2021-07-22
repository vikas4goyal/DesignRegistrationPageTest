//
//  HomeView.swift
//  Registration
//
//  Created by vikas on 22/07/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel:RegistrationDetailsViewModel
    
    var body: some View {
        ScrollView {
        VStack{
            Text(viewModel.name).padding()
            Text(viewModel.email).padding()
            Text(viewModel.homePhone).padding()
            Text(viewModel.mobilePhone).padding()
            Text(viewModel.address).padding()
            Text(viewModel.zipCode).padding()
            Text(viewModel.alertMessage).padding()
        }
        }.navigationBarTitle(Text("Home View"),displayMode:.inline)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: RegistrationDetailsViewModel())
    }
}
