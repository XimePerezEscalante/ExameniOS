//
//  getCountriesRequirement.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import Foundation

protocol GetCountriesRequirementProtocol {
    func getCountries() async
}

class GetCountriesRequirement: GetCountriesRequirementProtocol {
    let dataRepository: CountryRepository
    // Singleton
    static let shared = GetCountriesRequirement()
    
    init(dataRepository: CountryRepository = CountryRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getCountries() async {
        return await dataRepository.getAllCountries()
    }
}
