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
            VStack {
                
                TabView {
                    ForEach(passos) { passo in
                        VStack {
                            
                            Image(passo.imagem)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 280, height: 360)
                                .clipped()
                                .border(Color.gray, width: 2)
                                .cornerRadius(16)
                            
                            VStack {
                                Text(passo.titulo)
                                    .font(.title2).bold()
                                    .multilineTextAlignment(.center)
                                    .padding(.horizontal)
                            }
                            
                            Text(passo.descricao)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.secondary)
                                .padding(.horizontal, 20)
                           
                        }
                    }
                }
                .tabViewStyle(.page(indexDisplayMode: .always))
                .indexViewStyle(.page(backgroundDisplayMode: .always))
            }
            .navigationTitle(titulo)
            .navigationBarTitleDisplayMode(.inline)
        
    }
}

// MARK: - Preview
#Preview {
    NavigationStack {
        DetalhePaginasGuias(
            titulo: "Exemplo de Teste",
            passos: [
                // ATENÇÃO: "foto1" e "foto2" devem ser os nomes exatos das imagens no seu Assets.xcassets
                PassoGuia(
                    imagem: "foto1",
                    titulo: "Passo Inicial",
                    descricao: "Esta é uma pré-visualização de como a tela se comporta com fotos."
                ),
                PassoGuia(
                    imagem: "foto2",
                    titulo: "Passo Final",
                    descricao: "Adicione quantos passos forem necessários."
                )
            ]
        )
    }
}
