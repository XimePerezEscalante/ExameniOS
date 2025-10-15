//
//  CountryDetail.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import SwiftUI

struct CountryDetail: View {
    @State var country: Country
    @StateObject var vm = CountryViewModel()
    
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
                if country.capital != nil {
                    if country.capital!.count == 1 {
                        HStack {
                            Text("Capital:")
                                .fontWeight(.medium)
                            Text(country.capital![0])
                        }
                    }
                    else {
                        Text("Capitals:")
                            .fontWeight(.medium)
                        ForEach(country.capital!, id: \.self) { capital in
                            Text(capital)
                        }
                    }
                }
                HStack(spacing: 10) {
                    Text("Subregion:")
                        .fontWeight(.medium)
                    Text(country.subregion!)
                }
                if country.languages != nil {
                    HStack(spacing: 10) {
                        if country.languages!.count == 1 {
                            HStack {
                                Text("Language:")
                                    .fontWeight(.medium)
                                ForEach(country.languages!.sorted(by: { $0.value < $1.value }), id: \.key) { key, value in
                                    Text(value)
                                }
                            }
                        }
                        else {
                            Text("Languages:")
                                .fontWeight(.medium)
                            ForEach(country.languages!.sorted(by: { $0.value < $1.value }), id: \.key) { key, value in
                                Text(value)
                            }
                        }
                    }
                }
            }.padding(20)
                .onAppear() {
                    Task {
                        country = await vm.getDetail(name: country.name.common!)!
                    }
                }
        }
        
    }
}
