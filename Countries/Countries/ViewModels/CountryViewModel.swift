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
    @Published var isLoading: Bool = true
    
    var getCountryRequirement: GetCountryRequirementProtocol

    init(getCountryRequirement: GetCountryRequirementProtocol = GetCountryRequirement.shared) {
        self.getCountryRequirement = getCountryRequirement
    }
    
    @MainActor
    func getDetail(name: String) async -> Country? {
        let result = await getCountryRequirement.getCountry(name: name)
        if result.count == 0 {
            isLoading = false
            errorMessage = "Could not get details :( Please tap to try again"
            return nil
        }
        else {
            isLoading = false
            let match = result.filter { $0.name.official == (name) }
            if !match.isEmpty {
                return match[0]
            }
            else {
                errorMessage = "Could not get details :( Please tap to try again"
                return nil
            }
        }
    }
}
