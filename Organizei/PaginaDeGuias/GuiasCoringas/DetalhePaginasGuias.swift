//
//  DetalhePaginasGuias.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 01/07/26.
//

import SwiftUI

struct DetalhePaginasGuias: View {
    let titulo: String
    let passos: [PassoGuia]

    var body: some View {
        TabView {
            ForEach(passos) { passo in
                VStack(spacing: 20) {

                    // Exibe a imagem apenas se existir
                    if let imagem = passo.imagem {
                        Image(imagem)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 280, height: 360)
                            .clipped()
                            .cornerRadius(16)
                    }

                    // Título
                    Text(passo.titulo)
                        .font(.title2)
                        .bold()
                        .multilineTextAlignment(.center)
                        .padding(.horizontal)

                    // Descrição
                    Text(passo.descricao)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.secondary)
                        .padding(.horizontal, 24)

                    Spacer()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .padding()
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
        .indexViewStyle(.page(backgroundDisplayMode: .always))
        .navigationTitle(titulo)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        DetalhePaginasGuias(
            titulo: "Exemplo de Teste",
            passos: [
                PassoGuia(
                    imagem: nil,
                    titulo: "Estudo Passivo",
                    descricao: "Acontece quando você apenas absorve a informação, sem interagir com ela. É o caso de assistir a aulas ou ler livros. O cérebro faz pouco esforço, o que facilita o esquecimento."
                ),

                PassoGuia(
                    imagem: "foto2",
                    titulo: "Estudo Ativo",
                    descricao: "O estudo ativo faz você recuperar, organizar e aplicar o conhecimento, fortalecendo a aprendizagem."
                )
            ]
        )
    }
}


