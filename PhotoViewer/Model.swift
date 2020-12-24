//
//  Model.swift
//  PhotoViewer
//
//  Created by Алишер Алсейт on 24.12.2020.
//

import Foundation

// Udentifiable makes possible to make in A list o ruse each to iterate through everything
struct Photo: Identifiable, Decodable {
    
    var id: String?
    var alt_description: String?
    var urls: [String : String]
    
    
}

class UnsplashData: ObservableObject {
    
    //  Published: every time when we update photoArray it will be updated to in User Interface
    @Published var photoArray: [Photo] = []
    
    
    init() {
        
        loadData()
        
    }
    
    func loadData() {
        
        let key = "CQAwBNuoBld3Yvcj9b95uU-TSmQ2GXksgFsCvoE_m8s"
        
        let url = "https://api.unsplash.com/photos/random/?count=30&client_id=\(key)"
        
        let session = URLSession(configuration: .default)
        
        session.dataTask(with: URL(string: url)!){ (data, _, error) in
          
            guard let data = data else {
                print("UrlSession dataTask error:", error ?? "nil")
                return
            }
            
            do {
                
                let json = try JSONDecoder().decode([Photo].self, from: data)
                
                print(json)
                
                for photo in json {
                    
                    DispatchQueue.main.async {
                        
                        guard  photo.alt_description != nil else{
                            return
                        }
                        
                        self.photoArray.append(photo)
                    }
                }

            } catch {
                
                print(error)
                
            }
            

        }.resume()
    }
    
}
