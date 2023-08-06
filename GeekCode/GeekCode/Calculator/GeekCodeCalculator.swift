//
//  generator.swift
//  GeekCode
//
//  Created by Marcin Mierzejewski on 07/08/2022.
//

import Foundation

enum GeekcodingException: Error {
    case unrecognizedToken(String)
    case otherError(Error)
}


class GeekCodeCalculator {
    private func cleanedString(_ string: String) -> String {
        let introRegex = "(-){5}(BEGIN|END)+(.*)(-){5}"
        let regex = try! NSRegularExpression(pattern: introRegex, options: NSRegularExpression.Options.caseInsensitive)
        let range = NSMakeRange(0, string.count)
        let withoutIntro = regex.stringByReplacingMatches(in: string, options: [], range: range, withTemplate: "")
        
        let replaced = withoutIntro.replacingOccurrences(of: "_", with: "")
        let condensed = replaced.condensed.trimmingCharacters(in: .whitespacesAndNewlines)
        
        return condensed
    }
    
    func from(string: String) throws -> GeekCode? {
        var result = GeekCode();
        let cleaned = self.cleanedString(string)
        
        var parts = cleaned.components(separatedBy: .whitespaces)
        
        if let firstPart = parts.first {
            if let firstPartResult = self.specializationsFrom(input: firstPart) {
                result.specs = firstPartResult;
                parts = parts.reversed().dropLast().reversed();
            }
        }
        
        for nextPart in parts {
            do {
                if let categoryItem = try self.categoryItemFrom(input: nextPart) {
                    result.categories.append(categoryItem)
                }
            } catch GeekcodingException.unrecognizedToken(let token) {
                result.notRecognizedTokens.append(token)
            }
            
        }
        
        return result;
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
            if let result = GeekCodeSpecialization.from(key: candidate) {
                return result
            } else {
                if candidate.starts(with: "G") {
                    var notFoundCandidate = candidate
                    notFoundCandidate.removeFirst()
                    return GeekCodeSpecialization.from(key: notFoundCandidate)
                    
                }
                return nil
            }
        })
        
        return result;
    }
    
    
    func categoryFrom(input:String) -> GeekCodeCategory? {
        let string = input.uppercased();
        
        let capturePattern = #"(?:[A-Z#//]+)"#
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
    
    
    func categoryItemFrom(input: String) throws -> GeekCodeCategoryItem? {
        guard let category = self.categoryFrom(input: input) else {
            if(!input.isEmpty) {
                throw GeekcodingException.unrecognizedToken(input)
            }
            return nil
        }
        
        var result = GeekCodeCategoryItem(category: category)
        let parts = input.components(separatedBy: ":")
        
        for part in parts {
            let modifiers = try self.categoryModifiersFrom(subitem: part, with: category)
            result.modifiersByParts.append(modifiers)
        }
        
        return result
    }
    
    func categoryModifiersFrom(subitem: String, with: GeekCodeCategory) throws -> [GeekCodeModifier] {
        var result = [GeekCodeModifier]()
        
        var foundCases = [(GeekCodeModifier, String)]()
        for potentialCase in GeekCodeModifier.emptyCasesInSearchOrder {
            var caseRegexp = potentialCase.regexForCodeModifier()
            caseRegexp = String(format: caseRegexp, "[^:()!$>?]+")
            
            do {
                if (potentialCase == .rigid(nil, nil)) {
                    
                    //exception to ignore ridgid match if there is already refuse,degree,no idea or professional
                    let alreadyHandled = foundCases.contains { (modifier, _) in
                        switch modifier {
                        case .professional(_, _),
                                .degree(_, _),
                                .noIdea(_, _),
                                .refuse(_, _):
                            return true
                        default:
                            return false
                        }
                    }
                    if alreadyHandled {
                        continue
                    }
                    
                    //exception to handle empty subitem as rigid with no grading
                    if (subitem == "") {
                        foundCases.append((potentialCase, ""))
                    }
                }
                
                if let occurence = try self.findOccurences(haystack: subitem, regex: caseRegexp).first {
                    print("found potential \(potentialCase)")
                    foundCases.append((potentialCase, occurence))
                }
            } catch {
                throw GeekcodingException.otherError(error)
            }
        }
        
        for foundCase in foundCases {
            let grade = GeekCodeGrading.from(string: foundCase.1)
            var modifier = foundCase.0
            modifier = modifier.withAssociated(category: with, grading: grade)
            result.append(modifier)
        }
        
        if result.isEmpty && !subitem.isEmpty {
            throw GeekcodingException.unrecognizedToken(subitem)
        }
        return result
    }
    
    func from(gc: GeekCode) -> String {
        return "";
    }
    
    
    private func findOccurences(haystack: String, regex: String) throws -> [String] {
        var result = [String]()
        
        let captureRegex = try NSRegularExpression(
            pattern: regex,
            options: []
        )
        let stringRange = NSRange(
            haystack.startIndex..<haystack.endIndex,
            in: haystack
        )
        
        let matches = captureRegex.matches(
            in: haystack,
            options: [],
            range: stringRange
        )
        
        
        for match in matches {
            for rangeIndex in 0..<match.numberOfRanges {
                let matchRange = match.range(at: rangeIndex)
                // Extract the substring matching the capture group
                if let substringRange = Range(matchRange, in: haystack) {
                    let capture = String(haystack[substringRange])
                    result.append(capture)
                }
            }
        }
        return result
    }
}
