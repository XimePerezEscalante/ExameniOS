//
//  CountryViewModel.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import Foundation
internal import Combine

final class CountryViewModel: ObservableObject {
    @Published var message: String = ""
    @Published var errorMessage: String = ""
    @Published var country: Country? = nil
    
    var getCountryRequirement: GetCountryRequirementProtocol

    init(getCountryRequirement: GetCountryRequirementProtocol = GetCountryRequirement.shared) {
        self.getCountryRequirement = getCountryRequirement
    }
    
    @MainActor
    func getDetail(name: String) async -> Country? {
        let result = await getCountryRequirement.getCountry(name: name)
        return result[0]
    }
}
