//
//  generator.swift
//  GeekCode
//
//  Created by Marcin Mierzejewski on 07/08/2022.
//

import Foundation

class GeekCodeCalculator
{
    func from(string:String) throws -> GeekCode? {
        
        var result = GeekCode();
        let replaced = string.replacingOccurrences(of: "_", with: " ")
        var parts = replaced.components(separatedBy: .whitespaces)
        
        
        if let firstPart = parts.first {
            if let firstPartResult = self.specializationsFrom(input: firstPart) {
                result.specs = firstPartResult;
                parts = parts.reversed().dropLast().reversed();
            }
        }
        
        for nextPart in parts {
            if let foundCategory = self.categoryFrom(input: nextPart) {
                if let categoryItem = try self.categoryItemFrom(input: nextPart, with: foundCategory) {
                    result.categories.append(categoryItem)
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
    
    
    func categoryItemFrom(input: String, with: GeekCodeCategory) throws -> GeekCodeCategoryItem? {
        
        guard let category = self.categoryFrom(input: input) else {
            return nil
        }
        
        var result = GeekCodeCategoryItem(category: category)
        let parts = input.components(separatedBy: ":")

        for part in parts {
            let modifiers = self.categoryModifiersFrom(subitem: part, with: category)
            result.modifiers.append(modifiers)
        }
        
        return result
    }
    
    func categoryModifiersFrom(subitem: String, with: GeekCodeCategory) -> [GeekCodeModifier] {
        var result = [GeekCodeModifier]()
        for potentialCase in GeekCodeModifier.allCases {
            var caseRegexp = potentialCase.regexForCodeModifier()
            caseRegexp = String(format: caseRegexp, "[^:()!$>?]+")

            print("caseRegexp",caseRegexp)

            
            let captureRegex = try! NSRegularExpression(
                pattern: caseRegexp,
                options: []
            )
            let stringRange = NSRange(
                subitem.startIndex..<subitem.endIndex,
                in: subitem
            )
            
            let matches = captureRegex.matches(
                in: subitem,
                options: [],
                range: stringRange
            )
            
            
            for match in matches {
                for rangeIndex in 0..<match.numberOfRanges {
                    let matchRange = match.range(at: rangeIndex)
                    
                    // Extract the substring matching the capture group
                    if let substringRange = Range(matchRange, in: subitem) {
                        let capture = String(subitem[substringRange])
                        print("capture",capture)
                    }
                }
            }
            
        }
        
        result.append(GeekCodeModifier.RIGID(.Beard, .plus))
        result.append(GeekCodeModifier.RIGID(.Beard, .minus))
        result.append(GeekCodeModifier.RIGID(.Beard, .plus))
        result.append(GeekCodeModifier.RIGID(.Beard, .minus))
        result.append(GeekCodeModifier.RIGID(.Beard, .plus))
        result.append(GeekCodeModifier.RIGID(.Beard, .minus))

        
        return result

    }
    
    
    
    func from(gc:GeekCode) -> String {
        
        return "";
    }
}
