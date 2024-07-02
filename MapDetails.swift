//
//  MapDetails.swift
//  BlueScan
//
//  Created by Apprenant 133 on 20/06/2024.
//


// REARRANGER LES FORMES EN BACKGROUND
// AJOUTER LES FONTS - MINH

import SwiftUI
import MapKit



struct MapDetails: View {
    
    //@EnvironmentObject var placesData: PlacesData
    @EnvironmentObject var mapData: MapHelper
    // Déclaration de variables
    @State private var resto: String = ""
    @State private var address: String = ""
    
    // Remplissage étoile
    @State private var starCount: Int = 0
    
    // PICKER HOURS
    @State var hours1 = Date()
    @State var hours2 = Date()
    let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
    
    // PICKER JOURS DE LA SEMAINE
    //    @State var day1 = Date()
    //    @State var day2 = Date()
    //    let dateFormatterDay: DateFormatter = {
    //        let weekDay = DateFormatter()
    //        weekDay.dateFormat = "EEEE"
    //        return weekDay
    //    }()
    @State var day1: Int = 1
    @State var day2: Int = 1
    
    let weekdays = ["Dimanche", "Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi"]
    
    
    @State private var newPin: Pin?
    @Binding var places : [Pin]
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                // Formes en arrière-plan
                Image("headerGreen")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.width, height: 210)
                    .offset(x: 0, y: -400)
                    .ignoresSafeArea()
                
                Image("footerGreen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: UIScreen.main.bounds.width, height: 200)
                    .offset(x: 0, y: 350)
                
                VStack(alignment: .leading) {
                    
                    Text("Ajouter une adresse")
                        .font(.system(size: 28))
                        .fontWeight(.black)
                        .foregroundStyle(Color.customBleu)
                        .padding(.top, -135)
                        .padding(.leading, 10)
                    
                    // Formulaire
                    VStack(alignment: .leading) {
                        
                        // Ajouter le nom
                        HStack {
                            Text("Nom")
                                .foregroundStyle(Color.customOrange)
                                .bold()
                                .padding(.trailing, 30)
                            
                            TextField("Entrer le nom du lieu", text: $resto)
                        }.padding(.bottom, 20)
                        
                        // Ajouter l'adresse
                        HStack {
                            Text("Adresse")
                                .foregroundStyle(Color.customOrange)
                                .bold()
                                .padding(.trailing, 5)
                            TextField("Entrer l'adresse du lieu", text: $address)
                        }.padding(.bottom, 20)
                        
                        // Ajouter les jours d'ouverture
                        HStack {
                            Text("Jours")
                                .foregroundColor(.customOrange)
                                .bold()
                                .padding(.trailing, 22)
                            
                        
                                Text("Du")
                                    .foregroundColor(.customBleu)
                              
                                
                                Picker("", selection: $day1) {
                                    ForEach(1..<8) { index in
                                        Text(weekdays[index - 1]).tag(index)
                                            .foregroundColor(.customBleu)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                                .frame(width: 117, height: 20)
                            
                            
                          
                                Text("au")
                                    .foregroundColor(.customBleu)
                                 
                                
                                Picker("", selection: $day2) {
                                    ForEach(1..<8) { index in
                                        Text(weekdays[index - 1]).tag(index)
                                    }
                                }
                                .pickerStyle(MenuPickerStyle())
                                .frame(width: 117, height: 20)
                            
                        }.padding(.bottom, 20)
                        
                        
                        
                        // Ajouter les horaires
                        HStack {
                            Text("Horaires")
                                .foregroundStyle(Color.customOrange)
                                .bold()
                                .padding(.trailing, 5)
                            
                            DatePicker(
                                "De",
                                selection: $hours1,
                                displayedComponents: [.hourAndMinute]
                            ).frame(width: 100, height: 20)
                            
                            DatePicker(
                                "à",
                                selection: $hours2,
                                displayedComponents: [.hourAndMinute]
                            ).frame(width: 100, height: 20)
                            
                        }.padding(.bottom, 20)
                        
                        // Ajouter des tags
                        HStack {
                            Text("Tags")
                                .foregroundStyle(Color.customOrange)
                                .bold()
                                .padding(.trailing, 30)
                            
                            // Créer les tags
                            VStack {
                                // Première ligne de tags
                                HStack {
                                    TagButton(tag: "RESTAURANT", color: .customMauve, textColor: .customBleu)
                                    TagButton(tag: "PÊCHE DURABLE", color: .customOrange, textColor: .white)
                                }
                                
                                // Deuxième ligne de tags
                                HStack {
                                    TagButton(tag: "EPICERIE", color: .customVert, textColor: .customBleu)
                                    TagButton(tag: "VEGETARIEN", color: .customBleu, textColor: .white)
                                }
                            }.padding(.bottom, 20)
                        }
                        
                        // Ajouter des notes
                        HStack {
                            Text("Note")
                                .foregroundStyle(Color.customOrange)
                                .bold()
                                .padding(.trailing, 30)
                            
                            ForEach(0..<5) { index in
                                Image(systemName: index < starCount ? "star.fill" : "star")
                                    .foregroundColor(.customMauve)
                                    .imageScale(.large)
                                    .onTapGesture {
                                        starCount = index + 1
                                    }
                            }
                        }
                    }.padding(.bottom, 50)
                    
                    // Bouton Enregistrer
                    Button {
                        let newPin = Pin(
                            icon: "fork.knife",
                            color: .customOrange,
                            tag: 7,
                            image: "sardines",
                            name: resto,
                            address: address,
                            coordinates: CLLocationCoordinate2D(latitude: 48.85533073243431, longitude: 2.3578338546736557),
                            day1: "11h",
                            day2: "00h30",
                            openH: dateFormatter.string(from: hours1),
                            closeH: dateFormatter.string(from: hours2),
                            note: starCount,
                            tags: "Restaurant",
                            like: true
                        )
                        
                        places.append(newPin)
                    } label: {
                        Text("Enregistrer")
                            .font(.system(size:18))
                            .frame(width: 200, height: 40)
                            .background(Color.customOrange)
                            .cornerRadius(30)
                            .foregroundColor(.white)
                            .bold()
                            .padding(.leading, 73)
                    }
                    
                    
                }.padding(.leading, 20) // Fin VStack
            }
        }
    }
}

// Composant pour les boutons de tags
struct TagButton: View {
    let tag: String
    let color: Color
    let textColor: Color
    
    var body: some View {
        Button {
            // Action pour le bouton de tag
        } label: {
            Text(tag)
                .font(.system(size:13))
                .frame(width: 130, height: 30)
                .background(color)
                .cornerRadius(10)
                .foregroundColor(textColor)
        }
    }
}

#Preview {
    MapDetails(places: .constant(place))
}




