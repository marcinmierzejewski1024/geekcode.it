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

    
}

enum GeekCodeCategory
{
    //Appearance
    case Age(GeekCodeModifier?,GeekCodeGrading?)
    case Beard(GeekCodeModifier?,GeekCodeGrading?)
    case BeardMustache(GeekCodeModifier?,GeekCodeGrading?)
    case BeardSideburns(GeekCodeModifier?,GeekCodeGrading?)
    case BeardBushyEyebrows(GeekCodeModifier?,GeekCodeGrading?)
    case Clothing(GeekCodeModifier?,GeekCodeGrading?)
    case ClothingCrossDresser(GeekCodeGrading?)
    case ClothingDontCare(GeekCodeGrading?)
    case Dimensions(GeekCodeModifier?,GeekCodeGrading?,GeekCodeModifier?,GeekCodeGrading?)
    
    
    //Computers
    case Computer(GeekCodeModifier?,GeekCodeGrading?)
    
    case Unix(GeekCodeModifier?,GeekCodeGrading?)
    case Linux(GeekCodeModifier?,GeekCodeGrading?)
    case RPM(GeekCodeModifier?,GeekCodeGrading?)
    case Cwntos(GeekCodeModifier?,GeekCodeGrading?)
    case Fedora(GeekCodeModifier?,GeekCodeGrading?)
    case Opensuse(GeekCodeModifier?,GeekCodeGrading?)
    case Urpmi(GeekCodeModifier?,GeekCodeGrading?)
    case Apt_rpm(GeekCodeModifier?,GeekCodeGrading?)
    case Debian(GeekCodeModifier?,GeekCodeGrading?)
    case Ubuntu(GeekCodeModifier?,GeekCodeGrading?)
    case Thirdparty(GeekCodeModifier?,GeekCodeGrading?)
    case Mepis(GeekCodeModifier?,GeekCodeGrading?)
    case Knoppix(GeekCodeModifier?,GeekCodeGrading?)
    case Pacman(GeekCodeModifier?,GeekCodeGrading?)
    case Gentoo(GeekCodeModifier?,GeekCodeGrading?)
    case Slackware(GeekCodeModifier?,GeekCodeGrading?)
    case Other(GeekCodeModifier?,GeekCodeGrading?)
    case SunOS_Solaris(GeekCodeModifier?,GeekCodeGrading?)
    case AIX(GeekCodeModifier?,GeekCodeGrading?)
    case HPUX(GeekCodeModifier?,GeekCodeGrading?)
    case IRIX(GeekCodeModifier?,GeekCodeGrading?)
    case SCO_Unix(GeekCodeModifier?,GeekCodeGrading?)
    case UnixNot_listed(GeekCodeModifier?,GeekCodeGrading?)
    
    //programing
    case Java(GeekCodeModifier?,GeekCodeGrading?)
    case Cprogramminglang(GeekCodeModifier?,GeekCodeGrading?)
    case Cplusplus(GeekCodeModifier?,GeekCodeGrading?)
    case Csharp(GeekCodeModifier?,GeekCodeGrading?)
    case Visualbasic(GeekCodeModifier?,GeekCodeGrading?)
    case Python(GeekCodeModifier?,GeekCodeGrading?)
    case Javascript(GeekCodeModifier?,GeekCodeGrading?)
    case Php(GeekCodeModifier?,GeekCodeGrading?)
    case Objectivec(GeekCodeModifier?,GeekCodeGrading?)
    case Sql(GeekCodeModifier?,GeekCodeGrading?)
    case Perl(GeekCodeModifier?,GeekCodeGrading?)
    case Ruby(GeekCodeModifier?,GeekCodeGrading?)
    case Matlab(GeekCodeModifier?,GeekCodeGrading?)
    case Assembly(GeekCodeModifier?,GeekCodeGrading?)
    case Go(GeekCodeModifier?,GeekCodeGrading?)
    case R(GeekCodeModifier?,GeekCodeGrading?)
    case Swift(GeekCodeModifier?,GeekCodeGrading?)//not added to standard
    case Kotlin(GeekCodeModifier?,GeekCodeGrading?)//not added to standard
    
    func symbol() -> String {
            
        switch self {

        case .Age(_, _):
            return "a"
        case .Beard(_, _):
            return "b"
        case .BeardMustache(_, _):
            return "bm"
        case .BeardSideburns(_, _):
            return "bs"
        case .BeardBushyEyebrows(_, _):
            return "bb"
        case .Clothing(_, _):
            return "c"
        case .ClothingCrossDresser(_):
            return "cx"
        case .ClothingDontCare(_):
            return "cpu"
        case .Dimensions(_, _, _, _):
            return "d"
        case .Computer(_, _):
            return "c"
        case .Unix(_, _):
            return "u"
        case .Linux(_, _):
            return "ul"
        case .RPM(_, _):
            return "ulr"
        case .Cwntos(_, _):
            return "ulrc"
        case .Fedora(_, _):
            return "ulrf"
        case .Opensuse(_, _):
            return "ulro"
        case .Urpmi(_, _):
            return "ulru"
        case .Apt_rpm(_, _):
            return "ulra"
        case .Debian(_, _):
            return "uld"
        case .Ubuntu(_, _):
            return "uldu"
        case .Thirdparty(_, _):
            return "uldux"
        case .Mepis(_, _):
            return "uldm"
        case .Knoppix(_, _):
            return "uldk"
        case .Pacman(_, _):
            return "ulp"
        case .Gentoo(_, _):
            return "ulg"
        case .Slackware(_, _):
            return "uls"
        case .Other(_, _):
            return "ul*"
        case .SunOS_Solaris(_, _):
            return "us"
        case .AIX(_, _):
            return "ua"
        case .HPUX(_, _):
            return "uh"
        case .IRIX(_, _):
            return "ui"
        case .SCO_Unix(_, _):
            return "uc"
        case .UnixNot_listed(_, _):
            return "u*"
        case .Java:
            return "lj"
        case .Cprogramminglang(_, _):
            return "lc"
        case .Cplusplus(_, _):
            return "lcpp"
        case .Csharp(_, _):
            return "lc#"
        case .Visualbasic(_, _):
            return "lvb"
        case .Python(_, _):
            return "lp"
        case .Javascript(_, _):
            return "ljs"
        case .Php(_, _):
            return "lphp"
        case .Objectivec(_, _):
            return "loc"
        case .Sql(_, _):
            return "lsql"
        case .Perl(_, _):
            return "lp"
        case .Ruby(_, _):
            return "lru"
        case .Matlab(_, _):
            return "lm"
        case .Assembly(_, _):
            return "lasm"
        case .Go(_, _):
            return "lgo"
        case .R(_, _):
            return "lr"
        case .Swift(_, _):
            return "lsw"
        case .Kotlin(_, _):
            return "lko"
        }
        
    }
    
    
}


enum GeekCodeModifier : String
{
    case RIGID = "@"
    case CROSS_OVER = "()"
    case WANNABE = ">"
    case PROFESSIONAL = "$"
    case NO_IDEA = "?"
    case REFUSE = "!"
    
}

enum GeekCodeGrading
{
//    case noGrading??
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




enum GeekCodeSpecialization : String {
    case B
    case C
    case CA
    case CS
    case CC
    case E
    case ED
    case FA
    case G
    case H
    case IT
    case J
    case LS
    case MC
    case M
    case MD
    case MU
    case PA
    case P
    case S
    case SS
    case TW
    case O
    case U
    case AT
    case WITHOUT
    
    func symbol() -> String {
        switch self {
            case .WITHOUT:
            return "!";
            
        default:
            return "G\(self.rawValue)"
            
                
        }
    }
    
    func name() -> String {
        
        return NSLocalizedString(self.key(), comment: "");
    }
    
    func key() -> String{
        switch self {
        case .B:
            return "BUSINESS_GEEK"
        case .C:
            return "GEEK_OF_THE_CLASSICS"
        case .CA:
            return "GEEK_OF_COMMERCIAL_ART"
        case .CS:
            return "GEEK_OF_COMPUTER_SCIENCE"
        case .CC:
            return "COMMUNICATIONS_GEEK"
        case .E:
            return "GEEK_OF_ENGINEERING"
        case .ED:
            return "EDUCATION_GEEK"
        case .FA:
            return "GEEK_OF_FINE_ARTS"
        case .G:
            return "GEEK_OF_GOVERNMENT"
        case .H:
            return "GEEK_OF_HUMANITIES"
        case .IT:
            return "GEEK_INFORMATION_TECHNOLOGY"
        case .J:
            return "GEEK_OF_JURISPRUDENCE"
        case .LS:
            return "GEEK_OF_LIBRARY_SCIENCE"
        case .MC:
            return "MASS_COMMUNICATION_GEEK"
        case .M:
            return "GEEK_OF_MATHEMATICS"
        case .MD:
            return "MEDICINE_GEEK"
        case .MU:
            return "MUSIC_GEEK"
        case .PA:
            return "GEEK_OF_THE_PERFORMING_ARTS"
        case .P:
            return "GEEK_OF_PHILOSOPHY"
        case .S:
            return "GEEK_OF_THE_EXACT_SCIENCES"
        case .SS:
            return "GEEK_OF_SOCIAL_SCIENCES"
        case .TW:
            return "GEEK_OF_TECHNICAL_MAGAZINE"
        case .O:
            return "OTHER_GEEK"
        case .U:
            return "UNDECIDED_GEEK"
        case .AT:
            return "THE_GEEK_OF_EVERYTHING"
        case .WITHOUT:
            return "GEEK_WITHOUT_QUALIFICATIONS"


  
        }
    }
}
