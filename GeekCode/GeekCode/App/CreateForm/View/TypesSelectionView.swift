//
//  TypesSelectionView.swift
//  GeekCode
//
//  Created by Marcin Mierzejewski on 10/02/2024.
//

import SwiftUI

struct TypesSelectionView: View {
    var types: Binding<[TypeItem]>

    var body: some View {
        List() {
            ForEach(types, id: \.type.rawValue) { item in
//                Toggle(isOn: item.selected) {
//                    Text(item.type.name)
//                }
//                .toggleStyle(CheckboxToggleStyle())
                
            }
        }
    }
}

struct TypesSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        TypesSelectionView(types: .constant(TypeItem.clean))
    }
}
