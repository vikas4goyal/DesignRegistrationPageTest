//
//  ContentView.swift
//  Registration
//
//  Created by vikas on 22/07/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel = RegistrationDetailsViewModel()
    
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack{
                    TextField("Name", text: $viewModel.name).padding()
                    TextField("Email", text: $viewModel.email).padding()
                    TextField("Home Phone", text: $viewModel.homePhone).padding()
                    TextField("Mobile Phone ", text: $viewModel.mobilePhone).padding()
                    TextField("Address", text: $viewModel.address).padding()
                    TextField("Zip code", text: $viewModel.zipCode).padding()
                    NavigationLink(
                        destination: HomeView(viewModel: viewModel),
                        isActive: $viewModel.isLinkActive,
                        label: {
                            Button("Submit") {
                                viewModel.submitClicked()
                            }.padding()
                        })
                    
                }.alert(isPresented: $viewModel.showAlert) {
                    Alert(title: Text(viewModel.alertMessage), dismissButton: .default(Text("OK"), action: {
                        self.viewModel.showAlert = false
                    }))
                }
            }.navigationBarTitle(Text("Registration"),displayMode: .inline)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
