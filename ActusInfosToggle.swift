//
//  ContentView.swift
//  ApplicationFishy
//
//  Created by Minh on 18/06/2024.
//

import SwiftUI

struct ActusInfosToggle: View
{
    // Array of articles pulled from structure page
    @State private var actus: [Articles] = [actu1, actu2, actu3, actu4, actu5]
    @State private var infos: [Articles] = [info1, info2, info3]
    
    // Extraction de vue
    @State private var title: String = "Nos actualités"
    @State private var actusSelected: Int = 1
    
    var body: some View
    {
        // Z Stack envelops all and layers background and page contents
        
        // Background, Extraction de view
        
        // Align foreground content vertically on top of thhe background
        VStack
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
                                    .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                                    .frame(width: 80, height: 80)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                    .padding(.leading, 7)
                                // Column 2 - with 2 text elements vertically on left
                                VStack(alignment: .leading)
                                {
                                    Text(eachActuArticle.title)
                                        .lineLimit(2)
                                        .foregroundStyle(.customOrange)
                                        .font(.custom("Poppins-Bold", size: 16))
                                        .padding(.bottom, 2)
                                    
                                    Text(eachActuArticle.description)
                                        .lineLimit(1)
                                        .foregroundStyle(.customBleu)
                                        .font(.custom("Quicksand", size: 12))
                                }
                                .padding(.trailing)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            } // Create the card by modifying background of HStack
                            .frame(width: 370, height: 93)
                            .background(.white)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                            .shadow(color: .black.opacity(0.5), radius:5)
                            .padding(.horizontal)
                        }
                    }
                    .padding(.top, 13)
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
                                        .font(.custom("Poppins-Bold", size: 19))
                                        .padding(.top, 7)
                                        .padding(.horizontal, 10)
                                        .multilineTextAlignment(.center)
                                    Spacer()
                                }
                                
                            }.backgroundStyle(Color.white)
                                .frame(width: 280, height: 220)
                                .cornerRadius(30)
                                .shadow(color: .black.opacity(0.5), radius:5)
                                .padding()
                        }
                    }
                }
            }
        }.background(Background())
            //.navigationBarHidden(true)
    }
}
struct Background: View {
    
    var body: some View {
    
        VStack{
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
                .ignoresSafeArea()
                .offset(x: 0, y: 130)
        }
    }
}
// View structure for all page titles
struct PageTitle: View {
    @Binding var title: String
    
    var body: some View {
        Text("\t\(title)")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.custom("Poppins-Bold", size: 30))
            .foregroundStyle(.customBleu)
            .padding(.top)
            
    }
}


#Preview {
    ActusInfosToggle()
}

