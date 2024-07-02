//
//  Recipes.swift
//  ApplicationFishy
//
//  Created by Apprenant 129 on 24/06/2024.
//

import SwiftUI

struct Recipes: View {
    var body: some View {

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
    }
}

#Preview {
    Recipes()
}
