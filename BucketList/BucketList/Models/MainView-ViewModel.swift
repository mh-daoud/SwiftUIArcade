//
//  ContentView-ViewModel.swift
//  BucketList
//
//  Created by Mac on 22/03/2024.
//

import Foundation
import MapKit
import CoreLocation
import LocalAuthentication


extension MainView {
    @Observable
    class ViewModel {
        
        private(set) var locations : [LocationWithDetails]
        var selectedPlace: LocationWithDetails?
        var isUnlocked = false

        let savePath = URL.documentsDirectory.appending(path: "SavedPlaces")

        
        init() {
            do {
                let data = try Data(contentsOf: savePath)
                locations = try JSONDecoder().decode([LocationWithDetails].self, from: data)
            } catch {
                locations = []
            }
        }
        
        func addLocation(at point: CLLocationCoordinate2D) {
            let newLocation = LocationWithDetails(id: UUID(), name: "New location", description: "", latitude: point.latitude, longitude: point.longitude)
            locations.append(newLocation)
            save()
        }
        
        func update(location: LocationWithDetails) {
            guard let selectedPlace else {
                return
            }
            if let index = locations.firstIndex(of: selectedPlace) {
                locations[index] = location
                save()
            }
        }
        
        func save() {
            do {
                let data = try JSONEncoder().encode(locations)
                try data.write(to: savePath, options: [.atomic, .completeFileProtection])
            } catch {
                print("Unable to save data.")
            }
        }
        
        func authenticate() {
            let context = LAContext()
            var error: NSError?

            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                let reason = "Please authenticate yourself to unlock your places."

                context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in

                    if success {
                        self.isUnlocked = true
                    } else {
                        // error
                    }
                }
            } else {
                // no biometrics
            }
        }
    }
}
