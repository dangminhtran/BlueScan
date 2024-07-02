//
//  Structures.swift
//  BlueScan
//
//  Created by Apprenant 133 on 24/06/2024.
//

import Foundation
import SwiftUI
import MapKit

struct Articles {
    var image: String
    var title: String
    var description: String
    var subtitle: String
    var descriptionSuite: String
}


struct Pin: Identifiable {
    // @Binding var dissmissModal: Bool
    
    
    var id = UUID()
    
    // Pour le marker
    var icon: String
    var color: Color
    var tag: Int
    
    // Pour la modal
    var image: String
    var name: String
    var address: String
    var coordinates: CLLocationCoordinate2D
    var day1: String
    var day2: String
    var openH: String // Verifier si type Date()
    var closeH: String // Verifier si type Date()
    var note: Int // Nombre d'étoiles
    var tags: String // Comment créer les tags ? C'est un type ? => Mettre dans une énumération
    var like: Bool
    
}

var place: [Pin] = [Pin(
    icon: "fork.knife",
    color: .customOrange,
    tag: 7,
    image: "sardines",
    name: "Oyster Club",
    address: "15 rue de Jouy 75004 Paris",
    coordinates: CLLocationCoordinate2D(latitude: 48.85533073243431, longitude: 2.3578338546736557),
    day1: "Samedi",
    day2: "Dimanche",
    openH: "11h30",
    closeH: "00h30",
    note: 4,
    tags: "Restaurant",
    like: true
),]



struct History:Identifiable {

    var id = UUID()
    var title:String
    var description:String
    var dlist:String
    var ingretients:String
    var ilist:String
    var image:String
    var chooser:String
    var addFavorite : Bool

}
