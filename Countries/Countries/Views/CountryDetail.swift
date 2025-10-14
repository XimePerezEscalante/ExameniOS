//
//  CountryDetail.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import SwiftUI

struct CountryDetail: View {
    var country: Country
    var body: some View {
        NavigationStack {
            VStack(alignment: .leading, spacing: 16) {
                Text(country.name.common!)
                    .font(.title)
                HStack(spacing: 10) {
                    Text("Official name:")
                        .fontWeight(.medium)
                    Text(country.name.official!)
                }
                HStack(spacing: 10) {
                    Text("Subregion:")
                        .fontWeight(.medium)
                    Text(country.subregion!)
                }
                /*HStack(alignment: .leading, spacing: 10) {
                    Text("Capital:")
                        .fontWeight(.medium)
                    Text("\(country.name.official)")
                }
                HStack(alignment: .leading, spacing: 10) {
                    Text(":")
                        .fontWeight(.medium)
                    Text("\(country.name.official)")
                }*/
            }.padding(20)
        }
        
    }
}
