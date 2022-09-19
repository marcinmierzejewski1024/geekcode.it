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
    
    
    func testGeekcodeFromRealWordExample() throws {
        let example = """
        -----BEGIN GEEK CODE BLOCK VERSION 5.1-----
        GCS^/GM^ A++(a?) B_:--:+:-:+ C++(C-) D+:+ CM++(++++)
        MW11_(++) ULD++++$ MC-- Lbash+++/LC#+/Lj+/Lpy++/Lvb
        IO+++:---(+) PGP G:exarobibliologist E++ H+ PSG PE
        TDW+/TEX+++/THRO++++/TMON+++/TOB+++/TSTsnw+++/TSTld+++/
        TSTdsc-- RPG+++(*)>$ BK+++ KX+++ INTJ-A R-- he/him+++
        -----END GEEK CODE BLOCK VERSION 5.1-----
"""
        let geekcode = try calculator.from(string: example)
        XCTAssert(geekcode!.specs!.contains(.GEEK_OF_COMPUTER_SCIENCE))
        XCTAssert(geekcode!.specs!.contains(.GEEK_OF_MATHEMATICS))
        XCTAssert(geekcode?.notRecognizedTokens.count == 0)
    }
    
    
    func testGeekcodeEasy() throws {
        let example = """
        GCS/GM A++(a?) B_:--:+:-:+ C++(C-) D+:+ CM++(++++)
        MW11_(++) ULD++++$ MC-- Lbash+++/LC#+/Lj+/Lpy++/Lvb
        IO+++:---(+) PGP G:exarobibliologist E++ H+ PSG PE
        RPG+++(*)>$ BK+++ KX+++ R-- he/him+++
"""
        let geekcode = try calculator.from(string: example)
        XCTAssert(geekcode!.specs!.contains(.GEEK_OF_COMPUTER_SCIENCE))
        XCTAssert(geekcode!.specs!.contains(.GEEK_OF_MATHEMATICS))
        XCTAssert(geekcode?.notRecognizedTokens.count == 0)
    }
    
    
    func testSpecializationsFrom() throws {
        
        var specs = calculator.specializationsFrom(input: "GCS/GM")
        XCTAssert(specs?.count == 2)
        XCTAssert(specs!.contains(GeekCodeSpecialization.GEEK_OF_COMPUTER_SCIENCE))
        XCTAssert(specs!.contains(GeekCodeSpecialization.GEEK_OF_MATHEMATICS))


        specs = calculator.specializationsFrom(input: "GB/CS/TW")
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
        XCTAssert(category == .age)
        
        category = calculator.categoryFrom(input: "d:")!
        XCTAssert(category == .dimensions);
        
        category = calculator.categoryFrom(input: "d+:+")!
        XCTAssert(category == .dimensions);
        
        category = calculator.categoryFrom(input: "d+:")!
        XCTAssert(category == .dimensions);
        
        category = calculator.categoryFrom(input: "d:---")!
        XCTAssert(category == .dimensions);
    }
    
    func testCategoryItemFrom() throws {

        var item = try calculator.categoryItemFrom(input: "a++")
        XCTAssert(item!.modifiersByParts[0].contains(.rigid(.age, .plusPlus)))
        XCTAssert(item!.modifiersByParts.count == 1)
        XCTAssert(item!.modifiersByParts[0].count == 1)


        item = try calculator.categoryItemFrom(input: "d:")
        XCTAssert(item!.modifiersByParts[0].contains(.rigid(.dimensions, .normal)))
        XCTAssert(item!.modifiersByParts[1].contains(.rigid(.dimensions, .normal)))
        XCTAssert(item!.modifiersByParts.count == 2)


        item = try calculator.categoryItemFrom(input: "d+:++")
        XCTAssert(item!.modifiersByParts[0].contains(.rigid(.dimensions, .plus)))
        XCTAssert(item!.modifiersByParts[1].contains(.rigid(.dimensions, .plusPlus)))
        XCTAssert(item!.modifiersByParts.count == 2)


        item = try calculator.categoryItemFrom(input: "d:---")
        XCTAssert(item!.modifiersByParts[0].contains(.rigid(.dimensions, .normal)))
        XCTAssert(item!.modifiersByParts[1].contains(.rigid(.dimensions, .minusMinusMinus)))
        XCTAssert(item!.modifiersByParts.count == 2)


        item = try calculator.categoryItemFrom(input: "C++(C-)")
        XCTAssert(item!.modifiersByParts[0].contains(.rigid(.clothing, .plusPlus)))
        XCTAssert(item!.modifiersByParts[0].contains(.crossOver(.clothing, .minus)))
        XCTAssert(item!.modifiersByParts.count == 1)


//        (Head : Beard : Brows : Mustache : Sideburns
        item = try calculator.categoryItemFrom(input: "B++:-:+:--(+):+>++")
        XCTAssert(item!.modifiersByParts[0].contains(.rigid(.beard, .plusPlus)))
        XCTAssert(item!.modifiersByParts[1].contains(.rigid(.beard, .minus)))
        XCTAssert(item!.modifiersByParts[2].contains(.rigid(.beard, .plus)))
        XCTAssert(item!.modifiersByParts[3].contains(.rigid(.beard, .minusMinus)))
        XCTAssert(item!.modifiersByParts[3].contains(.crossOver(.beard, .plus)))
        XCTAssert(item!.modifiersByParts[4].contains(.rigid(.beard, .plus)))
        XCTAssert(item!.modifiersByParts[4].contains(.wannabe(.beard, .plusPlus)))
        XCTAssert(item!.modifiersByParts.count == 5)

        item = try calculator.categoryItemFrom(input: "ul++$")
        XCTAssert(item!.modifiersByParts[0].contains(.professional(.linux, .plusPlus)))
        XCTAssert(item!.modifiersByParts.count == 1)
        XCTAssert(item!.modifiersByParts[0].count == 1)


        item = try calculator.categoryItemFrom(input: "!lj")
        XCTAssert(item!.modifiersByParts[0].contains(.refuse(.java, .normal)))
        XCTAssert(item!.modifiersByParts.count == 1)
        XCTAssert(item!.modifiersByParts[0].count == 1)


        item = try calculator.categoryItemFrom(input: "lm?")
        XCTAssert(item!.modifiersByParts[0].contains(.noIdea(.matlab, .normal)))
        XCTAssert(item!.modifiersByParts.count == 1)
        XCTAssert(item!.modifiersByParts[0].count == 1)


        item = try calculator.categoryItemFrom(input: "lm--^")
        XCTAssert(item!.modifiersByParts[0].contains(.degree(.matlab, .minusMinus)))
        XCTAssert(item!.modifiersByParts.count == 1)
        XCTAssert(item!.modifiersByParts[0].count == 1)

        
        
        item = try calculator.categoryItemFrom(input: "they/them+++")
        XCTAssert(item!.modifiersByParts[0].contains(.rigid(.theyThem, .plusPlusPlus)))
        XCTAssert(item!.modifiersByParts.count == 1)
        XCTAssert(item!.modifiersByParts[0].count == 1)

        item = try calculator.categoryItemFrom(input: "lc#*(++)")
        XCTAssert(item!.modifiersByParts[0].contains(.rigid(.csharp, .weird)))
        XCTAssert(item!.modifiersByParts[0].contains(.crossOver(.csharp, .plusPlus)))

        XCTAssert(item!.modifiersByParts.count == 1)
        XCTAssert(item!.modifiersByParts[0].count == 2)




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
        
        grade = GeekCodeGrading.from(string: "he/they++")
        XCTAssert(grade == .plusPlus)
        
        grade = GeekCodeGrading.from(string: "she/her**")
        XCTAssert(grade == .weirdWeird)
        
    }
    
}
