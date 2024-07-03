//
//  on boarding 3.swift
//  My new project
//
//  Created by apprenant179 on 03/07/2024.
//

import SwiftUI

struct on_boarding_3: View {
    var body: some View {
        
        NavigationStack {
            Spacer()
            
            HStack{
                
                Spacer()
                Image("parmentier")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .cornerRadius(10)
                
                Spacer()
                
                Image("blanquette")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .cornerRadius(10)
                Spacer()
            }
            
            HStack{
                Spacer()
                Image("riz")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .cornerRadius(10)
                
                Spacer()
                
                Image("encornets")
                    .resizable()
                    .frame(width: 160, height: 160)
                    .cornerRadius(10)
                
                Spacer()
            }
            
            Spacer()
            Text("Découvrez nos recettes éthiques")
                .font(.custom("Quicksand", size: 25))
                .foregroundColor(Color.customBleu)
                .padding()
                .multilineTextAlignment(.center)
            
            Spacer()
            
            NavigationLink(destination: on_boarding_4()) {
                Text("Suivant")
                    .foregroundColor(.customBleu)
                    .font(.custom("Quicksand", size: 20))
                    .bold()
                    .frame(width: 200, height: 50)
                    .background(Color.customVert)
                    .cornerRadius(30)
                
            }.navigationBarBackButtonHidden(true)
            
            Spacer()
            
        }
    }
}


#Preview {
    on_boarding_3()
}
