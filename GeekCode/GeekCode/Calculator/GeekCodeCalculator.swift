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
            if let foundCategory = self.categoryFrom(string: nextPart) {
                result.categories.append(foundCategory)
            }
        }
        
        
        
        return nil;
        
    }
    
    func specializationsFrom(input:String) -> [GeekCodeSpecialization]? {
        var result : [GeekCodeSpecialization];
        var specStrings = Set<String>();

        var string = input;
        if string.lowercased().starts(with: "g") {
            string.removeFirst()
        }
        
        let capturePattern = #"(?:[A-Z]{1,3})"#
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
                
                if matchRange == stringRange { continue }
                
                // Extract the substring matching the capture group
                if let substringRange = Range(matchRange, in: string) {
                    let capture = String(string[substringRange])
                    specStrings.insert(capture)
                }
            }
        }
        
        result = specStrings.compactMap({ candidate in
            return GeekCodeSpecialization.init(rawValue: candidate)
        })
        
        
        return result;
    }
    
    
    func categoryFrom(string:String) -> GeekCodeCategory? {
        
        
        return nil;
    }
    
    func from(gc:GeekCode) -> String {
        
        return "";
    }
}
