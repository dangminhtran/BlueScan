//
//  RecipeDetail.swift
//  ApplicationFishy
//
//  Created by Apprenant 129 on 27/06/2024.
//

import SwiftUI

struct RecipeDetail: View {
    let recipeData: Recipe
    
    var body: some View {
        ZStack {
            Background()
            ScrollView {
                
                VStack(spacing: 20) {
                    Image(recipeData.image)
                        .resizable()
                        .frame(width: 280, height: 233)
                        .cornerRadius(20)
                        .shadow(color: .black.opacity(0.5), radius:4)
                    
                    Text(recipeData.title)
                        .font(.custom("Poppins-Bold", size: 30))
                        .foregroundStyle(.customBleu)
        
                    HStack {
                        Image(systemName: "clock")
                            .foregroundStyle(.customBleu)
                        Text(recipeData.time)
                            .foregroundStyle(.customBleu)
                            .font(.custom("Quicksand", size: 20))
                            .bold()
                        Divider()
                            .frame(height:20)
                        Image(systemName: "star.fill")
                            .foregroundColor(.customMauve)
                        Text("\(recipeData.rating)")
                            .foregroundStyle(.customBleu)
                            .font(.custom("Quicksand", size: 20))
                            .bold()
                    }
                    .frame(maxWidth: .infinity)
                
                    VStack(alignment: .leading) {
                        // Ingredients title
                        Text("Ingrédients pour \(recipeData.servings) personnes")
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundStyle(.customOrange)
                            .padding(.bottom, 4)
                        // Ingredients List
                        
                            ForEach(recipeData.ingredients) { ingredient in
                                HStack {
                                    Text("\(ingredient.quantity)")
                                        .frame(width: 70, height: 30)
                                    Divider()
                                        .frame(height:20)
                                        .background(Color.black.opacity(0.9))
                                    Text(ingredient.name)
                                        .padding(.leading)
                                    Spacer()
                                }
                                .background(.white)
                                    .clipShape(RoundedRectangle(cornerRadius: 20))
                                .font(.custom("Quicksand", size: 18))
                                .foregroundStyle(.customBleu)
                                .padding(.horizontal)
                               
                                Divider()
                                    .background(Color.black.opacity(0.3))
                                    .padding(.horizontal)
    
                            }
                        
                        // Directions Title
                        //VStack(alignment: .leading, spacing: 10) {
                            Text("Instructions")
                                .font(.custom("Poppins-Bold", size: 20))
                                .foregroundStyle(.customOrange)
                                .padding(.top, 4)
                            
                            // Directions
                           // VStack(alignment: .leading) {
                                ForEach(recipeData.directions.indices, id: \.self) { index in
                                    VStack(alignment: .leading, spacing: 10) {
                                        Text("Step \(index + 1)")
                                            .font(.custom("Poppins-Bold", size: 18))
                                            .foregroundStyle(.customBleu)
                                        Text(recipeData.directions[index])
                                            .font(.custom("Quicksand", size: 18))
                                            .foregroundStyle(.customBleu)
                                            .padding(10)
                                        Divider()
                                            .background(Color.black.opacity(0.3))
                                            .padding(.horizontal)
                                    }.padding(.horizontal)
                                        .background(.white)
                                            .clipShape(RoundedRectangle(cornerRadius: 20))
                                        
                                }
                            }.background(.white)
                        //}
                    }
                    .padding(.horizontal)
                }
           // }
        }
    }
}

struct Ingredients: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var quantity: Int
}

struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipeData: recipe1)
    }
}

#Preview {
    RecipeDetail(recipeData: recipe1)
}
