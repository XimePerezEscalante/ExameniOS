//
//  getCountryRequirement.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import Foundation

protocol GetCountryRequirementProtocol {
    func getCountry(name: String) async -> [Country]
}

class GetCountryRequirement: GetCountryRequirementProtocol {
    let dataRepository: CountryRepository
    // Singleton
    static let shared = GetCountryRequirement()
    
    init(dataRepository: CountryRepository = CountryRepository.shared) {
        self.dataRepository = dataRepository
    }
    
    func getCountry(name: String) async -> [Country] {
        return await dataRepository.getCountry(name: name)
    }
}
