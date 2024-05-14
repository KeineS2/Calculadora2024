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
    @State var result: Int?
    @State var color: Color = .indigo600
    
    @State var porteSelected = Porte.pequeno
    @State var failedInput = false
    let tituloPreencherCampos = "Preencha campos para cãocular!"
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Qual a idade do seu cão?")
                        .font(.header5)
                    Text("Anos")
                        .font(.body1)
                    TextField("Quantos anos completos tem seu cão?",
                              value: $years,
                              format: .number)
                    Text("Meses")
                        .font(.body1)
                    TextField("Quantos meses tem seu cão?", value: $months, format: .number)
                    
                    
                    Text("Porte")
                        .font(.body1)
                    
                    Picker("Portes", selection: $porteSelected){
                        ForEach(Porte.allCases, id:\.self) { porte in Text(porte.rawValue.capitalized)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    Divider()
                    
                    Spacer()
                    
                    if let result {
                        Text("Seu cachorro tem, em idade humana...")
                            .font(.body1)
                            .frame(maxWidth: .infinity)
                        Text("\(result) anos")
                            .font(.display)
                            .frame(maxWidth: .infinity)
                            .contentTransition(.numericText())
                    } else {
                        Image(ImageResource.clarinha)
                            .resizable()
                            .scaledToFit()
                            .frame(maxHeight: 150)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                            .shadow(radius: 10)
                    }
                    
                    Spacer()
                    
                    Button("Cãocular", action: processYears)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/)
                        .frame(height: 50)
                        .background(.indigo)
                        .foregroundStyle(.white)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .bold()
                        .font(.body1)
                    
                }
                .textFieldStyle(.roundedBorder)
                .keyboardType(.numberPad)
                .padding()
                .containerRelativeFrame(.vertical)
                .animation(.easeInOut.speed(0.5), value: result)
            }
            .alert(tituloPreencherCampos, isPresented: $failedInput, actions: {
                Button("Ok", role: .cancel, action: {})
            })
            .navigationTitle("Cãoculadora")
            .scrollDismissesKeyboard(.immediately)
            .toolbarBackground(.indigo600, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
        }
        .fontDesign(.rounded)
    }
}

//MARK: - Functions
extension ContentView{
    func processYears() {
        //a funçao recebe nada e retorna void
        //        print("Cãocular")
        
        guard let years, let months else {
            print("campo não preenchido")
            failedInput = true
            return
            
        }
        
        guard months > 0 || years > 0 else{
            print("pelo menos um campo tem que ser maior que zero")
            return
        }
        
        withAnimation(.easeInOut.speed(0.5)){
            result = porteSelected.calcularIdade(deAnoa: years, eMeses: months)
            
        }
    }
}
#Preview {
    ContentView()
}
