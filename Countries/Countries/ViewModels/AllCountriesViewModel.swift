//
//  AllCountriesViewModel.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import Foundation
internal import Combine

final class AllCountriesViewModel: ObservableObject {
    
    // Manejo de estados
    @Published var message: String = ""
    @Published var errorMessage: String = ""
    @Published var success: Bool = false
    @Published var isLoading: Bool = true
    // Ttodos los paises
    @Published var countries = [Country]()
    @Published var totalCountries = 0
    // Ordenarlos por continente (region)
    @Published var africanCountries = [Country]()
    @Published var europeanCountries = [Country]()
    @Published var asianCountries = [Country]()
    @Published var americanCountries = [Country]()
    @Published var oceaniaCountries = [Country]()
    
    // Toggle para ver países
    @Published var viewAll: Bool = false
    @Published var viewAfrica: Bool = false
    @Published var viewAsia: Bool = false
    @Published var viewAmericas: Bool = false
    @Published var viewOceania: Bool = false
    @Published var viewEurope: Bool = false
    
    @Published var togglePreguntas: Bool = false
    
    // Buscar pais
    @Published var filteredCountries = [Country]()
    @Published var countrySearch: String = ""
    
    let respuestas = "Arquitectura elegida: (MVVM + Clean)\nInterfaz de dominio real de tu repo: CountryRepository\nEstrategia de guardado de preferencias:\n En el ContentView se encuentra el AppStorage, donde se guarda el nombre del último país que el usuario consultó y cuando da clic al botón de historial, ahí se encuentra.\nEstrategia de búsqueda: En el VM hay un arreglo con el país que coincida con el nombre que se buscó, sólo si tiene algún elemento, se muestra el país."
    
    var getCountriesRequirement: GetCountriesRequirementProtocol

    init(getCountriesRequirement: GetCountriesRequirementProtocol = GetCountriesRequirement.shared) {
        self.getCountriesRequirement = getCountriesRequirement
    }
    
    func searchCountries(name: String) {
        filteredCountries.removeAll()
        let matches = countries.filter { $0.name.common?.contains(name) == true }

        if matches.isEmpty {
            errorMessage = "No countries named '\(name)'"
        } else {
            filteredCountries = matches
            
        }
        /*if countries.filter { $0.name.common!.contains(name)} {
            filteredCountries.removeAll()
            filteredCountries.append(countries.first(where: { $0.name.common! == name})!)
        }
        else {
            errorMessage = "No country named '\(name)'"
        }*/
           
        
    }
    
    @MainActor
    func getAllCountries() async {
        print("Obtaining countries...")
        var result = await getCountriesRequirement.getCountries()
        
        totalCountries = result.count
        
        for i in 0...totalCountries-1 {
            result[i].id = UUID()
            
            countries.append(result[i])
            if result[i].region == "Africa" {
                africanCountries.append(result[i])
            }
            else if result[i].region == "Europe" {
                europeanCountries.append(result[i])
            }
            else if result[i].region == "Americas" {
                americanCountries.append(result[i])
            }
            else if result[i].region == "Asia" {
                asianCountries.append(result[i])
            }
            else if result[i].region == "Oceania" {
                oceaniaCountries.append(result[i])
            }
        }
        
        if totalCountries <= 0 {
            success = false
            isLoading = false
            errorMessage = "Couldn't obtain countries"
            
        }
        else {
            success = true
            isLoading = false
            message = "Successfully got countries"
        }
    }
}
