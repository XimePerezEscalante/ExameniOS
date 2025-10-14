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
                VStack(alignment: .leading, spacing: 10) {
                    // Seccion de Africa
                    if !vm.africanCountries.isEmpty {
                        Text("Africa")
                            .font(.title2)
                            .onTapGesture {
                                vm.viewAfrica.toggle()
                            }
                        if vm.viewAfrica {
                            List(vm.africanCountries) { country in
                                NavigationLink(destination: CountryDetail(country: country)) {
                                    Text(country.name.common!)
                                }
                            }
                        }
                        
                    }
                    // Seccion de America
                    if !vm.americanCountries.isEmpty {
                        Text("Americas")
                            .font(.title2)
                            .onTapGesture {
                                vm.viewAmericas.toggle()
                            }
                        if vm.viewAmericas {
                            List(vm.americanCountries) { country in
                                NavigationLink(destination: CountryDetail(country: country)) {
                                    Text(country.name.common!)
                                }
                            }
                        }
                        
                    }
                    // Seccion de Asia
                    if !vm.asianCountries.isEmpty {
                        Text("Asia")
                            .font(.title2)
                            .onTapGesture {
                                vm.viewAsia.toggle()
                            }
                        if vm.viewAsia {
                            List(vm.asianCountries) { country in
                                NavigationLink(destination: CountryDetail(country: country)) {
                                    Text(country.name.common!)
                                }
                            }
                        }
                        
                    }
                    // Seccion de Europa
                    if !vm.europeanCountries.isEmpty {
                        Text("Europa")
                            .font(.title2)
                            .onTapGesture {
                                vm.viewEurope.toggle()
                            }
                        if vm.viewEurope {
                            List(vm.europeanCountries) { country in
                                NavigationLink(destination: CountryDetail(country: country)) {
                                    Text(country.name.common!)
                                }
                            }
                        }
                        
                    }
                    // Seccion de Oceania
                    if !vm.oceaniaCountries.isEmpty {
                        Text("Oceania")
                            .font(.title2)
                            .onTapGesture {
                                vm.viewOceania.toggle()
                            }
                        if vm.viewOceania {
                            List(vm.oceaniaCountries) { country in
                                NavigationLink(destination: CountryDetail(country: country)) {
                                    Text(country.name.common!)
                                }
                            }.background(.clear)
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
