//
//  GeekCodeTests.swift
//  GeekCodeTests
//
//  Created by Marcin Mierzejewski on 07/08/2022.
//

import XCTest
@testable import GeekCode

class GeekCodeTests: XCTestCase {
    
    let calculator = GeekCodeCalculator()
    
    func testSpecializationsFrom() throws {
        var specs = calculator.specializationsFrom(input: "GB/CS/TW")
        XCTAssert(specs?.count == 3)
        XCTAssert(specs!.contains(GeekCodeSpecialization.B))
        XCTAssert(specs!.contains(GeekCodeSpecialization.CS))
        XCTAssert(specs!.contains(GeekCodeSpecialization.TW))
        
        
        
        specs = calculator.specializationsFrom(input: "klajfkldjslkW")
        XCTAssert(specs?.count == 0)
        
        
        specs = calculator.specializationsFrom(input: "GMD/MD/MUAUAUA")
        XCTAssert(specs?.count == 1)
        XCTAssert(specs!.contains(GeekCodeSpecialization.MD))
        
        specs = calculator.specializationsFrom(input: "GMD/AT/MUAUAUA")
        XCTAssert(specs?.count == 2)
        XCTAssert(specs!.contains(GeekCodeSpecialization.MD))
        XCTAssert(specs!.contains(GeekCodeSpecialization.AT))

        
        
    }
    
    
}
