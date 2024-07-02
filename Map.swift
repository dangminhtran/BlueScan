//
//  Map.swift
//  BlueScan
//
//  Created by Apprenant 133 on 21/06/2024.
//

// AJOUTER LA GEOLOCALISATION
import SwiftUI
import MapKit


extension MKCoordinateRegion {
    static let paris = MKCoordinateRegion(
        center: CLLocationCoordinate2D(
            latitude: 48.857470088941724,
            longitude: 2.3456586118149216),
        span: MKCoordinateSpan(latitudeDelta: 0.02, longitudeDelta: 0.02)
    )
}



// INSTANCES
var restaurant0 = Pin(
    icon: "fork.knife",
    color: .customMauve,
    tag: 1,
    image:"restaurant",
    name: "Comptoir des Mers",
    address: "1 rue de Turenne, 75004 Paris",
    coordinates: CLLocationCoordinate2D(latitude: 48.85500175578553, longitude: 2.362948181449204),
    day1: "Dimanche",
    day2: "Samedi",
    openH: "11h",
    closeH: "23h",
    note: 4,
    tags: "Restaurant",
    like: false
)

var restaurant2 = Pin(
    icon: "fork.knife",
    color: .customMauve,
    tag: 2,
    image: "cagouille",
    name: "La Cagouille",
    address: "10 place Constantin-Brancusi, 75014 Paris",
    coordinates: CLLocationCoordinate2D(latitude: 48.84137607345095, longitude: 2.319338311680679),
    day1: "Lundi",
    day2: "Vendredi",
    openH: "14h30",
    closeH: "00h30",
    note: 4,
    tags: "Restaurant",
    like: true
)



var poissonnerie = Pin(
    icon: "fish",
    color: .customOrange,
    tag: 3,
    image: "poissonnerie",
    name: "Montreuil Sur Mer",
    address: "13 rue de l'Eglise, 93100 Montreuil",
    coordinates: CLLocationCoordinate2D(latitude: 48.86404934027263, longitude: 2.4426477644176745),
    day1: "Samedi",
    day2: "Samedi",
    openH: "12h",
    closeH: "00h",
    note: 3,
    tags: "Pêche Durable",
    like: true
)

var commerce = Pin(
    icon: "fossil.shell",
    color: .customVert,
    tag: 4,
    image: "poissonnerie",
    name: "Au Caprice des Mers",
    address: "14 rue Henri Barbusse, Levallois-Perret",
    coordinates: CLLocationCoordinate2D(latitude: 48.8962173418531, longitude: 2.29051349672031),
    day1: "Lundi",
    day2: "Vendredi",
    openH: "12h",
    closeH: "00h",
    note: 3,
    tags: "Epicerie",
    like: false
)

var poissonerie2 = Pin(
    icon: "fish",
    color: .customOrange,
    tag: 5,
    image: "ledreux",
    name: "Poissonnerie Ledreux",
    address: "67 Av. du Général Leclerc, 75014 Paris",
    coordinates: CLLocationCoordinate2D(latitude: 48.834336117557534, longitude: 2.3295382455062463),
    day1: "Dimanche",
    day2: "Samedi",
    openH: "12h",
    closeH: "00h",
    note: 5,
    tags: "Epicerie",
    like: false
)

var restaurant3 = Pin(
    icon: "fish",
    color: .customOrange,
    tag: 5,
    image: "ledreux",
    name: "Poissonnerie Ledreux",
    address: "67 Av. du Général Leclerc, 75014 Paris",
    coordinates: CLLocationCoordinate2D(latitude: 48.834336117557534, longitude: 2.3295382455062463),
    day1: "Vendredi",
    day2: "Mercredi",
    openH: "12h",
    closeH: "00h",
    note: 5,
    tags: "Poissonnerie",
    like: false
)

var commerce2 = Pin(
    icon: "fossil.shell",
    color: .customVert,
    tag: 6,
    image: "ledreux",
    name: "Sur Mer",
    address: "53 rue de Lancry, 75010 Paris",
    coordinates: CLLocationCoordinate2D(latitude: 48.87584203423585, longitude: 2.3624970423268072),
    day1: "Dimanche",
    day2: "Samedi",
    openH: "12h",
    closeH: "00h",
    note: 2,
    tags: "Epicerie",
    like: false
)


class MapHelper: ObservableObject {
    @Published var places: [Pin] = [restaurant0, restaurant2, poissonnerie, poissonerie2, restaurant3, commerce, commerce2]
}


// DEBUT DE LA VUE PRINCIPALE
struct MapScreen: View {
    
   
    
  //  @EnvironmentObject var placesData: PlacesData
    @ObservedObject var place : MapHelper = MapHelper()
    
    @State private var showModal = false
    
    @State private var count: Int = 0
    
    @State var places: [Pin] = [restaurant0, restaurant2, poissonnerie, poissonerie2, restaurant3, commerce, commerce2]
    
    @State private var selectedPlace: Pin?
    
    
    //@ObservedObject var locationManager = LocationManager()
    let locationManager = CLLocationManager()
    
    
    @State private var position: MapCameraPosition = .automatic
    @State private var selectedTag: Int?
    
    
    var body: some View {
        
        NavigationStack {
            
            ZStack {
                
                Map(position: $position, selection: $selectedTag) {
                    
                    ForEach(places) { place in
                        Annotation(place.name, coordinate: place.coordinates) {
                            Image(systemName: place.icon)
                                .frame(width: 44, height: 44)
                                .background(place.color)
                                .clipShape(.circle)
                                .tag(place.tag)
                                .onTapGesture {
                                    selectedPlace = place
                                    
                                }
                        }
                        
                    }
                    
                    // Si le temps, rajouter Geolocalisation
                    // UserAnnotation()
                    
                }.mapControls {
                    MapUserLocationButton()
                    MapCompass()
                    MapScaleView()
                }
                .safeAreaInset(edge: .bottom) {
                    NavigationLink(destination: MapDetails(  places: $places)) {
                        Image(systemName: "cross.fill")
                            .foregroundColor(.white)
                    }.frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                        .font(.system(size: 45))
                        .foregroundColor(.white)
                        .background(.customOrange)
                        .cornerRadius(100)
                        .padding(.leading, 170)
                        .padding(.bottom, 50)
                        .navigationDestination(for: String.self) { route in
                            switch route {
                            case "Map":
                                MapScreen()
                            case "MapDetails":
                                MapDetails(places: $places)
                            default :
                                Text("Cette destination n'existe pas")
                            }
                        }
                }
            }
            
            
        }.sheet(item: $selectedPlace) { place in
            
            VStack {
                
                RoundedRectangle(cornerRadius: 20)
                    .fill(.secondary)
                    .frame(width: 50, height: 5)
                    .padding(.top, 20)
                    
                
                Spacer()
                VStack(alignment: .leading, spacing: 15) {
                    
                    
                    Image(place.image)
                        .resizable()
                        .frame(width: 400, height: 350)
                    
                    HStack {
                        Text(place.name)
                            .foregroundStyle(.customOrange)
                            .font(.custom("Poppins-Bold", size: 30))
                            .padding(.leading, 30)
                        
                        Image(systemName: place.like ? "heart.fill" : "heart")
                            .imageScale(.large)
                            .foregroundColor(.red)
                            .padding(.leading, 20)
                        
                    }
                    
                    Text(place.address)
                        .foregroundStyle(Color.customBleu)
                        .font(.custom("Quicksand_Bold", size: 20))
                        .padding(.leading, 30)
                    
                    HStack {
                        
                        Text("Ouvert du \(place.day1) au \(place.day2)")
                            .foregroundStyle(Color.customBleu)
                            .font(.custom("Quicksand_Book", size: 15))
                            .padding(.leading, 30)
                        
                        Text("De \(place.openH) à \(place.closeH)")
                            .foregroundStyle(Color.customBleu)
                            .font(.custom("Quicksand_Book", size: 15))
                            .padding(.leading, 30)
   
                        
                    }
                    
                    // Rendre les notes dynamiques
                    HStack {
                        
                        ForEach(0...4, id: \.self) { index in
                            Image(systemName: place.note >= index ? "star.fill" : "star")
                                .imageScale(.large)
                                .foregroundColor(.customMauve)
                            
                        }
                        
                    }.padding(.leading, 30)
                    
                    Text(place.tags.uppercased())
                        .font(.system(size:15))
                        .frame(width: 150, height: 30)
                        .background(place.color)
                        .cornerRadius(10)
                        .padding(.leading, 30)
                        .foregroundColor(place.color == .customVert || place.color == .customMauve ? .customBleu : .white )
                    
                }
                Spacer()
                
            }
        }
    }
    
}



#Preview {
    MapScreen()
}

