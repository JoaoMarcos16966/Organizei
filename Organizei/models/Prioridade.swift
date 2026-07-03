//
//  Prioridade.swift
//  Organizei
//
//  Created by João vitor moraes de andrade on 02/07/26.
//

import Foundation
import SwiftData

@Model
class Prioridade {
    var nome: String
    var cores: [Int] //RGB
    
    init(nome: String) {
        
        self.cores = []
        self.nome = nome
        
        self.cores = receberCores(nome: nome)
    }
    
    func receberCores(nome: String) -> [Int] {
        if nome == "Urgente e importante" {
            return [196,114,250]
        } else if nome == "Urgente e não importante" {
            return [187,176,255]
        } else if nome == "Não urgente e importante" {
            return [129,205,255]
        } else {
            return [186,240,255]
        }
    }
}
