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
        XCTAssert(specs!.contains(GeekCodeSpecialization.BUSINESS_GEEK))
        XCTAssert(specs!.contains(GeekCodeSpecialization.GEEK_OF_COMPUTER_SCIENCE))
        XCTAssert(specs!.contains(GeekCodeSpecialization.GEEK_OF_TECHNICAL_MAGAZINE))



        specs = calculator.specializationsFrom(input: "klajfkldjslkW")
        XCTAssert(specs?.count == 0)


        specs = calculator.specializationsFrom(input: "GMD/MD/MUAUAUA")
        XCTAssert(specs?.count == 1)
        XCTAssert(specs!.contains(GeekCodeSpecialization.MEDICINE_GEEK))

        specs = calculator.specializationsFrom(input: "GMD/AT/MUAUAUA")
        XCTAssert(specs?.count == 2)
        XCTAssert(specs!.contains(GeekCodeSpecialization.MEDICINE_GEEK))
        XCTAssert(specs!.contains(GeekCodeSpecialization.THE_GEEK_OF_EVERYTHING))


        specs = calculator.specializationsFrom(input: "gat/md/MUAUAUA/")
        XCTAssert(specs?.count == 2)
        XCTAssert(specs!.contains(GeekCodeSpecialization.MEDICINE_GEEK))
        XCTAssert(specs!.contains(GeekCodeSpecialization.THE_GEEK_OF_EVERYTHING))

        
        specs = calculator.specializationsFrom(input: "G!")
        XCTAssert(specs?.count == 1)
        XCTAssert(specs!.contains(GeekCodeSpecialization.WITHOUT))
        
        specs = calculator.specializationsFrom(input: "GMD/!/MUAUAUA")
        XCTAssert(specs?.count == 2)
        XCTAssert(specs!.contains(GeekCodeSpecialization.MEDICINE_GEEK))
        XCTAssert(specs!.contains(GeekCodeSpecialization.WITHOUT))

        
        
        
    }
    
    
    
    func testCategoryFrom() throws
    {
        var category = calculator.categoryFrom(string: "a++")!
        
        switch category {
        case .Age(let modifier, let grader):
            XCTAssert(true);
            XCTAssert(modifier == .none)
            XCTAssert(grader == .plusPlus)
        default:
            XCTAssert(false);
        
        }


        category = calculator.categoryFrom(string: "S:")!
        switch category {
        case .Dimensions(let modifier, let grader,let modifier2,let grader2):
            XCTAssert(true);
            XCTAssert(modifier == .none)
            XCTAssert(grader == .none)
            XCTAssert(modifier2 == .none)
            XCTAssert(grader2 == .none)
        default:
            XCTAssert(false);
        
        }
        category = calculator.categoryFrom(string: "S+:+")!
        switch category {
        case .Dimensions(let modifier, let grader,let modifier2,let grader2):
            XCTAssert(true);
            XCTAssert(modifier == .none)
            XCTAssert(grader == .plus)
            XCTAssert(modifier2 == .none)
            XCTAssert(grader2 == .plus)
        default:
            XCTAssert(false);
        
        }
        category = calculator.categoryFrom(string: "S+:")!
        switch category {
        case .Dimensions(let modifier, let grader,let modifier2,let grader2):
            XCTAssert(true);
            XCTAssert(modifier == .none)
            XCTAssert(grader == .plus)
            XCTAssert(modifier2 == .none)
            XCTAssert(grader2 == .none)
        default:
            XCTAssert(false);
        
        }
        category = calculator.categoryFrom(string: "S:---")!
        switch category {
        case .Dimensions(let modifier, let grader,let modifier2,let grader2):
            XCTAssert(true);
            XCTAssert(modifier == .none)
            XCTAssert(grader == .none)
            XCTAssert(modifier2 == .none)
            XCTAssert(grader2 == .minusMinusMinus)
        default:
            XCTAssert(false);
        
        }

    }
    
    
}
