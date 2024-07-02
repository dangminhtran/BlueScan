//
//  ContentView.swift
//  ApplicationFishy
//
//  Created by Apprenant 129 on 18/06/2024.
//

import SwiftUI

struct Actualites1: View
{
    
    var info1 = Articles(image: "info1", title: "Comment limiter l'acidification des océans?", description: "Quand il s’agit de préservation de l’océan, c’est à terre que (presque) tout se joue. C’est tellement...")
    var info2 = Articles(image: "info2", title: "Surpêche, comment préserver l’océan de notre appétit ?", description: "Quand on parle des liens entre notre assiette et l’océan, il y a un sujet qui paraît évident : la pêche...")
    var info3 = Articles(image: "info3", title: "Manque d’eau, comment limiter les dégâts ?", description: "Après 32 jours sans pluie, les averses sont revenues la semaine dernière… mais elles n’auront pas fait long feu. Et je vous le dis d’emblée : même si j’ai...")
    var info4 = Articles(image: "info4", title: "Elévation du niveau de la mer, quoi faire?", description: "Digues, murets, surélévation des voies de circulation… À La Rochelle, on ne compte plus les constructions qui visent à prévenir les risques liés...")
    var info5 = Articles(image: "info5", title: "Tournage de l’assiette, journal de bord", description: "Mais maintenant, ça y est ! L’aventure a bel et bien commencé. Mardi 1er mars, on quittait La Rochelle avec Julien, le co-fondateur et réalisateur de...")
    
    var body: some View
    {
        // Add the background header and footer
        ZStack {
            VStack {
                Image("headerGreen")
                    .resizable()
                    .frame(width: 450, height: 200)
                    .ignoresSafeArea()
                    .offset(x:0, y:-90)
                Spacer()
                Image("footerVert")
                    .resizable()
                    .frame(width: 450, height: 200)
                    .ignoresSafeArea()
                    .offset(x:0, y:90)
            }
            // Align foreground content vertically on top of thhe background
            VStack
            {
                // Title
                Text("\tNos actualités")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.custom("Poppins-Bold", size: 26))
                    .foregroundStyle(.customBleu)
                    .padding(30)
                
                // Picker
                ZStack (alignment: .leading)
                {
                    RoundedRectangle(cornerRadius: 7)
                        .foregroundStyle(.lightGrey)
                    RoundedRectangle(cornerRadius: 7)
                        .frame(width: 87, height: 24)
                        .foregroundStyle(.white)
                        .padding(2)
                    HStack
                    {
                        Spacer()
                        Text("Actus")
                            .bold()
                            .font(.system(size: 13))
                            .offset(x: -10, y: 0)
                        Spacer()
                        Text("Infos")
                            .font(.system(size: 13))
                            .offset(x: 5, y: 0)
                        Spacer()
                    }
                } .frame(width: 178, height: 28)
                    .padding(.bottom)
                
                
                // 1st card - ZStack to layer
                NewsCard()
    
                
                Spacer()
            } // Close VStack
        }// Close Z Stack
        
        
    } // Close Body
    
} // Close content view

#Preview {
    Actualites1()
}


struct NewsCard: View {
    @Binding var
    var body: some View {
        ZStack
        {
            // Rectangle
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 367, height: 93)
                .shadow(color: .black.opacity(0.5), radius: 4)
                .foregroundStyle(.white)
            // Horizontally align image then text - 2 columns
            HStack
            {
                // Column 1
                Image(info1.image)
                    .resizable()
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .frame(width: 81.0, height: 70)
                    .padding(7)
                // Column 2 - with 2 text elements vertically on left
                VStack (alignment: .leading)
                {
                    Text(info1.title)
                        .foregroundStyle(.customOrange)
                        .font(.custom("Poppins-Regular", size: 14))
                        .bold()
                    Text(info1.description)
                        .foregroundStyle(.customBleu)
                        .font(.custom("Quicksand_Bold", size: 10))
                        .padding(.trailing)
                }
                
            }
            .frame(width: 367, height: 93)
        }.frame(width: 367, height: 93)
    }
}
