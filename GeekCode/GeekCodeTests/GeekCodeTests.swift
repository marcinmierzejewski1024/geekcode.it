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
        XCTAssert(item?.part1Modifiers.first == .RIGID(.Age, .plusPlus))
        
        item = try calculator.categoryItemFrom(input: "d:", with: .Dimensions)
        XCTAssert(item?.part1Modifiers.first == .RIGID(.Dimensions, .normal))
        XCTAssert(item?.part2Modifiers?.first == .RIGID(.Dimensions, .normal))
        
        item = try calculator.categoryItemFrom(input: "d+:++", with: .Dimensions)
        XCTAssert(item?.part1Modifiers.first == .RIGID(.Dimensions, .plus))
        XCTAssert(item?.part2Modifiers?.first == .RIGID(.Dimensions, .plusPlus))

        item = try calculator.categoryItemFrom(input: "d:---", with: .Dimensions)
        XCTAssert(item?.part1Modifiers.first == .RIGID(.Dimensions, .normal))
        XCTAssert(item?.part2Modifiers?.first == .RIGID(.Dimensions, .minusMinusMinus))
        
        
        item = try calculator.categoryItemFrom(input: "C++(C-)", with: .Clothing)
        XCTAssert(item?.part1Modifiers.first == .RIGID(.Clothing, .plusPlus))
        XCTAssert(item?.part1Modifiers[1] == .CROSS_OVER(.Clothing, .minus))
        
        
//        (Head : Beard : Brows : Mustache : Sideburns
        item = try calculator.categoryItemFrom(input: "B++:-:+:--(+):+>++", with: .Beard)
        XCTAssert(item?.part1Modifiers.first == .RIGID(.Beard, .plusPlus))
        XCTAssert(item?.part2Modifiers?.first == .RIGID(.Beard, .minus))
        XCTAssert(item?.part3Modifiers?.first == .RIGID(.Beard, .plus))
        XCTAssert(item?.part4Modifiers?.first == .RIGID(.Beard, .minusMinus))
        XCTAssert(item?.part4Modifiers![1] == .CROSS_OVER(.Beard, .plus))
        XCTAssert(item?.part5Modifiers?.first == .RIGID(.Beard, .plus))
        XCTAssert(item?.part5Modifiers![1] == .WANNABE(.Beard, .plusPlus))


    }
    
}
