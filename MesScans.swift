///
//  MesScans.swift
//  ApplicationFishy
// CASEY OK
//  Created by SELVA & ALAN on 19/06/2024.
// Modified by Casey on 01/07/2024.


import SwiftUI

struct Product: Identifiable { // Structure now Product not History
    var id = UUID()
    var title: String
    var description: String = "Description: " // Initialise in structure as never needed to change or add
    var dlist: String // short description of product
    var ingredients: String = "Ingredients: " // Initialise in structure as never needed to change or add
    var ilist: String // ingredients list
    var image: String // Product image - Should be pulled from the scanner
    var chooser: String // Scan Result Icon 
    var addFavorite: Bool = false // set to false at creation of a new instance e.g. a scan
}
// Initial array of instances outside of main view structure
 var products = [
    Product(title:"Sardines - Altanta", description: "Description:", dlist: "Sardines à l’huile \r végétale - 125 g", ingredients: "Ingredients:", ilist:"Sardines, huile végétale,\rsel", image: "SardinesAtlanta", chooser:"correct", addFavorite:false),
    Product(title:"Maquereaux - Le Phare d’Eckmul", description: "Description:", dlist: "Thon nature - 160 g", ingredients: "Ingredients:", ilist: "huile vegetable,poisson", image: "sardinesMaquereaux", chooser:"wrong", addFavorite: false),
    Product(title:"Sardines- Parmentier", description: "Description:", dlist: "Sardines à l’huile \r de tournesol - 135 g", ingredients: "Ingredients:", ilist: "huile vegetable,poisson", image: "sardinesParmentier", chooser:"correct", addFavorite: true),
    Product(title:"Thon albacore - Petit Navire", description: "Description:", dlist: "Thon nature - 160 g", ingredients: "Ingredients:", ilist:"Thon, eau, sel", image: "thonPetitNavire", chooser:"correct", addFavorite: false),
    Product(title:"Sardines tournesol", description: "Description:", dlist: "Sardines à l’huile \r de tournesol - 150 g", ingredients: "Ingredients:", ilist: "Huile,Tourne", image: "sardinesTournesol", chooser:"correct", addFavorite: true),
    Product(title:"Boni thon au naturel", description: "Description:", dlist: "Boni-400 g", ingredients: "Ingredients:", ilist:"Poisson naturen,sel.", image: "boniThon", chooser:"correct", addFavorite: true),
]



class Favorites: ObservableObject {
    @Published var allProducts: [Product] = products
}


struct MesScans: View {
    // Sets the title to matches "PageTitle" view to match other pages
    @State private var title = "Mes Scans"
    
    // Allocated array 'products' to a state variable inside this view called allProducts, so we can modify the view (remove from favourites when clicked)
    @State var allProducts: [Product] = products // NEW SCANS TO BE APPENDED TO THIS ARRAY
    
    // Tracks the view selected on the picker
    @State private var viewSelected: String = "Favoris"
    
    var body: some View {
        ZStack {
            Background()
            VStack {
                PageTitle(title: $title)
                HStack {
                    Spacer()
                    Picker(selection: $viewSelected, label: Text("Picker")) {
                        Text("Favoris").tag("Favoris")
                        Text("Historique").tag("historique")
                    }
                    .padding(.bottom)
                    .padding(.top)
                    .pickerStyle(.segmented)
                    .frame(width: 200, height: 30)
                    Spacer()

                }
                
                if viewSelected == "historique" {
                    ScrollView {
                        // List out all products in State array in form of Selva's card - Historique View
                        ForEach($allProducts) { $product in
                            HistoriqueView(product: $product)
                        }
                    }
                } else {
                    ScrollView {
                        // List out all products in State array in form of Alan's card - Favorites View
                        ForEach($allProducts) { $product in
                            if product.addFavorite {
                                FavorisView(product: $product)
                            }
                        }
                    }
                }
            }
        }
    }
}

struct MesScans_Previews: PreviewProvider {
    static var previews: some View {
        MesScans()
    }
}
// SELVA - old CardView - renamed as Historique View
struct HistoriqueView: View {
    @Binding var product: Product
    
    var body: some View {
        VStack{
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: 370, height: 202)   //height width adjustments for rectangle
                .shadow(color: .black, radius: 4)  //shadow effects
                .overlay {    // overlay contents
                    VStack {
                        Spacer()
                        
                        HStack{
                            Image(product.chooser)     // checker image
                                .padding(.leading, 30)
                                .padding(.trailing, 30)
                            
                            Text(product.title)     //title
                                .font(.custom("Poppins-Bold", size: 20))
                                .foregroundColor(.customOrange)
                                .bold()
                        Spacer()
                            
                        }
                        HStack{
                            Image(product.image)           // product image
                                .resizable()
                                .frame(width: 100 , height: 80)
                            VStack(alignment:.leading) {
                                Text(product.description)       //product contents
                                    .foregroundColor(.customBleu)
                                    .bold()
                                Text(product.dlist)
                                    .foregroundColor(.customBleu)
                                Text(product.ingredients)
                                    .foregroundColor(.customBleu)
                                    .bold()
                                Text(product.ilist)
                                    .foregroundColor(.customBleu)
                                // end of product contents
                                
                            }.frame(width: 200, height: 80)    // height width adjustments
                                .font(.custom("Quicksand", size: 18))
                            
                            Button {     // heart button condition
                                product.addFavorite = !product.addFavorite
                                
                                                        } label: {
                                                            Image(systemName: product.addFavorite ? "heart.fill" : "heart")
                                                                .padding(.trailing, 15)
                                                                .foregroundColor(.red)
                                                                .scaleEffect(2) .frame(alignment: .trailing)
                                                                .padding(.bottom)
                                                                
                                                                                                                }
                            // End of heart button
                        }
                        
                        VStack(alignment:.leading){
                            
                            ZStack {
                                VStack(alignment:.leading){
                                }
                               
                               
                            }
                           
                        }
                    Spacer() // spacer for move to center
                        

                        Spacer() // spacer for push up
                           
                           
                        }
                    
                }
               
        } .padding(.horizontal) // for clear the shadow bug in
        .padding(.top)
    }
}

// ALAN - old MyCardView - renamed as favouris for clarity
struct FavorisView: View {
    // Added Binding - previously State - so that it can pass the action of heart button back up to parent view
    @Binding var product: Product
    @ObservedObject var allProducts : Favorites = Favorites()
    var body: some View {
        VStack{
            //card body for overlay all the elemnts
            RoundedRectangle(cornerRadius: 20)
                .fill(.white)
                .frame(width: 370, height: 202)
                .shadow(color: .black, radius: 4)
                .overlay {
                    HStack{
                        //card image
                        Image(product.image)
                            .resizable()
                            .frame(width: 100 , height: 80)
                            .padding(.leading, 10)
                        
                        
                        VStack(alignment:.leading){
                            ZStack {
                                VStack(alignment:.leading){
                                    //card title
                                    HStack {
                                        Text(product.title)
                                            .font(.custom("Poppins-Bold", size: 20))
                                            .foregroundColor(.customOrange)
                                            .bold()
                                        
                                        Spacer()
                                        //favorite button condition
                                        Button {
                                            let newFavorite = Product(
                                                title: "Sardines au Citron & Basilic",
                                                description: "Description",
                                                dlist: "Sardines marinade huile et basilic - 140g",
                                                ingredients: "Ingrédients",
                                                ilist: "Sardines, eau, citron 3,1%, basilic",
                                                image: "sardinesProposal",
                                                chooser: "correct",
                                                addFavorite : true
                                            )
                                            
                                            allProducts.allProducts.append(newFavorite)
                                            print(newFavorite)
                                        product.addFavorite = !product.addFavorite
                                            
                                        } label: {
                                            Image(systemName: product.addFavorite ? "heart.fill" : "heart")
                                                .padding(.trailing, 3)
                                                .foregroundColor(.red)
                                                .scaleEffect(2)
                                        }
                                        .offset(x: -20, y: 45)
                                        //end of condition
                                    }
                                    //Card contents
                                    Text(product.description)
                                        .font(.custom("Quicksand", size: 18))
                                        .foregroundColor(.customBleu)
                                        .bold()
                                    Text(product.dlist)
                                        .font(.custom("Quicksand", size: 18))
                                        .foregroundColor(.customBleu)
                                    Text(product.ingredients)
                                        .font(.custom("Quicksand", size: 18))
                                        .foregroundColor(.customBleu)
                                        .bold()
                                    Text(product.ilist)
                                        .font(.custom("Quicksand", size: 18))
                                        .foregroundColor(.customBleu)
                                    
                                }
                                
                            }
                            
                            
                        }
                        Spacer()
                        
                        
                    }
                    
                }
        }.padding(.horizontal) // for clear the shadow bug in
        .padding(.top)
    }
}

