//
//  EditView-ViewModel.swift
//  BucketList
//
//  Created by Mac on 22/03/2024.
//

import Foundation

extension EditView {
    
    @Observable
    class ViewModel {
        var name: String
        var description: String
        var loadingState = LoadingState.loading
        var pages = [Page]()
        
        init(name: String, description: String) {
            _name =  name
            _description =  description
        }
        
        
        func fetchNearbyPlaces(latitude: Double, longitude: Double) async {
            let urlString = "https://en.wikipedia.org/w/api.php?ggscoord=\(latitude)%7C\(longitude)&action=query&prop=coordinates%7Cpageimages%7Cpageterms&colimit=50&piprop=thumbnail&pithumbsize=500&pilimit=50&wbptterms=description&generator=geosearch&ggsradius=10000&ggslimit=50&format=json"
            
            guard let url = URL(string: urlString) else {
                print("Bad URL: \(urlString)")
                return
            }
            
            do {
                let (data, _) = try await URLSession.shared.data(from: url)
                
                // we got some data back!
                let items = try JSONDecoder().decode(Result.self, from: data)
                
                // success – convert the array values to our pages array
                pages = items.query.pages.values.sorted()
                loadingState = .loaded
            } catch {
                // if we're still here it means the request failed somehow
                loadingState = .failed
            }
        }
        
    }
    enum LoadingState {
        case loading, loaded, failed
    }
}
