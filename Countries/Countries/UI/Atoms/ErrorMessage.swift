//
//  SwiftUIView.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import SwiftUI

struct ErrorMessage: View {
    var message: String
    var body: some View {
        HStack{
            Image(systemName: "multiply")
                .foregroundStyle(.white)
            Text(message)
                .padding(20)
                .foregroundStyle(.white)
                .bold()
        }.frame(maxWidth: 500)
            .background(.red)
            .cornerRadius(20)
            .padding(20)
    }
}

#Preview {
    ErrorMessage(message: "Error obtaining countries")
}
