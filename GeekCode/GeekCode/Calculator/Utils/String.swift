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
