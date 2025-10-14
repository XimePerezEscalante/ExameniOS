//
//  CountryRepository.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import Foundation

struct Api {
    static let base = "https://restcountries.com/v3.1/"
    
    struct routes {
        static let all = "/all?fields=name"
        static let name = "/name"
    }
}

protocol restCountryAPIProtocol {
    func getAllCountries() async
}

class CountryRepository: restCountryAPIProtocol {
    let nservice: APIService
    static let shared = CountryRepository()
    
    init(nservice: APIService = APIService.shared) {
        self.nservice = nservice
    }
    
    func getAllCountries() async {
        return await nservice.getAllCountries(url: URL(string: "\(Api.base)\(Api.routes.all)")!)
    }
}
