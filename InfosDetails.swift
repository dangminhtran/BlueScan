//
//  InfosDetails.swift
//  BlueScan
//
//  Created by Apprenant 133 on 19/06/2024.
//


// PAGE VALIDEE - MINH
// AJOUTER LES FONTS - MINH
import SwiftUI

struct InfosDetails: View {
@
    
    var body: some View {
        

            ZStack {
             
                // FORME ORGANIQUE
                Image("headerGreen")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 210)
                    .offset(x: 0, y: -400)
                    .ignoresSafeArea()
                
                
                
                Image("footerGreen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                    .offset(x: 0, y: 380)
                
                
                // DEBUT DE LA PAGE
                ScrollView {
                
                VStack {
                    
                    // Flèche Retour se met automatique
                    
                    
                    
                    // CARTE
                    ZStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        
                        Image(info1.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: 150)
                            .clipped()
                            .padding(.top, -150)
                        
                        
                        Text(info1.title)
                            .foregroundStyle(Color.customVert)
                            .font(.custom("Poppins-Bold", size: 23))
                            .padding(.top, 130)
                        
                    })
                    .frame(width: 350, height: 300)
                    .background(.customBleu)
                    .cornerRadius(40)
                    .padding(.bottom, 15)
                    .padding(.top, 50)
                    
                    
                    // TEXTE
                    
                    Text(info1.description)
                        .font(.custom("Quicksand_Bold", size: 18))
                        .foregroundStyle(Color.customBleu)
                        .padding(.bottom, 10)
                    
                    Text(info1.subtitle)
                        .foregroundStyle(Color.customOrange)
                        .font(.custom("Poppins-Bold", size: 20))
                        .padding(.bottom, 10)
                    
                    Text(info.descriptionSuite).font(.custom("Quicksand_Bold", size: 18))
                        .foregroundStyle(Color.customBleu)
                    
                    
                    
                }.padding(20)
            }.frame(height: UIScreen.main.bounds.height)
        }
           
        
    }
    
}


#Preview {
    InfosDetails()
}
