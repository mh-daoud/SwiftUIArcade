//
//  Location.swift
//  BucketList
//
//  Created by Mac on 22/03/2024.
//

import Foundation
import MapKit

struct LocationWithDetails : Codable, Identifiable, Equatable {
    var id: UUID
    var name: String
    var description: String
    var latitude: Double
    var longitude: Double
    
    var coordinate: CLLocationCoordinate2D {
        CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
    }
    
    static let example = LocationWithDetails(id: UUID(), name: "Buckingham Palace", description: "Lit by over 40,000 lightbulbs.", latitude: 51.501, longitude: -0.141)
    
    static func ==(lhs: LocationWithDetails, rhs: LocationWithDetails) -> Bool {
        lhs.id == rhs.id
    }

}
