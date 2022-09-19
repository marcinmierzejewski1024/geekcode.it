//
//  String.swift
//  GeekCode
//
//  Created by Marcin Mierzejewski on 11/09/2022.
//

import Foundation


extension String: Error {}

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}

extension String {
    func numberOfOccurrencesOf(string: String) -> Int {
        return self.components(separatedBy:string).count - 1
    }
}

extension String {

    /// Returns a condensed string, with no extra whitespaces and no new lines.
    var condensed: String {
        return replacingOccurrences(of: "[\\s\n]+", with: " ", options: .regularExpression, range: nil)
    }

    /// Returns a condensed string, with no whitespaces at all and no new lines.
    var extraCondensed: String {
        return replacingOccurrences(of: "[\\s\n]+", with: "", options: .regularExpression, range: nil)
    }

}
