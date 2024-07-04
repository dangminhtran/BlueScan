//
//  RecipeDetail.swift
//  ApplicationFishy
//
//  Created by Casey on 27/06/2024.


import SwiftUI

struct RecipeDetail: View {
    let recipeData: Recipe // Allows to receive data from Recipe parent
    @State private var starCount: Int = 0
    @State private var ratingSent: Bool = false
    
    var body: some View {
        ZStack {
            Background()
            ScrollView {
                // All page contents contained in V Stack
                VStack(spacing: 20) {
                    Image(recipeData.image)
                        .resizable()
                        .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/) // Prevents distorting the image
                        .frame(width: .infinity, height: 250)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .shadow(color: .black.opacity(0.5), radius:4)
                        .padding(.horizontal)
                    
                    Text(recipeData.title)
                        .font(.custom("Poppins-Bold", size: 30))
                        .foregroundStyle(.customBleu)
                        .multilineTextAlignment(.center)
                    // Line of time and rating
                    HStack {
                        // Clock icon
                        Image(systemName: "clock")
                            .foregroundStyle(.customBleu)
                        // Current recipe time
                        Text(recipeData.time)
                            .foregroundStyle(.customBleu)
                            .font(.custom("Quicksand", size: 20))
                            .bold()
                        // Little divider
                        Divider()
                            .frame(height:20)
                        Image(systemName: "star.fill")
                            .foregroundColor(.customMauve)
                        // Current recipe rating
                        Text("\(recipeData.rating)")
                            .foregroundStyle(.customBleu)
                            .font(.custom("Quicksand", size: 20))
                            .bold()
                    }
                    
                    // New VStack to give a white background just to its containing text
                    VStack(alignment: .leading) {
                        // Ingredients title
                        Text("Ingrédients pour \(recipeData.servings) personnes")
                            .padding(.horizontal)
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundStyle(.customOrange)
                            .padding(.bottom, 4)
                            .padding(.top)
                        
                        // Ingredients List
                        
                        ForEach(recipeData.ingredients) { ingredient in
                            // Pulls ingredient quantity and name from array
                            HStack {
                                Text("\(ingredient.quantity)")
                                    .frame(width: 60, height: 40, alignment: .leading)
                                Divider()
                                    .frame(height:20)
                                Text(ingredient.name)
                                    .padding(.leading)
                                Spacer()
                            }
                            .font(.custom("Quicksand", size: 18))
                            .foregroundStyle(.customBleu)
                            .padding(.horizontal)
                            
                            Divider()
                               .padding(.horizontal)
                        }
                        
                        // Directions Title
                        
                        Text("Directions")
                            .font(.custom("Poppins-Bold", size: 20))
                            .foregroundStyle(.customOrange)
                            .padding(.top, 15)
                            .padding(.horizontal)
                        
                        // Directions Content - loop generated
                        VStack(alignment: .leading, spacing: 10) {
                        ForEach(recipeData.directions.indices, id: \.self) { index in
                                // Generates correct step number
                                Text("Etape \(index + 1)")
                                    .font(.custom("Poppins-Bold", size: 18))
                                    .foregroundStyle(.customBleu)
                                // Pulls the direction of that step
                                Text(recipeData.directions[index])
                                    .font(.custom("Quicksand", size: 18))
                                    .foregroundStyle(.customBleu)
                                    .padding(10)
                                Divider()
                                    .padding(.horizontal)
                            }
                        }.padding(.horizontal)
                        
                        //Stars for rating
                        HStack {
                            Spacer()
                            Text("Note")
                                .foregroundStyle(Color.customOrange)
                                .bold()
                            
                            ForEach(0..<5) { index in
                                Image(systemName: index < starCount ? "star.fill" : "star")
                                    .foregroundColor(.customMauve)
                                    .imageScale(.large)
                                    .onTapGesture {
                                        starCount = index + 1
                                    }
                            }
                            Spacer()
                        }
                        .padding(.top)
                        .padding(.bottom)
                        
                        // Button to submit rating
                        HStack{ 
                            Spacer()
                                Button(action: {
                                    /* Changes boolean to true. If time would add user rating to an array of all ratings, to then generate the average and show that as the overall rating for the recipe */
                                    ratingSent = true
                                }, label: {
                                    // Change button text once Note is sent
                                    Text(ratingSent ? "Note envoyée!" : "Envoyer Note")
                                        .frame(width: 150, height: 50)
                                        .foregroundColor(.white)
                                        .background(.customOrange)
                                        .clipShape(RoundedRectangle(cornerRadius: 35))
                                        .padding(.bottom)
                                })
                            Spacer()
                            }
                    // End VStack for white recipe card
                    }
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                } // end VStack for all page content
                .padding(.horizontal)
                .frame(width: UIScreen.main.bounds.width)
            }
        }
    }
}

// For receiving the data from parent page
struct RecipeDetail_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetail(recipeData: recipe1)
    }
}

// Just a preview for this page for coding purposes
#Preview {
    RecipeDetail(recipeData: recipe1)
}
