//
//  AtividadeSwiftData.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 02/07/26.
//

import Foundation
import SwiftData

@Model
class AtividadeModel {
    var id: UUID
    var nome: String
    var data: Date
    var horaInicio: Date
    var horaTermino: Date
    var repetirAtividade: Bool
    var frequenciaRepeticao: String
    var prioridade: Prioridade
    var icone: String
    var concluido: Bool
    
    init(nome: String, data: Date, horaInicio: Date, horaTermino: Date, repetirAtividade: Bool, frequenciaRepeticao: String, prioridade: Prioridade, icone: String, concluido: Bool = false) {
        self.id = UUID()
        self.nome = nome
        self.data = data
        self.horaInicio = horaInicio
        self.horaTermino = horaTermino
        self.repetirAtividade = repetirAtividade
        self.frequenciaRepeticao = frequenciaRepeticao
        self.prioridade = prioridade
        self.icone = icone
        self.concluido = concluido
    }
}
