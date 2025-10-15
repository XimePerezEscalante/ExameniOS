//
//  CountryModel.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import Foundation

struct Country: Identifiable, Codable {
    var id: UUID?
    let cioc: String?
    let region: String?
    let subregion: String?
    let name: Name
    let capital: [String]?
    let languages: [String: String]?
    let flag: String?
}

struct Name: Codable {
    let common: String?
    let official: String?
}
