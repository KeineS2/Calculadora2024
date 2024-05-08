//
//  ContentView.swift
//  Caoculadora
//
//  Created by Keine Vitor de Santana on 07/05/24.
//

import SwiftUI

struct ContentView: View {
    
    @State var years: Int?
    @State var months: Int?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Qual a idade do seu cão?")
            
            Text("Anos")
            TextField("Quantos anos completos tem seu cão?",
                      value: $years,
                      format: .number)
            Text("Meses")
            TextField("Quantos meses tem seu cão?", value: $months, format: .number)
            Text("Porte")
        }
        .textFieldStyle(.roundedBorder)
        .keyboardType(.numberPad)
        .padding()
    }
}

#Preview {
    ContentView()
}
