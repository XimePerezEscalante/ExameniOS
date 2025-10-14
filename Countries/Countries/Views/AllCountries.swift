//
//  AllCountries.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import SwiftUI

struct AllCountries: View {
    @StateObject var vm = AllCountriesViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                Section {
                    if !vm.errorMessage.isEmpty {
                        ErrorMessage(message: vm.errorMessage)
                    }
                    if !vm.message.isEmpty {
                        SuccessMessage(message: vm.message)
                    }
                }
                if vm.isLoading == true {
                    Text("Loading all countries...")
                        .font(.subheadline)
                }
                VStack{
                    Text("countries")
                }
                Text("All Countries")
                    .font(.title)
            }
        }.navigationTitle("Countries")
            .onAppear {
                Task {
                    await vm.getAllCountries()
                }
            }
    }
}

#Preview {
    AllCountries()
}
