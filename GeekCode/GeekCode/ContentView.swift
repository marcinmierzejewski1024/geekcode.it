//
//  ContentView.swift
//  GeekCode
//
//  Created by Marcin Mierzejewski on 07/08/2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        CreateFormView(createViewModel: CreateFormViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
