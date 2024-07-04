//
//  Tab View.swift
//  ApplicationFishy
//
//  Created by Casey on 30/06/2024.
// CASEY - c'est bon

import SwiftUI

struct Tab_View: View {
    @State private var onboarding : Int = 0
    
    var body: some View {
        
        if onboarding < 4 {
            Group {
                if onboarding == 0 {
                    On_boarding_1(onboarding: $onboarding)
                } else if onboarding == 1 {
                    on_boarding_2(onboarding: $onboarding)
                } else if onboarding == 2 {
                    on_boarding_3(onboarding: $onboarding)
                } else if onboarding == 3 {
                    on_boarding_4(onboarding: $onboarding)
                }
            }
        } else {
            
            
            
            
            TabView {
                Group {
                    
                    Home(prenom: .constant("Alan"))
                        .tabItem {
                            Label("Infos", systemImage: "doc.text.fill")
                        }
                    
                    
                    MesScans()
                        .tabItem {
                            Label("Mes scans", systemImage: "heart.fill")
                        }
                    
                    MapScreen()
                        .tabItem {
                            Label("Ma carte", systemImage: "map.fill")
                            
                        }
                    RecipeMain()
                        .tabItem {
                            Label("Mes recettes", systemImage: "fork.knife")
                            
                        }
                    
                    Profil()
                        .tabItem {
                            Label("Mon profil", systemImage: "person.fill" )
                            
                        }
                        .toolbarBackground(.visible, for: .tabBar)
                    
                    
                }.toolbarBackground(.visible, for: .tabBar)
                
                
            }.tint(Color.customMauve)
        }
        
    }
    
}
#Preview {
    Tab_View()
}
