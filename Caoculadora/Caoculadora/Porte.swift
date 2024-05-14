//
//  Porte.swift
//  Caoculadora
//
//  Created by Keine Vitor de Santana on 13/05/24.
//

import Foundation

enum Porte: String, CaseIterable {
    case pequeno = "Pequeno"
    case medio = "Médio"
    case grande = "Grande"
    
    func calcularIdade(deAnoa anosCaninos: Int, eMeses mesesCaninos: Int) -> Int {
        
        // o resultado vai ser anos * multiplicador + a fraçao do ano em meses * multiplicador
        //multiplicador: pequeno - 6, médio - 7 e grande - 8
        
        let multiplicador: Int
        switch self {
        case .pequeno:
            multiplicador = 6
        case .medio:
            multiplicador = 7
        case .grande:
            multiplicador = 8
        }
        
        let result = anosCaninos * multiplicador + mesesCaninos * multiplicador / 12

        return result
    }
}
