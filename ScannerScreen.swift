//
//  ScannerScreen.swift
//  BlueScan
//
//  Created by Apprenant 133 on 21/06/2024.


// PAGE TERMINEE - MINH

import SwiftUI
import VisionKit

struct DataScannerRepresentable: UIViewControllerRepresentable {
    @Binding var shouldStartScanning: Bool
    @Binding var scannedText: String
    var dataToScanFor: Set<DataScannerViewController.RecognizedDataType>
    var handleScan: (Result<String, Error>) -> Void

    class Coordinator: NSObject, DataScannerViewControllerDelegate {
        var parent: DataScannerRepresentable

        init(_ parent: DataScannerRepresentable) {
            self.parent = parent
        }

        func dataScanner(_ dataScanner: DataScannerViewController, didTapOn item: RecognizedItem) {
            switch item {
            case .barcode(let barcode):
                let barcodeValue = barcode.payloadStringValue ?? "Unable to decode the scanned code"
                print("Scanned barcode: \(barcodeValue)")  // Debugging
                parent.scannedText = barcodeValue
                parent.handleScan(.success(barcodeValue))
            default:
                print("unexpected item")
            }
        }
    }

    func makeUIViewController(context: Context) -> DataScannerViewController {
        let dataScannerVC = DataScannerViewController(
            recognizedDataTypes: dataToScanFor,
            qualityLevel: .accurate,
            recognizesMultipleItems: true,
            isHighFrameRateTrackingEnabled: true,
            isPinchToZoomEnabled: true,
            isGuidanceEnabled: true,
            isHighlightingEnabled: true
        )
        
        dataScannerVC.delegate = context.coordinator
        return dataScannerVC
    }

    func updateUIViewController(_ uiViewController: DataScannerViewController, context: Context) {
        if shouldStartScanning {
            try? uiViewController.startScanning()
        } else {
            uiViewController.stopScanning()
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

struct ScannerScreen: View {
    @State var isShowingScanner = true
    @State private var scannedText = "Scannez votre produit"
    @State private var productInfo: String = ""
    
    @State private var barCode = ""

    func handleScan(result: Result<String, Error>) {
        switch result {
        case .success(let barcode):
            print("Handling scan for barcode: \(barcode)")  // Debugging
            fetchProductInfo(barcode: barcode) { result in
                switch result {
                case .success(let info):
                    DispatchQueue.main.async {
                        productInfo = info
                    }
                case .failure(let error):
                    DispatchQueue.main.async {
                        productInfo = "Error: \(error.localizedDescription)"
                    }
                }
            }
        case .failure(let error):
            productInfo = "Error: \(error.localizedDescription)"
        }
    }

    func fetchProductInfo(barcode: String, completion: @escaping (Result<String, Error>) -> Void) {
        guard let url = URL(string: "https://world.openfoodfacts.org/api/v0/product/\(barcode).json") else {
            completion(.failure(NSError(domain: "Invalid URL", code: 400, userInfo: nil)))
            return
        }

        print("Fetching product info from: \(url)")  // Debugging
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let data = data else {
                completion(.failure(NSError(domain: "No data", code: 500, userInfo: nil)))
                return
            }

            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                   let product = json["product"] as? [String: Any] {
                    let productName = product["product_name"] as? String ?? "No product name"
                    let ingredients = product["ingredients_text"] as? String ?? "No ingredients"
                    
                    // Ajout des données
                    let productCategory = product["categories"] as? String ?? "No product category"
                    let productOrigin = product["origins"] as? String ?? "No product origin"
                    //let positiveNutrient = product["positive_nutrients"] as? [String] ?? ["No positive nutrient"]
                    let nutriscore = product["nutriscore_grade"] as? String ?? "No nutriscore"
                    let packaging = product["packaging"] as? String ?? "No packaging"
                    let productQuantity = product["quantity"] as? String ?? "No quantity"
                    
                    
                    let info = "\(productName)\n\nOrigine: \(productOrigin)\n\nNutriscore: \(nutriscore)\n\nPackaging: \(packaging)"
                    
                    print("Product info: \(info)")  // Debugging
                    completion(.success(info))
                } else {
                    print("Invalid JSON structure")  // Debugging
                    completion(.failure(NSError(domain: "Invalid JSON", code: 500, userInfo: nil)))
                }
            } catch {
                print("JSON decoding error: \(error.localizedDescription)")  // Debugging
                completion(.failure(error))
            }
        }.resume()
    }

    
// Test Modal
    @State private var showModal: Bool = false
    @State private var modalGood: Bool = false
    
    var body: some View {
        
            
            if DataScannerViewController.isSupported && DataScannerViewController.isAvailable {
                ZStack(alignment: .bottom) {
                    DataScannerRepresentable(
                        shouldStartScanning: $isShowingScanner,
                        scannedText: $scannedText,
                        dataToScanFor: [.barcode(symbologies: [.ean13, .code128, .upce])],
                        handleScan: handleScan
                    )
                    
                        
                        VStack {
                            Text(scannedText)
                                .padding()
                                .background(Color.white)
                                .foregroundColor(.customOrange)
                                .bold()
                            
                        }

                }.onChange(of: scannedText) { newValue in
                    if newValue == "3263670237818" {
                        showModal = true
                    } else {
                        modalGood = true
                    }
                }
                .sheet(isPresented: $showModal) {
                    
                    NavigationStack {
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.secondary)
                            .frame(width: 50, height: 5)
                            .padding(.top, 20)
                        
                        Image("maquereaux")
                            .resizable()
                            .frame(width: 350, height: 250)
                        
                        Text(productInfo)
                            .foregroundColor(.customBleu)
                        
                        Spacer()
                        
                        Text("Pêche durable")
                            .font(.custom("Poppins-Bold", size: 20))
                            .bold()
                            .foregroundColor(.customOrange)
                        
                        HStack {
                            Text("Etat de la ressource")
                                .font(.custom("Quicksand_Book", size: 18))
                                .foregroundColor(.customBleu)
                            Spacer()
                            Image(systemName: "exclamationmark.octagon.fill")
                                .foregroundColor(.red)
                                .imageScale(.large)
                            
                        }.frame(width: 350)
                        
                        HStack {
                            Text("Taille")
                                .font(.custom("Quicksand_Book", size: 18))
                                .foregroundColor(.customBleu)
                            Spacer()
                            Image(systemName: "exclamationmark.octagon.fill")
                                .foregroundColor(.red)
                                .imageScale(.large)
                            
                        }.frame(width: 350)
                        
                        HStack {
                            Text("Saison")
                                .font(.custom("Quicksand_Book", size: 18))
                                .foregroundColor(.customBleu)
                            Spacer()
                            Image(systemName: "exclamationmark.octagon.fill")
                                .foregroundColor(.red)
                                .imageScale(.large)
                            
                        }.frame(width: 350)
                        
                        HStack {
                            Text("Statut de l'espèce")
                                .font(.custom("Quicksand_Book", size: 18))
                                .foregroundColor(.customBleu)
                            Spacer()
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                                .imageScale(.large)
                            
                        }.frame(width: 350)
                        
                        Spacer()
                        
                        Text("Aquaculture")
                            .font(.custom("Poppins-Bold", size: 20))
                            .bold()
                            .foregroundColor(.customOrange)
                        
                        HStack {
                            Text("Alimentation")
                                .font(.custom("Quicksand_Book", size: 18))
                                .foregroundColor(.customBleu)
                            Spacer()
                            Image(systemName: "exclamationmark.octagon.fill")
                                .foregroundColor(.red)
                                .imageScale(.large)
                            
                        }.frame(width: 350)
                        
                        HStack {
                            Text("Pratiques d'élevage")
                                .font(.custom("Quicksand_Book", size: 18))
                                .foregroundColor(.customBleu)
                            Spacer()
                            Image(systemName: "exclamationmark.octagon.fill")
                                .foregroundColor(.red)
                                .imageScale(.large)
                            
                        }.frame(width: 350)
                        
                        HStack {
                            Text("Impact sur l'environnement")
                                .font(.custom("Quicksand_Book", size: 18))
                                .foregroundColor(.customBleu)
                            Spacer()
                            Image(systemName: "exclamationmark.octagon.fill")
                                .foregroundColor(.red)
                                .imageScale(.large)
                            
                        }.frame(width: 350)
                            .padding(.bottom, 20)
                        
                        NavigationLink(destination: proposal()) {
                            Text("Trouver une alternative")
                                .font(.custom("Poppins-Bold", size: 15))
                                .foregroundColor(.white)
                                .padding()
                                .background(.customOrange)
                                .cornerRadius(30)
                        }
                    }
                        
                    }
                .sheet(isPresented: $modalGood) {
                    
                    RoundedRectangle(cornerRadius: 20)
                        .fill(.secondary)
                        .frame(width: 50, height: 5)
                        .padding(.top, 20)
                    
                    Image("sardinesProposal")
                    .resizable()
                    .frame(width: 400, height: 350)
                  
                    
                    Spacer()
                    
                    Text("Pêche durable")
                        .font(.custom("Poppins-Bold", size: 20))
                        .bold()
                        .foregroundColor(.customOrange)
                    
                    HStack {
                        Text("Etat de la ressource")
                            .font(.custom("Quicksand_Book", size: 18))
                            .foregroundColor(.customBleu)
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                         
                    }.frame(width: 350)
                
                    HStack {
                        Text("Taille")
                            .font(.custom("Quicksand_Book", size: 18))
                            .foregroundColor(.customBleu)
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                           
                    }.frame(width: 350)
                
                    HStack {
                        Text("Saison")
                            .font(.custom("Quicksand_Book", size: 18))
                            .foregroundColor(.customBleu)
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                          
                    }.frame(width: 350)
                
                    HStack {
                        Text("Statut de l'espèce")
                            .font(.custom("Quicksand_Book", size: 18))
                            .foregroundColor(.customBleu)
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                           
                    }.frame(width: 350)
                
                Spacer()
                    
                    Text("Aquaculture")
                        .font(.custom("Poppins-Bold", size: 20))
                        .bold()
                        .foregroundColor(.customOrange)
                    
                    HStack {
                        Text("Alimentation")
                            .font(.custom("Quicksand_Book", size: 18))
                            .foregroundColor(.customBleu)
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                          
                    }.frame(width: 350)
                
                    HStack {
                        Text("Pratiques d'élevage")
                            .font(.custom("Quicksand_Book", size: 18))
                            .foregroundColor(.customBleu)
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                   
                    }.frame(width: 350)
                
                    HStack {
                        Text("Impact sur l'environnement")
                            .font(.custom("Quicksand_Book", size: 18))
                            .foregroundColor(.customBleu)
                        Spacer()
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                            .imageScale(.large)
                          
                    }.frame(width: 350)
                }
                
                
            } else if !DataScannerViewController.isSupported {
                Text("It looks like this device doesn't support the DataScannerViewController")
            } else {
                Text("It appears your camera may not be available")
            }
            
        }
}
    

struct proposal: View {
    
    var body: some View {
        
        RoundedRectangle(cornerRadius: 20)
            .fill(.secondary)
            .frame(width: 50, height: 5)
            .padding(.top, 20)
        
        Image("sardinesProposal")
        .resizable()
        .frame(width: 400, height: 350)
      
        
        Spacer()
        
        Text("Pêche durable")
            .font(.custom("Poppins-Bold", size: 20))
            .bold()
            .foregroundColor(.customOrange)
        
        HStack {
            Text("Etat de la ressource")
                .font(.custom("Quicksand_Book", size: 18))
                .foregroundColor(.customBleu)
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .imageScale(.large)
             
        }.frame(width: 350)
    
        HStack {
            Text("Taille")
                .font(.custom("Quicksand_Book", size: 18))
                .foregroundColor(.customBleu)
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .imageScale(.large)
               
        }.frame(width: 350)
    
        HStack {
            Text("Saison")
                .font(.custom("Quicksand_Book", size: 18))
                .foregroundColor(.customBleu)
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .imageScale(.large)
              
        }.frame(width: 350)
    
        HStack {
            Text("Statut de l'espèce")
                .font(.custom("Quicksand_Book", size: 18))
                .foregroundColor(.customBleu)
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .imageScale(.large)
               
        }.frame(width: 350)
    
    Spacer()
        
        Text("Aquaculture")
            .font(.custom("Poppins-Bold", size: 20))
            .bold()
            .foregroundColor(.customOrange)
        
        HStack {
            Text("Alimentation")
                .font(.custom("Quicksand_Book", size: 18))
                .foregroundColor(.customBleu)
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .imageScale(.large)
              
        }.frame(width: 350)
    
        HStack {
            Text("Pratiques d'élevage")
                .font(.custom("Quicksand_Book", size: 18))
                .foregroundColor(.customBleu)
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .imageScale(.large)
       
        }.frame(width: 350)
    
        HStack {
            Text("Impact sur l'environnement")
                .font(.custom("Quicksand_Book", size: 18))
                .foregroundColor(.customBleu)
            Spacer()
            Image(systemName: "checkmark.circle.fill")
                .foregroundColor(.green)
                .imageScale(.large)
              
        }.frame(width: 350)
    }
}


#Preview {
    ScannerScreen()
}
