//
//  ContentView.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import SwiftUI

struct ContentView: View {
    @AppStorage("lastSeenCountry") private var lastSeenCountry: String = ""
    var body: some View {
        AllCountries()
    }
}

#Preview {
    ContentView()
}
