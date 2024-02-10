//
//  CreateFormView.swift
//  GeekCode
//
//  Created by Marcin Mierzejewski on 10/02/2024.
//

import SwiftUI

struct CreateFormView: View {
    @ObservedObject var createViewModel: CreateFormViewModel

    var body: some View {
        TypesSelectionView(types: createViewModel.types)
    }
}

struct CreateFormView_Previews: PreviewProvider {
    static var previews: some View {
        CreateFormView(createViewModel: CreateFormViewModel())
    }
}
