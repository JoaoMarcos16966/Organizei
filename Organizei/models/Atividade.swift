//
//  File.swift
//  Organizei
//
//  Created by João vitor moraes de andrade on 26/06/26.
//

import Foundation
import SwiftData

@Model
class Atividade {
    var nome: String 
    var icone: String
    var dias: [Date]
    var prioridade: Prioridade
    
    init(nome: String, icone: String, dias: [Date], prioridade: Prioridade) {
        self.nome = nome
        self.icone = icone
        self.dias = dias
        self.prioridade = prioridade
    }
}
