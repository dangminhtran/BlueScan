//
//  ContentView.swift
//  My new project
//
//  Created by apprenant179 on 18/06/2024.
//


import SwiftUI

struct Home: View {
    var info1 = Articles(
        image: "info1", title: "Comment limiter l'acidification des océans?",
        description: "Quand il s’agit de préservation de l’océan, c’est à terre que (presque) tout se joue. C’est tellement contre-intuitif qu’on le répète encore et encore. Et pour mieux saisir les enjeux, il y a un concept clé à connaître : l’acidification de l’océan. On vous explique.",
        subtitle: "Le problème. /t🍋 L'acidification des océans",
        descriptionSuite: """
    Vous vous souvenez de vos cours de physique-chimie du collège ? Pour moi, c’est déjà loin, alors je me suis dit qu’un petit rappel ne ferait pas de mal ! Toutes les solutions aqueuses ont un pH ou potentiel hydrogène. Celui-ci sert à mesurer l’acidité ou la basicité d’une solution. Le pH peut aller de 0 à 14. À 7, le pH est neutre. Ce qui est au-dessus de 7 est basique et ce qui est en dessous de 7 est acide. Maintenant qu’on a mis les choses à plat, place au constat sur le pH de l’océan. Entre 1850 et 2015, le pH moyen en surface est passé de 8,2 à 8,1. -0,1. L’évolution peut paraître insignifiante, mais les apparences sont trompeuses ! En fait, l’échelle du pH est logarithmique. En clair, ça signifie qu’en moins de 200 ans, on a une hausse de 30% de l’acidité de l’océan. C’est énorme !
    """)
    var body: some View {
        
        NavigationStack {
            
            ZStack{
                
                // FORME ORGANIQUE
                //                Image("headerGreen")
                //                    .resizable()
                //                    .frame(width: UIScreen.main.bounds.width, height: 210)
                //                    .offset(x: 0, y: -400)
                //                    .ignoresSafeArea()
                //
                //
                //
                //                Image("footerGreen")
                //                    .resizable()
                //                    .aspectRatio(contentMode: .fill)
                //                    .frame(width: UIScreen.main.bounds.width, height: 200)
                //                    .offset(x: 0, y: 380)
                
                Background()
                
                VStack {
                    Text("Bienvenue, Alan 👋")
                        .font(.custom("Poppins-Bold", size: 30))
                        .foregroundStyle(Color.customBleu)
                    VStack(alignment: .leading){
                        Text("Info du jour")
                            .foregroundStyle(.customBleu)
                            .font(.custom("Poppins-Bold", size: 20))
                        
                        NavigationLink(destination: InfosDetails()) {
                            ZStack(alignment: Alignment(horizontal: .center, vertical: .top), content:
                                    
                                    {
                                Rectangle()
                                    .foregroundStyle(.customBleu)
                                    .frame(width: 385, height: 250)
                                    .cornerRadius(30)
                                    .overlay {
                                        HStack {
                                            Image(info1.image)
                                                .resizable()
                                                .aspectRatio(contentMode: .fill)
                                                .frame(width: 170, height: 250)
                                                .clipped()
                                                .cornerRadius(30)
                                                .padding(.trailing, 10)
                                            VStack(alignment:.leading) {
                                                Text(info1.title)
                                                    .foregroundStyle(Color.customVert)
                                                    .font(.custom("Poppins-Bold", size: 20))
                                                
                                                
                                                Text(info1.description)
                                                    .lineLimit(4)
                                                    .foregroundColor(.white)
                                            }.multilineTextAlignment(.leading)
                                        }
                                        
                                        
                                    }
                            }).padding(.bottom, 30)
                        }
                        Text("Scanner mon produit")
                            .foregroundStyle(.customBleu)
                            .font(.custom("Poppins-Bold", size: 20))
                        
                        
                        ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
                            
                            Circle()
                                .frame(width: 150, height: 150)
                                .foregroundColor(.customOrange)
                            Image("scanner")
                        }).padding(.leading, 95)
                    }.padding(.horizontal)
                    
                }
                
            }
            
        }
    }
}


#Preview {
    Home()
}
