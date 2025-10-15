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
            ScrollView {
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
                                ForEach(vm.africanCountries) { country in
                                    VStack(spacing: 8) {
                                        NavigationLink(destination: CountryDetail(country: country)) {
                                            Text(country.name.common!)
                                                .foregroundStyle(.black)
                                        }
                                    }.padding()
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
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
                                ForEach(vm.americanCountries) { country in
                                    VStack(spacing: 8) {
                                        NavigationLink(destination: CountryDetail(country: country)) {
                                            Text(country.name.common!)
                                                .foregroundStyle(.black)
                                        }
                                    }.padding()
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
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
                                ForEach(vm.asianCountries) { country in
                                    VStack(spacing: 8) {
                                        NavigationLink(destination: CountryDetail(country: country)) {
                                            Text(country.name.common!)
                                                .foregroundStyle(.black)
                                        }
                                    }.padding()
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
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
                                ForEach(vm.europeanCountries) { country in
                                    VStack(spacing: 8) {
                                        NavigationLink(destination: CountryDetail(country: country)) {
                                            Text(country.name.common!)
                                                .foregroundStyle(.black)
                                        }
                                    }.padding()
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
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
                                ForEach(vm.oceaniaCountries) { country in
                                    VStack {
                                        NavigationLink(destination: CountryDetail(country: country)) {
                                            Text(country.name.common!)
                                                .foregroundStyle(.black)
                                        }
                                    }.padding()
                                        .background(.white)
                                        .clipShape(RoundedRectangle(cornerRadius: 8, style: .continuous))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
                                }.background(.clear)
                            }
                            
                        }
                    }
                }.background(Color(red: 0.839,green: 0.957, blue: 1.000, opacity: 0.05))
            }.background(Color(red: 0.839,green: 0.957, blue: 1.000, opacity: 0.05))
        }.padding(20)
            .background(Color(red: 0.839,green: 0.957, blue: 1.000))
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
