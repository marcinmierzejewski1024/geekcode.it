//
//  generator.swift
//  GeekCode
//
//  Created by Marcin Mierzejewski on 07/08/2022.
//

import Foundation

class GeekCodeCalculator
{
    func from(string:String) -> GeekCode? {
        
        
        
        var result = GeekCode();
        var parts = string.components(separatedBy: .whitespaces)
        
        
        if let firstPart = parts.first {
            if let firstPartResult = self.specializationsFrom(input: firstPart) {
                result.specs = firstPartResult;
                parts = parts.reversed().dropLast().reversed();
            }
        }
        
        for nextPart in parts {
            if let foundCategory = self.categoryFrom(input: nextPart) {
                result.categories.append(foundCategory)
                
                let modifiers = self.categoryModifiersFrom(input: nextPart, with: foundCategory)

                result.categoriesModifiers[foundCategory] = modifiers

                for modifier in modifiers {
                    result.categoriesModifiersGrades[modifier] = self.gradeFrom(input: nextPart, with: modifier)
                }
                
            }
        }
        
        
        
        return nil;
        
    }
    
    func specializationsFrom(input:String) -> [GeekCodeSpecialization]? {
        var result : [GeekCodeSpecialization];
        var specStrings = Set<String>();
        
        var string = input.uppercased();
        if string.starts(with: "G") {
            string.removeFirst()
        }
        
        let capturePattern = #"(?:[A-Z!]{1,3})"#
        let captureRegex = try! NSRegularExpression(
            pattern: capturePattern,
            options: []
        )
        let stringRange = NSRange(
            string.startIndex..<string.endIndex,
            in: string
        )
        
        let matches = captureRegex.matches(
            in: string,
            options: [],
            range: stringRange
        )
        
        
        
        for match in matches {
            for rangeIndex in 0..<match.numberOfRanges {
                let matchRange = match.range(at: rangeIndex)
                
                // Extract the substring matching the capture group
                if let substringRange = Range(matchRange, in: string) {
                    let capture = String(string[substringRange])
                    specStrings.insert(capture)
                }
            }
        }
        
        result = specStrings.compactMap({ candidate in
            return GeekCodeSpecialization.from(key: candidate)
        })
        
        
        return result;
    }
    
    
    func categoryFrom(input:String) -> GeekCodeCategory? {
        
        let string = input.uppercased();
        
        let capturePattern = #"(?:[A-Z]+)"#
        let captureRegex = try! NSRegularExpression(
            pattern: capturePattern,
            options: []
        )
        let stringRange = NSRange(
            string.startIndex..<string.endIndex,
            in: string
        )
        
        let matches = captureRegex.matches(
            in: string,
            options: [],
            range: stringRange
        )
        
        
        
        
        
        for match in matches {
            for rangeIndex in 0..<match.numberOfRanges {
                let matchRange = match.range(at: rangeIndex)
                
                // Extract the substring matching the capture group
                if let substringRange = Range(matchRange, in: string) {
                    let capture = String(string[substringRange])
                    let category = GeekCodeCategory.from(key: capture)
                    return category
                }
            }
        }
        
        
        
        return nil
    }
    
    
    func categoryModifiersFrom(input: String, with: GeekCodeCategory) -> [GeekCodeModifier] {
        var result = [GeekCodeModifier]()
        
        for potentialCase in GeekCodeModifier.allCases {
            let caseRegexp = potentialCase.regexForCodeModifier()
            
        }
        
        return result
    }
    
    func gradeFrom(input:String, with: GeekCodeModifier) -> GeekCodeGrading {
        
        return .normal
    }
    
    
    func from(gc:GeekCode) -> String {
        
        return "";
    }
}
