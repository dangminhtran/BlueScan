//
//  ContentView.swift
//  My new project
//
//  Created by Selva on 18/06/2024.
// Modified by Casey on 03/07/2024.



import SwiftUI
import VisionKit

struct Home: View {
    @State private var infoDuJour: Articles = info1
    //@State private var title: String = "Bienvenue, \(prenom)👋"
    
    @Binding var prenom: String
    
    
    var body: some View {
        
        NavigationStack {
            ZStack{
                //Same background called for all pages in extraction de vue
                Background()
                
                VStack (spacing: 20, content: {
                    Spacer()
                    
                    Text("Bonjour, \(prenom) 👋")
                        .font(.custom("Poppins-Bold", size: 30))
                        .foregroundStyle(.customBleu)
                    
                    Spacer()
                    
                    Text("Info du jour")
                        .foregroundStyle(.customBleu)
                        .font(.custom("Poppins-Bold", size: 20))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.top)
                    
                    // Link directly to article
                    NavigationLink(destination: InfosDetails(articleData: infoDuJour)) {
                        Rectangle()
                            .foregroundStyle(.customBleu)
                            .frame(width: 360, height: 250)
                            .cornerRadius(30)
                            .overlay {
                                HStack {
                                    Image(infoDuJour.image)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: 170, height: 250)
                                        .clipped()
                                        .cornerRadius(30)
                                    
                                    VStack(alignment: .leading) {
                                        Text(infoDuJour.title)
                                            .foregroundStyle(Color.customVert)
                                            .font(.custom("Poppins-Bold", size: 18))
                                        
                                        Text(infoDuJour.description)
                                            .lineLimit(4)
                                            .foregroundColor(.white)
                                    }
                                    .multilineTextAlignment(.leading)
                                    .padding(.leading, 4)
                                    .padding(.trailing, 10)
                                }
                            }
                    }.frame(maxWidth: .infinity, alignment: .leading)
                    
                    // Link to all actus/info segmented control page
                    NavigationLink(destination: ActusInfosToggle()) {
                        Text("Découvrir toutes nos infos >")
                            .foregroundStyle(.customBleu)
                            .font(.custom("Poppins-Bold", size: 16))
                            .frame(width: 300, height: 44)
                            .background(.customMauve)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                    }
                    
                    Text("Scanner mon produit")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundStyle(.customBleu)
                        .font(.custom("Poppins-Bold", size: 20))
                    
                    // Scanner button - scanner not working here
                    NavigationLink(destination: ScannerScreen()) {
                        ZStack(alignment: Alignment(horizontal: .center, vertical: .center), content: {
                            
                            Circle()
                                .frame(width: 130, height: 130)
                                .foregroundColor(.customOrange)
                            Image("scanner")
                        })
                    }
                    Spacer()
                })
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
        }.navigationBarBackButtonHidden(true)
    }
}


#Preview {
    Home(prenom: .constant("Alan"))
}

