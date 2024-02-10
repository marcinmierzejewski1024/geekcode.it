//
//  CreateFormViewModel.swift
//  GeekCode
//
//  Created by Marcin Mierzejewski on 10/02/2024.
//

import Foundation
import SwiftUI

class CreateFormViewModel: ObservableObject {
    @Published var types = TypeItem.clean
}

struct TypeItem {
    let type: GeekCodeSpecialization
    var isPresented: Bool

}
extension TypeItem {
    static var clean: [TypeItem] {
        GeekCodeSpecialization.allCases.map { TypeItem(type: $0,
                                                       isPresented: false)}
    }
}
