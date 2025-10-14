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
                // Seccion de mensajes de error o success
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
                // Seccion de Africa
                if !vm.africanCountries.isEmpty {
                    Text("Africa")
                        .font(.headline)
                    List(vm.africanCountries) { country in
                        NavigationLink(destination: CountryDetail(country: country)) {
                            Text(country.name.common!)
                        }
                    }
                    
                }
                // Seccion de America
                if !vm.americanCountries.isEmpty {
                    Text("America")
                        .font(.headline)
                    List(vm.americanCountries) { country in
                        NavigationLink(destination: CountryDetail(country: country)) {
                            Text(country.name.common!)
                        }
                    }
                    
                }
                // Seccion de Asia
                if !vm.asianCountries.isEmpty {
                    Text("Asia")
                        .font(.headline)
                    List(vm.asianCountries) { country in
                        NavigationLink(destination: CountryDetail(country: country)) {
                            Text(country.name.common!)
                        }
                    }
                    
                }
                // Seccion de Europa
                if !vm.europeanCountries.isEmpty {
                    Text("Europa")
                        .font(.headline)
                    List(vm.europeanCountries) { country in
                        NavigationLink(destination: CountryDetail(country: country)) {
                            Text(country.name.common!)
                        }
                    }
                    
                }
                // Seccion de Oceania
                if !vm.oceaniaCountries.isEmpty {
                    Text("Oceania")
                        .font(.headline)
                    List(vm.oceaniaCountries) { country in
                        NavigationLink(destination: CountryDetail(country: country)) {
                            Text(country.name.common!)
                        }
                    }
                    
                }
                
            }
        }.padding(20)
            .navigationTitle("Countries")
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
