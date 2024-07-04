//
//  Accueil .swift
//  Ramah Profil
//
//  Created by RAMAH on 03/07/2024.
//

import SwiftUI

struct on_boarding_4: View {
    @Binding var onboarding: Int
    var body: some View {


        NavigationStack {
            Image("map")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 580)
                .padding(.top, -200)

            Spacer()


            Text("Partagez des points d'intérêt pour acheter et consommer de manière responsable")
                .font(.custom("Quicksand", size: 23))
                .multilineTextAlignment(.center)
                .foregroundColor(.customBleu)
                .padding()

            Spacer()

            Button(action: {
                onboarding = 4
            }, label: {
                Text("Suivant")
                    .foregroundColor(.customBleu)
                    .font(.custom("Quicksand", size: 20))
                    .bold()
                    .frame(width: 200, height: 50)
                    .background(Color.customVert)
                    .cornerRadius(30)
            })

            Spacer()


        }.ignoresSafeArea()

    }
}

#Preview {
    on_boarding_4(onboarding: .constant(0))
}
