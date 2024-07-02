//
//  ContentView.swift
//  ApplicationFishy
//
//  Created by Apprenant 129 on 18/06/2024.
//

import SwiftUI

struct ContentView: View
{
    // Array of articles pulled from structure page
    @State private var actus: [Articles] = [actu1, actu2, actu3, actu4, actu5]
    @State private var infos: [Articles] = [info1, info2, info3]
    
    // Extraction de vue
    @State private var title: String = "\tNos actualités"
    @State private var actusSelected: Int = 1

    var body: some View
    {
        // Z Stack envelops all and layers background and page contents
        ZStack {
            // Background, Extraction de view
            Background()
            // Align foreground content vertically on top of thhe background
            VStack(alignment: .center)
            {
                // Title, extraction de vue
                PageTitle(title: $title)
                
                // Picker
                
                Picker(selection: $actusSelected, label: Text("Picker")) {
                    Text("Actus").tag(1)
                    Text("Infos").tag(2)
                }
                .pickerStyle(.segmented)
                .frame(width: 178)
                .padding(.bottom)
                
                if actusSelected == 1 {
                    
                    // Actualités cards forEach loop
                    ScrollView {
                        ForEach(actus) { eachActuArticle in
                            // Horizontally align image then text - 2 columns
                            NavigationLink(destination: InfosDetails(articleData: eachActuArticle)) {
                                HStack {
                                    // Column 1
                                    Image(eachActuArticle.image)
                                        .resizable()
                                        .clipShape(RoundedRectangle(cornerRadius: 20))
                                        .frame(width: 80, height: 80)
                                        .padding(.leading, 7)
                                    // Column 2 - with 2 text elements vertically on left
                                    VStack(alignment: .leading)
                                    {
                                        Text(eachActuArticle.title)
                                            .lineLimit(2)
                                            .foregroundStyle(.customOrange)
                                            .font(.custom("Poppins-Bold", size: 14))
                                            .padding(.bottom, 2)
                                        
                                        Text(eachActuArticle.description)
                                            .lineLimit(3)
                                            .foregroundStyle(.customBleu)
                                            .font(.custom("Quicksand", size: 10))
                                    }
                                    .padding(.trailing)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                } // Create the card by modifying background of HStack
                                .frame(width: 370, height: 93)
                                .background(.white)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                .shadow(color: .black.opacity(0.5), radius: 2)
                                .padding(.horizontal)
                            }
                        }
                        .padding(.top, 5)
                    }
                } else {
                    ScrollView {
                        ForEach(infos) { eachInfo in
                            NavigationLink(destination: InfosDetails(articleData: eachInfo)) {
                                ZStack {
                                    Rectangle()
                                        .foregroundStyle(.white)
                                    VStack {
                                        Image(eachInfo.image)
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                            .frame(width: 280, height: 110)
                                            .clipped()
                                        
                                        Text(eachInfo.title)
                                            .foregroundStyle(Color.customOrange)
                                            .font(.custom("Poppins-Bold", size: 20))
                                            .padding(.bottom, 10)
                                            .multilineTextAlignment(.center)
                                        Spacer()
                                    }
                                    
                                }.backgroundStyle(Color.white)
                                    .frame(width: 280, height: 200)
                                    .cornerRadius(30)
                                    .shadow(color: .black.opacity(0.5), radius:5)
                                    .padding()
                                
                            }
                        }
                    }
                }
                
            }
        }
    }
}

struct Background: View {
    
    var body: some View {
    
       VStack {
            Image("headerGreen")
                .resizable()
                .frame(width: UIScreen.main.bounds.width, height: 210)
                .offset(x: -12, y: -40)
                .ignoresSafeArea()
            Spacer()
            Image("footerVert")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: 200)
                .offset(x: 0, y: 90)
        }
    }
}

struct PageTitle: View {
    @Binding var title: String
    
    var body: some View {
        Text(title)
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.custom("Poppins-Bold", size: 30))
            .foregroundStyle(.customBleu)
            .padding(20)
    }
}


#Preview {
    ContentView()
}

