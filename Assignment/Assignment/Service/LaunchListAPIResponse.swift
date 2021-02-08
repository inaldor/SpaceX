//
//  LaunchListAPIResponse.swift
//  Assignment
//
//  Created by Inaldo Ramos Ribeiro on 04/02/2021.
//

import Foundation

/// The instance representing the json response from the endpoint.
typealias LaunchListAPIResponse = [Launchs]

// MARK: Launchs

struct Launchs: Codable {
    
    // MARK: Properties
    
    let rocket: String
    let success: Bool?
    let details: String?
    let flightNumber: Int
    let name: String
    let dateUTC: String
    let id: String

    // MARK: Coding Keys
    
    enum CodingKeys: String, CodingKey {
        
        case rocket = "rocket"
        case success = "success"
        case details = "details"
        case flightNumber = "flight_number"
        case name = "name"
        case dateUTC = "date_utc"
        case id = "id"
    }
}
