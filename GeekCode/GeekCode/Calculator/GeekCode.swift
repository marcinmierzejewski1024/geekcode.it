//
//  GeekCode.swift
//  GeekCode
//
//  Created by Marcin Mierzejewski on 07/08/2022.
//

import Foundation

//basedOn https://github.com/telavivmakers/geek_code

struct GeekCode
{
    var specs:[GeekCodeSpecialization]?;
    var categories = [GeekCodeCategory]();
    var categoriesModifiers = [GeekCodeCategory:[GeekCodeModifier]]();
    var categoriesModifiersGrades = [GeekCodeModifier:GeekCodeGrading]();


    
}

enum GeekCodeCategory : CaseIterable, Hashable
{
    
    //Appearance
    case Age
    case Beard
    case BeardMustache
    case BeardSideburns
    case BeardBushyEyebrows
    case Clothing
    case ClothingCrossDresser
    case ClothingDontCare
    case Dimensions
    
    
    //Computers
    case Computer
    
    case Unix
    case Linux
    case RPM
    case Cwntos
    case Fedora
    case Opensuse
    case Urpmi
    case Apt_rpm
    case Debian
    case Ubuntu
    case Thirdparty
    case Mepis
    case Knoppix
    case Pacman
    case Gentoo
    case Slackware
    case Other
    case SunOS_Solaris
    case AIX
    case HPUX
    case IRIX
    case SCO_Unix
    case UnixNot_listed
    
    //programing
    case Java
    case Cprogramminglang
    case Cplusplus
    case Csharp
    case Visualbasic
    case Python
    case Javascript
    case Php
    case Objectivec
    case Sql
    case Perl
    case Ruby
    case Matlab
    case Assembly
    case Go
    case R
    case Swift//not added to standard
    case Kotlin//not added to standard
    
    
    static func from(key:String) -> GeekCodeCategory?
    {
        for catCase in self.allCases {
            if key.lowercased() == catCase.key().lowercased() {
                return catCase
            }
        }
        
        return nil;

    }
    
    func key() -> String {
            
        switch self {

        case .Age:
            return "a"
        case .Beard:
            return "b"
        case .BeardMustache:
            return "bm"
        case .BeardSideburns:
            return "bs"
        case .BeardBushyEyebrows:
            return "bb"
        case .Clothing:
            return "c"
        case .ClothingCrossDresser:
            return "cx"
        case .ClothingDontCare:
            return "cpu"
        case .Dimensions:
            return "d"
        case .Computer:
            return "c"
        case .Unix:
            return "u"
        case .Linux:
            return "ul"
        case .RPM:
            return "ulr"
        case .Cwntos:
            return "ulrc"
        case .Fedora:
            return "ulrf"
        case .Opensuse:
            return "ulro"
        case .Urpmi:
            return "ulru"
        case .Apt_rpm:
            return "ulra"
        case .Debian:
            return "uld"
        case .Ubuntu:
            return "uldu"
        case .Thirdparty:
            return "uldux"
        case .Mepis:
            return "uldm"
        case .Knoppix:
            return "uldk"
        case .Pacman:
            return "ulp"
        case .Gentoo:
            return "ulg"
        case .Slackware:
            return "uls"
        case .Other:
            return "ul*"
        case .SunOS_Solaris:
            return "us"
        case .AIX:
            return "ua"
        case .HPUX:
            return "uh"
        case .IRIX:
            return "ui"
        case .SCO_Unix:
            return "uc"
        case .UnixNot_listed:
            return "u*"
        case .Java:
            return "lj"
        case .Cprogramminglang:
            return "lc"
        case .Cplusplus:
            return "lcpp"
        case .Csharp:
            return "lc#"
        case .Visualbasic:
            return "lvb"
        case .Python:
            return "lp"
        case .Javascript:
            return "ljs"
        case .Php:
            return "lphp"
        case .Objectivec:
            return "loc"
        case .Sql:
            return "lsql"
        case .Perl:
            return "lp"
        case .Ruby:
            return "lru"
        case .Matlab:
            return "lm"
        case .Assembly:
            return "lasm"
        case .Go:
            return "lgo"
        case .R:
            return "lr"
        case .Swift:
            return "lsw"
        case .Kotlin:
            return "lko"
        }
        
    }
    
    
}


enum GeekCodeModifier : Hashable, CaseIterable
{
    static var allCases: [GeekCodeModifier] = {
        return [.RIGID(nil),CROSS_OVER(nil, nil),.WANNABE(nil, nil),.PROFESSIONAL(nil),.NO_IDEA(nil),.REFUSE(nil)]
    }()
    
    case RIGID(GeekCodeCategory?)
    case CROSS_OVER(GeekCodeCategory?, GeekCodeGrading?)
    case WANNABE(GeekCodeCategory?, GeekCodeGrading?)
    case PROFESSIONAL(GeekCodeCategory?)
    case NO_IDEA(GeekCodeCategory?)
    case REFUSE(GeekCodeCategory?)
    
    
    func regexForCodeModifier() -> String {
        switch self {
        case .RIGID:
            return "@%@"
        case .CROSS_OVER:
            return "(%@)"
        case .WANNABE:
            return ">%@"
        case .PROFESSIONAL:
            return "%@$"
        case .NO_IDEA:
            return "%@?"
        case .REFUSE:
            return "%@!"
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
            
        case .RIGID(let category):
            hasher.combine(category)
        case .CROSS_OVER(let category, let grading):
            hasher.combine(category)
            hasher.combine(grading)
        case .WANNABE(let category, let grading):
            hasher.combine(category)
            hasher.combine(grading)
        case .PROFESSIONAL(let category):
            hasher.combine(category)
        case .NO_IDEA(let category):
            hasher.combine(category)
        case .REFUSE(let category):
            hasher.combine(category)
        }
        hasher.combine(self.regexForCodeModifier())
    }
    
}

enum GeekCodeGrading
{
    case normal
    case plus
    case plusPlus
    case plusPlusPlus
    case plusPlusPlusPlus
    case plusPlusPlusPlusPlus
    case minus
    case minusMinus
    case minusMinusMinus
    case minusMinusMinusMinus
    case minusMinusMinusMinusMinus
    
}




enum GeekCodeSpecialization : String, CaseIterable {
   
    case BUSINESS_GEEK
    case GEEK_OF_THE_CLASSICS
    case GEEK_OF_COMMERCIAL_ART
    case GEEK_OF_COMPUTER_SCIENCE
    case COMMUNICATIONS_GEEK
    case GEEK_OF_ENGINEERING
    case EDUCATION_GEEK
    case GEEK_OF_FINE_ARTS
    case GEEK_OF_GOVERNMENT
    case GEEK_OF_HUMANITIES
    case GEEK_INFORMATION_TECHNOLOGY
    case GEEK_OF_JURISPRUDENCE
    case GEEK_OF_LIBRARY_SCIENCE
    case MASS_COMMUNICATION_GEEK
    case GEEK_OF_MATHEMATICS
    case MEDICINE_GEEK
    case MUSIC_GEEK
    case GEEK_OF_THE_PERFORMING_ARTS
    case GEEK_OF_PHILOSOPHY
    case GEEK_OF_THE_EXACT_SCIENCES
    case GEEK_OF_SOCIAL_SCIENCES
    case GEEK_OF_TECHNICAL_MAGAZINE
    case OTHER_GEEK
    case UNDECIDED_GEEK
    case THE_GEEK_OF_EVERYTHING
    case WITHOUT
    
    
    
    func name() -> String {
        
        return NSLocalizedString(self.rawValue, comment: "");
    }
    
    static func from(key:String) -> GeekCodeSpecialization? {
        for specCase in self.allCases {
            if key == specCase.key() {
                return specCase
            }
        }
        
        return nil;
    }
    
    func key() -> String{
        switch self {
        case .BUSINESS_GEEK:
            return "B"
        case .GEEK_OF_THE_CLASSICS:
            return "C"
        case .GEEK_OF_COMMERCIAL_ART:
            return "CA"
        case .GEEK_OF_COMPUTER_SCIENCE:
            return "CS"
        case .COMMUNICATIONS_GEEK:
            return "CC"
        case .GEEK_OF_ENGINEERING:
            return "E"
        case .EDUCATION_GEEK:
            return "ED"
        case .GEEK_OF_FINE_ARTS:
            return "FA"
        case .GEEK_OF_GOVERNMENT:
            return "G"
        case .GEEK_OF_HUMANITIES:
            return "H"
        case .GEEK_INFORMATION_TECHNOLOGY:
            return "IT"
        case .GEEK_OF_JURISPRUDENCE:
            return "J"
        case .GEEK_OF_LIBRARY_SCIENCE:
            return "LS"
        case .MASS_COMMUNICATION_GEEK:
            return "MC"
        case .GEEK_OF_MATHEMATICS:
            return "M"
        case .MEDICINE_GEEK:
            return "MD"
        case .MUSIC_GEEK:
            return "MU"
        case .GEEK_OF_THE_PERFORMING_ARTS:
            return "PA"
        case .GEEK_OF_PHILOSOPHY:
            return "P"
        case .GEEK_OF_THE_EXACT_SCIENCES:
            return "S"
        case .GEEK_OF_SOCIAL_SCIENCES:
            return "SS"
        case .GEEK_OF_TECHNICAL_MAGAZINE:
            return "TW"
        case .OTHER_GEEK:
            return "O"
        case .UNDECIDED_GEEK:
            return "U"
        case .THE_GEEK_OF_EVERYTHING:
            return "AT"
        case .WITHOUT:
            return "!"


  
        }
    }
}
