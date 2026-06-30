//
//  File.swift
//  Organizei
//
//  Created by João vitor moraes de andrade on 26/06/26.
//

import Foundation

class Atividade {
    var nome: String = ""
    var icone: String = ""
    var dias: [Date] = []
    var prioridade: String = ""
    
    init(nome: String, icone: String, dias: [Date], prioridade: String) {
        self.nome = nome
        self.icone = icone
        self.dias = dias
        self.prioridade = prioridade
    }
}
