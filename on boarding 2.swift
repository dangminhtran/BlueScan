//
//  UNBOARDING.swift
//  BLUESCAN
//
//  Created by ALAN JAFFRÉ on 03/07/2024.
//

import SwiftUI

struct on_boarding_2: View {
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
            
            NavigationLink(destination: on_boarding_3()) {
                Text("Suivant")
                    .foregroundColor(.customBleu)
                    .font(.custom("Quicksand", size: 20))
                    .bold()
                    .frame(width: 200, height: 50)
                    .background(Color.customVert)
                    .cornerRadius(30)
                
            }.navigationBarBackButtonHidden(true)
        }
        .padding(.bottom, 120)
    }
}
    


#Preview {
    on_boarding_2()
}
