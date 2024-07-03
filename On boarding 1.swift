//
//  On boarding 1.swift
//  My new project
//
//  Created by apprenant179 on 03/07/2024.
//

import SwiftUI

struct On_boarding_1: View {
    
    var body: some View {
        
        NavigationStack {
            
            VStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
            
                
                Spacer()
                Image("logo_bluescan")
                    .resizable()
                    .frame(width: 200, height: 200)
                
                Spacer()
                Text("Bienvenue 👋")
                    .font(.custom("Poppins-Bold", size: 30))
                    .foregroundStyle(Color.customBleu)
                
                Text("Découvrez Blue Scan, l'application qui facilite la consommation de produits de la mer durables.")
                    .padding(30)
                    .multilineTextAlignment(.center)
                    .font(.custom("Quicksand", size: 23))
                    .foregroundColor(.customBleu)
                Spacer()
                
                
                NavigationLink(destination: on_boarding_2()) {
                    Text("Suivant")
                        .foregroundColor(.customBleu)
                        .font(.custom("Quicksand", size: 20))
                        .bold()
                        .frame(width: 200, height: 50)
                        .background(Color.customVert)
                        .cornerRadius(30)
                        
                }.navigationBarBackButtonHidden(true)
            })
            .padding(.bottom, 120)
            
            
        }
        
    }
}

#Preview {
    On_boarding_1()
}
