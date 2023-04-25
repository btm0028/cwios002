//
//  PendingMFAView.swift
//  CapyWrite Chat
//
//  Created by Brandon  Miller on 4/2/23.
//

import SwiftUI

struct PendingMFAView: View {
    @State private var code: String = "";
    var body: some View {
        ZStack {
            Color.indigo
                .ignoresSafeArea()
            VStack {
                Image("Logo")
                    .resizable()
                    .frame(width: 120, height: 120)
                Spacer()
                    .frame(height: 120)
                Text("We've sent you an email for you to authenticate. Please enter the code we sent you below.")
                    .frame(width: 350, height: 120)
                    .fontWeight(.bold)
                TextField(
                    "Code",
                    text: $code,
                    prompt: Text("Code")
                )
                .textInputAutocapitalization(.never)
                .disableAutocorrection(true)
                .border(.secondary)
                .background(Color.white)
                .frame(width: 200)
                .foregroundColor(.black)
            }
        }
    }
}

struct PendingMFAView_Previews: PreviewProvider {
    static var previews: some View {
        PendingMFAView()
    }
}
