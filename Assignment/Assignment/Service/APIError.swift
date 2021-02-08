//
//  APIError.swift
//  Assignment
//
//  Created by Inaldo Ramos Ribeiro on 04/02/2021.
//

import Foundation

/// The basic networking/parsing errors of the app.
enum APIError: Error {
    case requestFailed
    case parsingFailed
    
    // MARK: Properties
    
    /// The default message associated to the error.
    var message: String {
        var message: String!
        
        switch self {
        case .requestFailed:
            message = NSLocalizedString(
                "There was an error processing request, please try again later.",
                comment: "Message displayed when the request is not successful."
            )
        case .parsingFailed:
            message = NSLocalizedString(
                "There was an error while performing the JSON parsing. Please, contact the support.",
                comment: "Message displayed when the app can't parse the response comming from the server."
            )
        }
        
        return message
    }
}
