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
    
    var getCountriesRequirement: GetCountriesRequirementProtocol

    init(getCountriesRequirement: GetCountriesRequirementProtocol = GetCountriesRequirement.shared) {
        self.getCountriesRequirement = getCountriesRequirement
    }
    
    @MainActor
    func getAllCountries() async {
        print("Obtaining countries...")
        let result = await getCountriesRequirement.getCountries()
        if result == nil {
            errorMessage = "Couldn't obtain countries"
            success = false
        }
        else {
            message = "Successfully got countries"
            success = true
        }
    }
}
