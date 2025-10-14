//
//  AllCountriesViewModel.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import Foundation
internal import Combine

final class AllCountriesViewModel: ObservableObject {
    
    @Published var message: String = ""
    @Published var errorMessage: String = ""
    @Published var success: Bool = false
    @Published var isLoading: Bool = true
    @Published var countries = [Country]()
    @Published var totalCountries = 0
    // Ordenarlos por continente (region)
    @Published var africanCountries = [Country]()
    @Published var europeanCountries = [Country]()
    @Published var asianCountries = [Country]()
    @Published var americanCountries = [Country]()
    @Published var oceaniaCountries = [Country]()
    
    var getCountriesRequirement: GetCountriesRequirementProtocol

    init(getCountriesRequirement: GetCountriesRequirementProtocol = GetCountriesRequirement.shared) {
        self.getCountriesRequirement = getCountriesRequirement
    }
    
    @MainActor
    func getAllCountries() async {
        print("Obtaining countries...")
        var result = await getCountriesRequirement.getCountries()
        
        totalCountries = result.count
        
        for i in 0...totalCountries-1 {
            result[i].id = UUID()
            //countries.append(result[i])
            if result[i].region == "Africa" {
                africanCountries.append(result[i])
            }
            else if result[i].region == "Europe" {
                europeanCountries.append(result[i])
            }
            else if result[i].region == "America" {
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
