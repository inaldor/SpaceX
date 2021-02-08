//
//  DateFormatter.swift
//  Assignment
//
//  Created by Inaldo Ramos Ribeiro on 07/02/2021.
//

import Foundation

extension DateFormatter {

    // MARK: Constants

    /// The default data formatters used in the app.
    enum Default {

        /// The formatter used to parse dates from the server responses.
        static let response: DateFormatter = {
            var formatter = DateFormatter()
            formatter.locale = .enGB
            formatter.timeZone = .gmt
            formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ss'.'SSS'Z'"

            return formatter
        }()

    }
}

extension Locale {

    // MARK: Constants

    static let enGB = Locale(identifier: "en_GB")
}

extension TimeZone {

    // MARK: Constants

    /// The GMT time zone.
    static let gmt = TimeZone(secondsFromGMT: 0)!
}
