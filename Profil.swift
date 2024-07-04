//
//  ContentView.swift
//  Ramah Profil
//
//  Created by RAMAH on 24/06/2024.
//
// CASEY: TO FINISH METTRE A JOUR FUNCTIONALITY - no nav as doesnt work
// Then link back to name on home page if possible

import SwiftUI

struct Profil: View {
    
    @Environment(\.presentationMode) var presentationMode

    @State private var mail = ""
    @State private var prenom = "Alan"
    @State private var adresse = ""
    @State private var tel = ""
    @State private var title = "Mon Profil"
    @State private var misAJour: Bool = false
    
    
    var body: some View {
        
        NavigationStack {
            
            ZStack{
                
                Background()
                
             
                
                VStack{
                    
                    HStack {
                        // le profil
                        PageTitle(title: $title)
                            .offset(x: 0, y: -48)
                     
                        
                        
                    }
                    Image("profilPic")
                    
                    Text("Informations Personnelles")
                        .fontWeight(.bold)
                        .foregroundColor(.customOrange)
                    // Police
                        .font(.custom("Poppins-Bold", size: 20))
                        .padding(0)
                    
                        .padding(50)
                    
                    
                    // autres informations
                    
                    VStack(alignment: .leading) {
                        
                        
                        // prénom
                        HStack{
                            Image(systemName: "person.fill")
                                .foregroundColor(.customMauve)
                                .padding()
                                .frame(width: 100, height: 25)
                            
                            Rectangle()
                                .frame(width: 1, height: 25)
                            
                            
                            
                            TextField("Entrez votre prénom", text: $prenom)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            
                        }.padding(.trailing)
                        
                        
                        // Adresse
                        HStack{
                            Image(systemName: "map.fill")
                                .foregroundColor(.customMauve)
                                .padding()
                                .frame(width: 100, height: 25)
                            
                            Rectangle()
                                .frame(width: 1, height: 25)
                            
                            TextField("Entrez votre adresse", text: $adresse)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            
                        }.padding(.trailing)
                        
                        // Mail
                        HStack{
                            Image(systemName: "envelope.fill")
                                .foregroundColor(.customMauve)
                                .padding()
                                .frame(width: 100, height: 25)
                            Rectangle()
                                .frame(width: 1, height: 25)
                            
                            TextField("Entrez votre e-mail", text: $mail )
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            
                            
                        }.padding(.trailing)
                        
                        // Tél
                        HStack{
                            Image(systemName: "phone.fill")
                                .foregroundColor(.customMauve)
                                .padding()
                                .frame(width: 100, height: 25)
                            Rectangle()
                                .frame(width: 1, height: 25)
                            
                            TextField("Entrez votre numéro de tél", text: $tel)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            
                        }.padding(.trailing)
                        
                    }.padding(.bottom, 60)
                        
                        
                        Button(action: {
                            prenom = prenom
                            misAJour = true
                            self.presentationMode.wrappedValue.dismiss()
                            
                        }, label: {
                            Text("Mettre à jour")
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.customOrange)
                                .cornerRadius(20)
                                .frame(width: 190, height: 50)
                                .font(.custom("Poppins-Bold", size: 18))
                        }).overlay{
                            Text(misAJour ? "Profil modifié" : "")
                                .offset(x: 0,  y: -50)
                        }
                        
                    
                    
                }
                
            }
        }
    }
    }
    
    
    
    
    #Preview {
        Profil()
    }
    
    
    
    
