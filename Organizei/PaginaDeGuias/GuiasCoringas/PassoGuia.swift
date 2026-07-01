//
//  PassoGuia.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 01/07/26.
//

import SwiftUI

struct PassoGuia: Identifiable {
    let id = UUID()
    let imagem: String      // Nome da foto exatamente como está no Assets
    let titulo: String      // Título da página interna
    let descricao: String   // Texto explicativo de cada passo
}
