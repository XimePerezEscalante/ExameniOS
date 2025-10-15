//
//  SuccessMessage.swift
//  Countries
//
//  Created by Ximena Perez Escalante on 14/10/25.
//

import SwiftUI

struct SuccessMessage: View {
    var message: String
    var body: some View {
        HStack{
            Text(message)
                .padding(20)
                .foregroundStyle(.white)
                .bold()
        }.frame(maxWidth: 500)
            .background(.green)
            .cornerRadius(20)
            .padding(20)
    }

}

#Preview {
    SuccessMessage(message: "Successfully obtained info")
}
