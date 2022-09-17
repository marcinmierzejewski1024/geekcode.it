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
