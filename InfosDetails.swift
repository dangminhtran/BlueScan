//
//  InfosDetails.swift
//  BlueScan
//
//  Created by MINH on 19/06/2024.



// PAGE VALIDEE - MINH
// AJOUTER LES FONTS - MINH
import SwiftUI

struct InfosDetails: View {
    let articleData: Articles

    var body: some View {
        ZStack {
                Background()
                
                // DEBUT DE LA PAGE
                ScrollView {
                
                VStack {
                    
                    // Flèche Retour se met automatique
                    
                    
                    // CARTE
                    ZStack(alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/, content: {
                        
                        Image(articleData.image)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 350, height: 180)
                            .clipped()
                            .padding(.top, -150)
                        
                        
                        Text(articleData.title)
                            .foregroundStyle(Color.customVert)
                            .font(.custom("Poppins-Bold", size: 23))
                            .padding(.top, 160)
                            .padding(.horizontal)
                            .multilineTextAlignment(.center)
                        
                    })
                    .frame(width: 350, height: 300)
                    .background(.customBleu)
                    .cornerRadius(40)
                    .padding(.bottom, 15)
                    
                    
                    
                    // TEXTE
                
                        Text(articleData.description)
                            .font(.custom("Quicksand", size: 18))
                            .foregroundStyle(Color.customBleu)
                            .padding(.bottom, 10)
                        
                        HStack {
                            Text(articleData.subtitle)
                                .multilineTextAlignment(.leading)
                                .font(.custom("Poppins-Bold", size: 20))
                                .foregroundStyle(Color.customOrange)
                                .padding(.bottom, 10)
                            Spacer()
                        }
                        
                        Text(articleData.descriptionSuite).font(.custom("Quicksand", size: 18))
                            .foregroundStyle(Color.customBleu)
                }.padding(20)
            }
        }
    }
}

struct ArticleDetails_Previews: PreviewProvider {
    static var previews: some View {
        InfosDetails(articleData: actu1)
    }
}

#Preview {
    InfosDetails(articleData: actu1)
}
