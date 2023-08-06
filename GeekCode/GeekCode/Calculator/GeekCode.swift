//
//  GeekCode.swift
//  GeekCode
//
//  Created by Marcin Mierzejewski on 07/08/2022.
//

import Foundation

//basedOn https://github.com/telavivmakers/geek_code

struct GeekCode {
    var specs:[GeekCodeSpecialization]?;
    var categories = [GeekCodeCategoryItem]();
    var notRecognizedTokens = [String]()
}

struct GeekCodeCategoryItem {
    var category: GeekCodeCategory
    var modifiersByParts = [[GeekCodeModifier]]()
}

enum GeekCodeCategory : CaseIterable, Hashable {
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
    case bash
    
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
    case tvBigBangTheory
    case tvBabylon5
    case tvDoctorWho
    case tvTheExpanse
    case tvFirefly
    case tvGameOfThrones
    case tvHeroes
    case tvInSearchOf
    case tvLeverage
    case tvLeverageRedemption
    case tvMontyPython
    case tvMadMax
    case tvLordOfTheRings
    case tvLost
    case tvOrphanBlack
    case tvRickAndMorty
    case tvStargate
    case tvStargateSG1
    case tvStargateAtlantis
    case tvStargateUniverse
    case tvStargateOriginsCatherine
    case tvStarTrek
    case tvStarTrekAnimatedSeries
    case tvStarTrekTNG
    case tvStarTrekDS9
    case tvStarTrekVoyager
    case tvStarTrekEnterprise
    case tvStarTrekDiscovery
    case tvStarTrekPicard
    case tvStarTrekLowerDecks
    case tvStarTrekShortTreks
    case tvStarTrekProdigy
    case tvStarTrekStrangeNewWorlds
    case tvStarWars
    case tvStarWarsCloneWars
    case tvTheMandalorian
    case tvStarWarsAndor
    case tvStarWarsObiWanKenobi
    case tvStarWarsBookOfBobaFett
    case tvStarWarsVisions
    case tvStarWarsBadBatch
    case tvStarWarsResistance
    case tvStarWarsRebels
    case tvWarehouse13
    
    case rpg
    case books
    case comics
    case comicsDilbert
    case comicsXKCD
    case comicsManga
    
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
    
    static func from(key:String) -> GeekCodeCategory? {
        for catcase in self.allCases {
            if key.lowercased() == catcase.key().lowercased() {
                return catcase
            }
        }
        
        return nil;
    }
    
    func key() -> String {
        switch self {
        case .age: return "a"
        case .beard: return "b"
        case .beardMustache: return "bm"
        case .beardSideburns: return "bs"
        case .beardBushyEyebrows: return "bb"
        case .clothing: return "c"
        case .clothingCrossdresser: return "cx"
        case .clothingDontCare: return "cpu"
        case .dimensions: return "d"
        case .computer: return "cm"
        case .unix: return "u"
        case .linux: return "ul"
        case .rpm: return "ulr"
        case .cwntos: return "ulrc"
        case .fedora: return "ulrf"
        case .opensuse: return "ulro"
        case .urpmi: return "ulru"
        case .aptRpm: return "ulra"
        case .debian: return "uld"
        case .ubuntu: return "uldu"
        case .thirdparty: return "uldux"
        case .mepis: return "uldm"
        case .knoppix: return "uldk"
        case .pacman: return "ulp"
        case .gentoo: return "ulg"
        case .slackware: return "uls"
        case .sunosSolaris: return "us"
        case .aix: return "ua"
        case .hpux: return "uh"
        case .irix: return "ui"
        case .scoUnix: return "uc"
        case .unixNotListed: return "u*"
        case .java: return "lj"
        case .cProgrammingLang: return "lc"
        case .cplusplus: return "lcpp"
        case .csharp: return "lc#"
        case .visualbasic: return "lvb"
        case .python: return "lp"
        case .javascript: return "ljs"
        case .php: return "lphp"
        case .objectivec: return "loc"
        case .sql: return "lsql"
        case .perl: return "lp"
        case .ruby: return "lru"
        case .matlab: return "lm"
        case .assembly: return "lasm"
        case .go: return "lgo"
        case .r: return "lr"
        case .swift: return "lsw"
        case .kotlin: return "lko"
        case .bash: return "lbash"
        case .windows: return "mw"
        case .windowsXp: return "mwxp"
        case .windowsVista: return "mwV"
        case .windows7: return "mw7"
        case .windows8: return "mw8"
        case .windows10: return "mw10"
        case .windows11: return "mw11"
        case .electronics: return "e"
        case .macApple: return "mc"
        case .inputOutput: return "io"
        case .pgp: return "pgp"
        case .gitHub: return "g"
        case .bitBucket: return "gb"
        case .bitkeeper: return "gbk"
        case .beanstalk: return "gbn"
        case .subversion: return "gsvn"
        case .teamFoundationServer: return "gtfs"
        case .hardware: return "h"
        case .politicsGreen: return "psg"
        case .politicsCivilLiberties: return "psl"
        case .politicsGender: return  "pss"
        case .politicsEconomic: return "pe"
        case .tv: return "t"
        case .tvBigBangTheory: return "The Big Bang Theory"
        case .tvBabylon5: return "Babylon5"
        case .tvDoctorWho: return "Doctor Who"
        case .tvTheExpanse: return "The Expanse"
        case .tvFirefly: return "Firefly"
        case .tvGameOfThrones: return "Game of Thrones"
        case .tvHeroes: return "Heroes"
        case .tvInSearchOf: return "'In search of…' with Leonard Nimoy"
        case .tvLeverage: return "Leverage"
        case .tvLeverageRedemption: return "Leverage: Redemption"
        case .tvMontyPython: return "Monty Python (series/films)"
        case .tvMadMax: return "Mad Max"
        case .tvLordOfTheRings: return "Lord of the Rings"
        case .tvLost: return "Lost"
        case .tvOrphanBlack: return "Orphan Black"
        case .tvRickAndMorty: return "rick&MORTY"
        case .tvStargate: return "Stargate"
        case .tvStargateSG1: return "Stargate SG-1"
        case .tvStargateAtlantis: return "Stargate Atlantis"
        case .tvStargateUniverse: return "Stargate Universe"
        case .tvStargateOriginsCatherine: return "Stargate Origins Catherine"
        case .tvStarTrek: return "Star Trek"
        case .tvStarTrekAnimatedSeries: return "Star Trek - Animated Series"
        case .tvStarTrekTNG: return "Star Trek - The Next Generation"
        case .tvStarTrekDS9: return "Star Trek - Deep Space Nine"
        case .tvStarTrekVoyager: return "Star Trek - Voyager"
        case .tvStarTrekEnterprise: return "Star Trek - Enterprise"
        case .tvStarTrekDiscovery: return "Star Trek - Discovery"
        case .tvStarTrekPicard: return "Star Trek - Picard"
        case .tvStarTrekLowerDecks: return "Star Trek - Lower Decks"
        case .tvStarTrekShortTreks: return "Star Trek - Short Treks"
        case .tvStarTrekProdigy: return "Star Trek - Prodigy"
        case .tvStarTrekStrangeNewWorlds: return "Star Trek - Strange New Worlds"
        case .tvStarWars: return "Star Wars"
        case .tvStarWarsCloneWars: return "Star Wars Clone Wars"
        case .tvTheMandalorian: return "The Mandalorian"
        case .tvStarWarsAndor: return "Star Wars - Andor"
        case .tvStarWarsObiWanKenobi: return "Star Wars - Obi-Wan Kenobi"
        case .tvStarWarsBookOfBobaFett: return "Star Wars - Book of Boba Fett"
        case .tvStarWarsVisions: return "Star Wars - Visions"
        case .tvStarWarsBadBatch: return "Star Wars - The Bad Batch"
        case .tvStarWarsResistance: return "Star Wars - Resistance"
        case .tvStarWarsRebels: return "Star Wars - Rebels"
        case .tvWarehouse13: return "Warehouse 13"
        case .rpg: return "rpg"
        case .books: return "bk"
        case .comics: return "k"
        case .comicsDilbert: return "kd"
        case .comicsXKCD: return "kx"
        case .comicsManga: return "km"
        case .residence: return "r"
        case .sheHer: return "she/her"
        case .heHim: return "he/him"
        case .theyThem: return "they/them"
        case .zeHir: return "ze/hir"
        case .zeZir: return "ze/zir"
        case .xeXem: return "xe/xem"
        case .verVir: return "ver/vir"
        case .perPer: return "per/per"
        case .eyEm: return "ey/em"
        case .faeFaer: return "fae/faer"
        case .aeAer: return "ae/aer"
        case .ellesElles: return "elles/elles"
        }
    }
    
    func partsNames() -> [String]? {
        switch self {
        case .gitHub
            ,.bitBucket
            ,.bitkeeper
            ,.beanstalk
            ,.subversion
            ,.teamFoundationServer: return ["","username"]
        case .dimensions: return ["height","weight"]
        case .beard: return ["head","beard","brows","mustache","sideburns"]
        case .inputOutput: return ["input","output"]
            
        default: return nil
        }
    }
}

enum GeekCodeModifier : Hashable {
    case rigid(GeekCodeCategory?, GeekCodeGrading?)
    case notVeryRigid(GeekCodeCategory?, GeekCodeGrading?)
    case crossOver(GeekCodeCategory?, GeekCodeGrading?)
    case wannabe(GeekCodeCategory?, GeekCodeGrading?)
    case professional(GeekCodeCategory?, GeekCodeGrading?)
    case degree(GeekCodeCategory?, GeekCodeGrading?)
    case noIdea(GeekCodeCategory?, GeekCodeGrading?)
    case refuse(GeekCodeCategory?, GeekCodeGrading?)
    
    func regexForCodeModifier() -> String {
        switch self {
        case .rigid: return "%@"
        case .notVeryRigid: return "%@@"
        case .crossOver: return "\\(%@\\)"
        case .wannabe: return "\\>%@"
        case .professional: return "%@\\$"
        case .degree: return "%@\\^"
        case .noIdea: return "%@\\?"
        case .refuse: return "\\!%@"
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
        case .rigid(_, _): return .rigid(category, grading)
        case .crossOver(_, _): return .crossOver(category, grading)
        case .wannabe(_, _): return .wannabe(category, grading)
        case .professional(_, _): return .professional(category, grading)
        case .degree(_, _): return .degree(category, grading)
        case .noIdea(_, _): return .noIdea(category, grading)
        case .refuse(_, _): return .refuse(category, grading)
        case .notVeryRigid(_, _): return .notVeryRigid(category, grading)
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
            ,.notVeryRigid(let category, let grading)
            ,.refuse(let category, let grading):
            hasher.combine(category)
            hasher.combine(grading)
        }
        hasher.combine(self.regexForCodeModifier())
    }
}

enum GeekCodeGrading : String, CaseIterable {
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
    case geekOfArtificialIntelligence
    case geekOfBiomedicalEngineering
    case geekOfDataScience
    case geekOfDevOps
    case geekOfVideoGameDesign
    case businessGeek
    case geekOfTheClassics
    case geekOfCommercialArt
    case geekOfComputerScience
    case communicationsGeek
    case geekOfEngineering
    case educationGeek
    case geekOfFineArts
    case geekOfGovernment
    case geekOfHumanities
    case geekInformationTechnology
    case geekOfJurisprudence
    case geekOfLibraryScience
    case massCommunicationGeek
    case geekOfMathematics
    case medicineGeek
    case musicGeek
    case geekOfThePerformingArts
    case geekOfPhilosophy
    case geekOfTheExactSciences
    case geekOfSocialSciences
    case geekOfTechnicalMagazine
    case otherGeek
    case undecidedGeek
    case theGeekOfEverything
    case without
    
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
        case .businessGeek: return "B"
        case .geekOfTheClassics: return "C"
        case .geekOfCommercialArt: return "CA"
        case .geekOfComputerScience: return "CS"
        case .communicationsGeek: return "CC"
        case .geekOfEngineering: return "E"
        case .educationGeek: return "ED"
        case .geekOfFineArts: return "FA"
        case .geekOfGovernment: return "G"
        case .geekOfHumanities: return "H"
        case .geekInformationTechnology: return "IT"
        case .geekOfJurisprudence: return "J"
        case .geekOfLibraryScience: return "LS"
        case .massCommunicationGeek: return "MC"
        case .geekOfMathematics: return "M"
        case .medicineGeek: return "MD"
        case .musicGeek: return "MU"
        case .geekOfThePerformingArts: return "PA"
        case .geekOfPhilosophy: return "P"
        case .geekOfTheExactSciences: return "S"
        case .geekOfSocialSciences: return "SS"
        case .geekOfTechnicalMagazine: return "TW"
        case .otherGeek: return "O"
        case .undecidedGeek: return "U"
        case .theGeekOfEverything: return "AT"
        case .without: return "!"
        case .geekOfArtificialIntelligence: return "AI"
        case .geekOfBiomedicalEngineering: return "BIO"
        case .geekOfDataScience: return "DS"
        case .geekOfDevOps: return "DVO"
        case .geekOfVideoGameDesign: return "VGD"
        }
    }
}
