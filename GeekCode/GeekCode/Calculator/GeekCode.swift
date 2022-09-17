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
    var categories = [GeekCodeCategoryItem]();
}

struct GeekCodeCategoryItem {
    var category: GeekCodeCategory
    var modifiersByParts = [[GeekCodeModifier]]()
}

enum GeekCodeCategory : CaseIterable, Hashable
{
    
    //appearance
    case age
    case beard
    case beardMustache
    case beardSideburns
    case beardBushyEyebrows
    case clothing
    case clothingCrossdresser
    case clothingDontCare
    case dimensions
    
    
    //computers
    case computer
    
    case windows
    case windowsXp
    case windowsVista
    case windows7
    case windows8
    case windows10
    case windows11
    
    case unix
    case linux
    case rpm
    case cwntos
    case fedora
    case opensuse
    case urpmi
    case aptRpm
    case debian
    case ubuntu
    case thirdparty
    case mepis
    case knoppix
    case pacman
    case gentoo
    case slackware
    case other
    case sunosSolaris
    case aix
    case hpux
    case irix
    case scoUnix
    case unixNotListed
    
    case macApple
    
    //programing
    case java
    case cProgrammingLang
    case cplusplus
    case csharp
    case visualbasic
    case python
    case javascript
    case php
    case objectivec
    case sql
    case perl
    case ruby
    case matlab
    case assembly
    case go
    case r
    case swift//not added to standard
    case kotlin//not added to standard
    
    
    case inputOutput
    
    case pgp
    
    //git username Example : G:exarobibliologist Gbn:rutman
    case gitHub
    case bitBucket
    case bitkeeper
    case beanstalk
    case subversion
    case teamFoundationServer
    
    case electronics
    case hardware
    
    //politics
    
    case politicsGreen
    case politicsCivilLiberties
    case politicsGender
    case politicsEconomic
    
    case tv
//    TBBT        =    The Big Bang Theory
//    TB5        =    Babylon5
//    TDW        =    Doctor Who
//    TEX        =    The Expanse
//    TFF         =    Firefly
//    TGT        =    Game of Thrones
//    THRO        =    Heroes
//    TI        =    'In search of…' with Leonard Nimoy
//    TLV        =    Leverage
//        TLVr    =    Leverage: Redemption
//    Tmon        =    Monty Python (series/films)
//    TMM        =    Mad Max
//    TLOTR        =    Lord of the Rings
//    TL        =    Lost
//    TOB        =    Orphan Black
//    TRM         =    rick&MORTY
//    TSG        =    Stargate
//        TSG1    =    Stargate SG-1
//        TSGa    =    Stargate Atlantis
//        TSGu    =    Stargate Universe
//        TSGoc    =    Stargate Origins Catherine
//    TST        =    Star Trek
//        TSTanm    =    Star Trek - Animated Series
//        TSTng    =    Star Trek - The Next Generation
//        TSTds9    =    Star Trek - Deep Space Nine
//        TSTv    =    Star Trek - Voyager
//        TSTe    =    Star Trek - Enterprise
//        TSTdsc    =    Star Trek - Discovery
//        TSTpic    =    Star Trek - Picard
//        TSTld    =    Star Trek - Lower Decks
//        TSTst    =    Star Trek - Short Treks
//        TSTpro    =    Star Trek - Prodigy
//        TSTsnw    =    Star Trek - Strange New Worlds
//    TSW        =    Star Wars
//        TSWcw    =    Star Wars Clone Wars
//        TSWman    =    The Mandalorian
//        TSWand    =    Star Wars - Andor
//        TSWobi    =    Star Wars - Obi-Wan Kenobi
//        TSWbob    =    Star Wars - Book of Boba Fett
//        TSWv    =    Star Wars - Visions
//        TSWbb    =    Star Wars - The Bad Batch
//        TSWres    =    Star Wars - Resistance
//        TSWreb    =    Star Wars - Rebels
//    TW13    =    Warehouse 13
    
    
    case rpg
    
    case books
    
    case comics
    case comicsDilbert
    case comicsXKCD
    case comicsManga
    case comicsHentai
    
    case residence
    
    
    //sex
    case sheHer
    case heHim
    case theyThem
    case zeHir
    case zeZir
    case xeXem
    case verVir
    case perPer
    case eyEm
    case faeFaer
    case aeAer
    case ellesElles
    
    
    static func from(key:String) -> GeekCodeCategory?
    {
        for catcase in self.allCases {
            if key.lowercased() == catcase.key().lowercased() {
                return catcase
            }
        }
        
        return nil;
        
    }
    
    func key() -> String {
        
        switch self {
            
        case .age:
            return "a"
        case .beard:
            return "b"
        case .beardMustache:
            return "bm"
        case .beardSideburns:
            return "bs"
        case .beardBushyEyebrows:
            return "bb"
        case .clothing:
            return "c"
        case .clothingCrossdresser:
            return "cx"
        case .clothingDontCare:
            return "cpu"
        case .dimensions:
            return "d"
        case .computer:
            return "c"
        case .unix:
            return "u"
        case .linux:
            return "ul"
        case .rpm:
            return "ulr"
        case .cwntos:
            return "ulrc"
        case .fedora:
            return "ulrf"
        case .opensuse:
            return "ulro"
        case .urpmi:
            return "ulru"
        case .aptRpm:
            return "ulra"
        case .debian:
            return "uld"
        case .ubuntu:
            return "uldu"
        case .thirdparty:
            return "uldux"
        case .mepis:
            return "uldm"
        case .knoppix:
            return "uldk"
        case .pacman:
            return "ulp"
        case .gentoo:
            return "ulg"
        case .slackware:
            return "uls"
        case .other:
            return "ul*"
        case .sunosSolaris:
            return "us"
        case .aix:
            return "ua"
        case .hpux:
            return "uh"
        case .irix:
            return "ui"
        case .scoUnix:
            return "uc"
        case .unixNotListed:
            return "u*"
        case .java:
            return "lj"
        case .cProgrammingLang:
            return "lc"
        case .cplusplus:
            return "lcpp"
        case .csharp:
            return "lc#"
        case .visualbasic:
            return "lvb"
        case .python:
            return "lp"
        case .javascript:
            return "ljs"
        case .php:
            return "lphp"
        case .objectivec:
            return "loc"
        case .sql:
            return "lsql"
        case .perl:
            return "lp"
        case .ruby:
            return "lru"
        case .matlab:
            return "lm"
        case .assembly:
            return "lasm"
        case .go:
            return "lgo"
        case .r:
            return "lr"
        case .swift:
            return "lsw"
        case .kotlin:
            return "lko"
        case .windows:
            return "mw"
        case .windowsXp:
            return "mwxp"
        case .windowsVista:
            return "mwV"
        case .windows7:
            return "mw7"
        case .windows8:
            return "mw8"
        case .windows10:
            return "mw10"
        case .windows11:
            return "mw11"
        case .electronics:
            return "e"
        case .macApple:
            return "mc"
        case .inputOutput:
            return "io"
        case .pgp:
            return "pgp"
        case .gitHub:
            return "g"
        case .bitBucket:
            return "gb"
        case .bitkeeper:
            return "gbk"
        case .beanstalk:
            return "gbn"
        case .subversion:
            return "gsvn"
        case .teamFoundationServer:
            return "gtfs"
        case .hardware:
            return "h"
        case .politicsGreen:
            return "psg"
        case .politicsCivilLiberties:
            return "psl"
        case .politicsGender:
            return  "pss"
        case .politicsEconomic:
            return "pe"
        case .tv:
            return "t"
        case .rpg:
            return "rpg"
        case .books:
            return "bk"
        case .comics:
            return "k"
        case .comicsDilbert:
            return "kd"
        case .comicsXKCD:
            return "kx"
        case .comicsManga:
            return "km"
        case .comicsHentai:
            return "km!"//not sure about if it should be a separate spec
        case .residence:
            return "r"
        case .sheHer:
            return "she/her"
        case .heHim:
            return "he/him"
        case .theyThem:
            return "they/them"
        case .zeHir:
            return "ze/hir"
        case .zeZir:
            return "ze/zir"
        case .xeXem:
            return "xe/xem"
        case .verVir:
            return "ver/vir"
        case .perPer:
            return "per/per"
        case .eyEm:
            return "ey/em"
        case .faeFaer:
            return "fae/faer"
        case .aeAer:
            return "ae/aer"
        case .ellesElles:
            return "elles/elles"

        }
        
    }
    
    
}


enum GeekCodeModifier : Hashable
{
    
    case rigid(GeekCodeCategory?, GeekCodeGrading?)
    case crossOver(GeekCodeCategory?, GeekCodeGrading?)
    case wannabe(GeekCodeCategory?, GeekCodeGrading?)
    case professional(GeekCodeCategory?, GeekCodeGrading?)
    case degree(GeekCodeCategory?, GeekCodeGrading?)
    case noIdea(GeekCodeCategory?, GeekCodeGrading?)
    case refuse(GeekCodeCategory?, GeekCodeGrading?)
    
    
    func regexForCodeModifier() -> String {
        switch self {
        case .rigid:
            return "%@"
        case .crossOver:
            return "\\(%@\\)"
        case .wannabe:
            return "\\>%@"
        case .professional:
            return "%@\\$"
        case .degree:
            return "%@\\^"
        case .noIdea:
            return "%@\\?"
        case .refuse:
            return "\\!%@"
        }
    }
    
    //cases in order with they have to be searched
    static var emptyCasesInSearchOrder: [GeekCodeModifier] = {
        return [
            .professional(nil,nil),
            .degree(nil,nil),
            .noIdea(nil,nil),
            .refuse(nil,nil),
            .crossOver(nil, nil),
            .wannabe(nil, nil),
            .rigid(nil,nil)]
    }()
    
    func withAssociated(category: GeekCodeCategory?, grading: GeekCodeGrading?) -> GeekCodeModifier {
        switch self {
        case .rigid(_, _):
            return .rigid(category, grading)
        case .crossOver(_, _):
            return .crossOver(category, grading)
        case .wannabe(_, _):
            return .wannabe(category, grading)
        case .professional(_, _):
            return .professional(category, grading)
        case .degree(_, _):
            return .degree(category, grading)
        case .noIdea(_, _):
            return .noIdea(category, grading)
        case .refuse(_, _):
            return .refuse(category, grading)
            
        }
    }
    
    func hash(into hasher: inout Hasher) {
        switch self {
            
        case .rigid(let category, let grading)
            ,.crossOver(let category, let grading)
            ,.wannabe(let category, let grading)
            ,.professional(let category, let grading)
            ,.degree(let category, let grading)
            ,.noIdea(let category, let grading)
            ,.refuse(let category, let grading):
            hasher.combine(category)
            hasher.combine(grading)
            
        }
        hasher.combine(self.regexForCodeModifier())
    }
    
}

enum GeekCodeGrading : String, CaseIterable
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
    case weird
    case weirdWeird
    case weirdWeirdWeird
    case weirdWeirdWeirdWeird
    
    
    static func from(string: String) -> GeekCodeGrading?
    {
        let plusCount = string.numberOfOccurrencesOf(string: "+")
        let minusCount = string.numberOfOccurrencesOf(string: "-")
        let asteriksCount = string.numberOfOccurrencesOf(string: "*")
        
        for gradeCase in self.allCases {
            let gradePlus = gradeCase.rawValue.lowercased().numberOfOccurrencesOf(string: "plus")
            let gradeMinus = gradeCase.rawValue.lowercased().numberOfOccurrencesOf(string: "minus")
            let gradeWeird = gradeCase.rawValue.lowercased().numberOfOccurrencesOf(string: "weird")

            
            if(gradePlus == plusCount && gradeMinus == minusCount && gradeWeird == asteriksCount) {
                return gradeCase
            }
        }
        
        return nil;
        
    }
    
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
