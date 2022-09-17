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
    
    
    
    func testCategoryFromInput() throws {
        var category = calculator.categoryFrom(input: "a++")!
        XCTAssert(category == .Age)
        
        category = calculator.categoryFrom(input: "d:")!
        XCTAssert(category == .Dimensions);
        
        category = calculator.categoryFrom(input: "d+:+")!
        XCTAssert(category == .Dimensions);
        
        category = calculator.categoryFrom(input: "d+:")!
        XCTAssert(category == .Dimensions);
        
        category = calculator.categoryFrom(input: "d:---")!
        XCTAssert(category == .Dimensions);
    }
    
    func testCategoryItemFrom() throws {
        
        var item = try calculator.categoryItemFrom(input: "a++", with: .Age)
        XCTAssert(item!.modifiers[0].contains(.RIGID(.Age, .plusPlus)))
        XCTAssert(item!.modifiers.count == 1)
        XCTAssert(item!.modifiers[0].count == 1)

        
        item = try calculator.categoryItemFrom(input: "d:", with: .Dimensions)
        XCTAssert(item!.modifiers[0].contains(.RIGID(.Dimensions, .normal)))
        XCTAssert(item!.modifiers[1].contains(.RIGID(.Dimensions, .normal)))
        XCTAssert(item!.modifiers.count == 2)


        item = try calculator.categoryItemFrom(input: "d+:++", with: .Dimensions)
        XCTAssert(item!.modifiers[0].contains(.RIGID(.Dimensions, .plus)))
        XCTAssert(item!.modifiers[1].contains(.RIGID(.Dimensions, .plusPlus)))
        XCTAssert(item!.modifiers.count == 2)


        item = try calculator.categoryItemFrom(input: "d:---", with: .Dimensions)
        XCTAssert(item!.modifiers[0].contains(.RIGID(.Dimensions, .normal)))
        XCTAssert(item!.modifiers[1].contains(.RIGID(.Dimensions, .minusMinusMinus)))
        XCTAssert(item!.modifiers.count == 2)

        
        item = try calculator.categoryItemFrom(input: "C++(C-)", with: .Clothing)
        XCTAssert(item!.modifiers[0].contains(.RIGID(.Clothing, .plusPlus)))
        XCTAssert(item!.modifiers[0].contains(.CROSS_OVER(.Clothing, .minus)))
        XCTAssert(item!.modifiers.count == 1)


//        (Head : Beard : Brows : Mustache : Sideburns
        item = try calculator.categoryItemFrom(input: "B++:-:+:--(+):+>++", with: .Beard)
        XCTAssert(item!.modifiers[0].contains(.RIGID(.Beard, .plusPlus)))
        XCTAssert(item!.modifiers[1].contains(.RIGID(.Beard, .minus)))
        XCTAssert(item!.modifiers[2].contains(.RIGID(.Beard, .plus)))
        XCTAssert(item!.modifiers[3].contains(.RIGID(.Beard, .minusMinus)))
        XCTAssert(item!.modifiers[3].contains(.CROSS_OVER(.Beard, .plus)))
        XCTAssert(item!.modifiers[4].contains(.RIGID(.Beard, .plus)))
        XCTAssert(item!.modifiers[4].contains(.WANNABE(.Beard, .plusPlus)))
        XCTAssert(item!.modifiers.count == 5)
        
        item = try calculator.categoryItemFrom(input: "ul++$", with: .Linux)
        XCTAssert(item!.modifiers[0].contains(.PROFESSIONAL(.Linux, .plusPlus)))
        XCTAssert(item!.modifiers.count == 1)
        XCTAssert(item!.modifiers[0].count == 1)

                                  
        item = try calculator.categoryItemFrom(input: "!lj", with: .Java)
        XCTAssert(item!.modifiers[0].contains(.REFUSE(.Java, .normal)))
        XCTAssert(item!.modifiers.count == 1)
        XCTAssert(item!.modifiers[0].count == 1)

        
        item = try calculator.categoryItemFrom(input: "lm?", with: .Matlab)
        XCTAssert(item!.modifiers[0].contains(.NO_IDEA(.Matlab, .normal)))
        XCTAssert(item!.modifiers.count == 1)
        XCTAssert(item!.modifiers[0].count == 1)


        item = try calculator.categoryItemFrom(input: "lm--^", with: .Matlab)
        XCTAssert(item!.modifiers[0].contains(.DEGREE(.Matlab, .minusMinus)))
        XCTAssert(item!.modifiers.count == 1)
        XCTAssert(item!.modifiers[0].count == 1)




    }
    
    
    func testGradeFromString() throws {
        
        var grade = GeekCodeGrading.from(string: "a++--")
        XCTAssert(grade == nil)
        
        grade = GeekCodeGrading.from(string: "a++++")
        XCTAssert(grade == .plusPlusPlusPlus)
        
        grade = GeekCodeGrading.from(string: "a")
        XCTAssert(grade == .normal)
        
        grade = GeekCodeGrading.from(string: "a--")
        XCTAssert(grade == .minusMinus)
        
    }
    
}
