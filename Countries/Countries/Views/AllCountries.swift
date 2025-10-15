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
                    Text("Countries of the world")
                        .font(.largeTitle)
                        .bold()
                        .padding(.top, 8)
                    Text("🌍")
                        .font(.largeTitle)
                }
                
                VStack {
                    // Seccion de mensajes de error o success
                    Section {
                        if !vm.errorMessage.isEmpty {
                            ErrorMessage(message: vm.errorMessage)
                                .onTapGesture {
                                    vm.errorMessage = ""
                                }
                        }
                        if !vm.message.isEmpty {
                            SuccessMessage(message: vm.message)
                                .onTapGesture {
                                    vm.message = ""
                                }
                        }
                    }
                    
                    if vm.isLoading == true {
                        Text("Loading all countries...")
                            .font(.subheadline)
                    }
                    
                    
                    VStack(alignment: .leading, spacing: 10) {
                        TextField("Search", text: $vm.countrySearch)
                            .textFieldStyle(.roundedBorder)
                            .onTapGesture {
                                vm.filteredCountries = []
                            }
                            .onSubmit {
                                vm.searchCountries(name: vm.countrySearch)
                                vm.countrySearch = ""
                            }
                        VStack {
                            Text("You can browse countries by their continent or view them all at once.")
                                .font(.callout)
                                .foregroundStyle(.gray)
                        }.padding(.bottom, 20)
                        
                        if vm.filteredCountries.count > 0 {
                            ForEach(vm.filteredCountries) { country in
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
                        else {
                            if vm.totalCountries > 0 {
                                if !vm.countries.isEmpty {
                                    Text("All")
                                        .font(.title2)
                                        .padding()
                                        .foregroundStyle(.white)
                                        .background(.black)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
                                        .onTapGesture {
                                            vm.viewAll.toggle()
                                        }
                                    if vm.viewAll == true {
                                        ForEach(vm.countries) { country in
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
                                
                                // Seccion de Africa
                                if !vm.africanCountries.isEmpty {
                                    Text("Africa")
                                        .font(.title2)
                                        .padding()
                                        .foregroundStyle(.white)
                                        .background(.black)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
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
                                        .padding()
                                        .foregroundStyle(.white)
                                        .background(.black)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
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
                                        .padding()
                                        .foregroundStyle(.white)
                                        .background(.black)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
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
                                        .padding()
                                        .foregroundStyle(.white)
                                        .background(.black)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
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
                                        .padding()
                                        .foregroundStyle(.white)
                                        .background(.black)
                                        .clipShape(RoundedRectangle(cornerRadius: 8))
                                        .shadow(color: .black.opacity(0.1), radius: 4, x: 2, y: 2)
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
                                        }
                                    }
                                    
                                }
                            }
                        }
                    }
                }.padding(20)
                Image(systemName: "")
                    .resizable()
                    .frame(width: 250, height: 250)
                Text("Tap the following button to go to your last viewed country:")
                Image(systemName: "")
                    .resizable()
                    .frame(width: 250, height: 250)
                     
            }
        }.padding()
            .background(.ultraThickMaterial)
            .onTapGesture {
                vm.filteredCountries.removeAll()
            }
            .onAppear {
            Task {
                await vm.getAllCountries()
                vm.message = ""
            }
        }
    }
}

#Preview {
    AllCountries()
}
