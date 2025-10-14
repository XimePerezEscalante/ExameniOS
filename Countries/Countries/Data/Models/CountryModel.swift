//
//  CountryModel.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import Foundation

struct Country: Codable {
    let cioc: String?
    let region: String?
    let subregion: String?
    //let name: Name
}

struct Name: Codable {
    let common: String?
    let official: String?
}

struct Countries: Codable {
    let countries: [Country]
}
