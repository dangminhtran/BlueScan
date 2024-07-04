//
//  Recipe.swift
//  ApplicationFishy
//
//  Created by Casey on 24/06/2024.


import SwiftUI

struct RecipeMain: View {
    @State private var searchInput: String = "" // Collects user input to search bar
    @State private var title: String = "Recettes" // Title of page
    @State private var recipes: [Recipe] = [recipe1, recipe2, recipe3, recipe4, recipe5, recipe6, recipe7, recipe8] // Array containing all recipes
    
    var body: some View {
        NavigationStack {
            // Page content in VStack
            VStack (spacing: 20) {
                PageTitle(title: $title)
                
                //Search bar
                SearchBar(searchInput: $searchInput)
                
                // Recipe Cards
                ScrollView {
                    RecipeCards(recipes: $recipes, searchInput: $searchInput)
                    
                }
            }.background(Background())// End V Stack page content
        } // End of Nav
    } // End of Body
} // end of Recipe View

#Preview {
    RecipeMain()
}

// Structure of search bar
struct SearchBar: View {
    @Binding var searchInput: String
    
    var body: some View {
        ZStack {
            // Mimick a search box behind text input
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(.lightGrey)
            // User enter their search
            TextField("Trouver une recette", text: $searchInput)
                .padding(.leading, 40)
            // Magnifying glass image at left of search bar
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                Spacer()
                // Cancel button to appear if search input is not empty
                if !searchInput.isEmpty {
                    Button(action: {
                        searchInput.removeAll()
                    }, label: {
                        Image(systemName: "xmark.circle.fill")
                            .scaleEffect(1.3)
                            .foregroundStyle(Color.customBleu)
                            .padding(.trailing, 10)
                    })
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: 44)
        .padding(.horizontal)
    }
}
// Extraction de vue for recipe card loop generation
struct RecipeCards: View {
    @Binding var recipes: [Recipe]
    @Binding var searchInput: String
    
    var body: some View {
        // Loop generates cards according to search input, if empty shows all
        ForEach(recipes.filter { searchInput.isEmpty || $0.title.localizedCaseInsensitiveContains(searchInput)}) { eachRecipe in
            
            // Send data through link to recipe detail view
            NavigationLink(destination: RecipeDetail(recipeData: eachRecipe)) {
                HStack
                {
                    // Column 1 - image
                    Image(eachRecipe.image)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 80)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .padding(7)
                    // Column 2 - recipe title and details
                    VStack (alignment: .leading)
                    {
                        // Recipe Title
                        Text(eachRecipe.title)
                            .multilineTextAlignment(/*@START_MENU_TOKEN@*/.leading/*@END_MENU_TOKEN@*/)
                            .foregroundStyle(.customOrange)
                            .font(.custom("Poppins-Bold", size: 18))
                            .bold()
                            .padding(1)
                        // Time and Rating
                        HStack {
                            // Time
                            Image(systemName: "clock")
                                .foregroundStyle(.customBleu)
                            Text(eachRecipe.time)
                                .foregroundStyle(.customBleu)
                                .font(.custom("Quicksand", size: 16))
                                .bold()
                            Spacer()
                            // Rating stars
                            HStack(spacing: 0) {
                                ForEach(0..<5) { index in
                                    Image(systemName: index < eachRecipe.rating ? "star.fill" : "star")
                                        .foregroundColor(.customMauve)
                                }
                            }
                        }.padding(.trailing)
                    }
                    .frame(maxWidth: .infinity)
                    Spacer()
                }
                .frame(width: 370, height: 93)
                .background(.white)
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .shadow(color: .black.opacity(0.5), radius: 2)
                .padding(.horizontal)
            }
            .padding(.top, 5)
        }
    }
}
