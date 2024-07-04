//
//  UNBOARDING.swift
//  BLUESCAN
//
//  Created by ALAN JAFFRÉ on 03/07/2024.

//

import SwiftUI

struct on_boarding_2: View {
    @Binding var onboarding: Int
    var body: some View {

        NavigationStack{

            Spacer()

            ZStack {
                Circle()
                    .fill(Color.customOrange)
                    .frame(width: 200, height: 200)

                Image("scanner")
            }

            Spacer()

            Text("Scannez, identifiez et choisissez les produits issus de la pêche responsable.")
                .foregroundColor(.customBleu)
                .font(.custom("Quicksand", size: 25))
                .multilineTextAlignment(.center)
                .padding(30)

            Spacer()

            Button(action: {
                onboarding = 2
            }, label: {
                Text("Suivant")
                    .foregroundColor(.customBleu)
                    .font(.custom("Quicksand", size: 20))
                    .bold()
                    .frame(width: 200, height: 50)
                    .background(Color.customVert)
                    .cornerRadius(30)
            })
        }
        .padding(.bottom, 120)
    }
}



#Preview {
    on_boarding_2(onboarding: .constant(0))
}
