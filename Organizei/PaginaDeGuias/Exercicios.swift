//
//  Exercicios.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 01/07/26.
//

import SwiftUI

struct Exercicios: View {
    var body: some View {
        ZStack {
                VStack {
                    LinearGradient(
                        colors: [
                            Color.orange.opacity(0.6),
                            Color(uiColor: .systemBackground),
                            
                        ],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                    .containerRelativeFrame(.vertical) { length, axis in
                        length / 2.5
                            }
                    
                    Spacer()
                }
                .ignoresSafeArea()
            ScrollView {
                
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    VStack(alignment: .leading, spacing: 10) {
                        HStack {
                            Spacer()
                            Image(systemName: "figure.run")
                                .font(.system(size: 69))
                            Spacer()
                        }
                        Spacer()
                        Spacer()
                        
                        
                        Text("Exercícios Físicos")
                            .font(.title).bold()
                        
                        Text("São atividades estruturadas que melhoram a saúde mental e física, prevenindo doenças crônicas e fortalecendo o sistema imunológico!")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    
                    Divider().padding(.horizontal)
                    
                    VStack(spacing: 20) {
                        
                        // Item 1: Feynman
                        NavigationLink {
                            DetalhePaginasGuias(
                                titulo: "Estudo Ativo vs Passivo",
                                passos: [
                                    PassoGuia(imagem: "1.circle.fill", titulo: "Passo 1: Escolha o tema", descricao: "Escreva tudo o que você já sabe sobre o assunto em uma folha de papel em branco.")
                                ]
                            )
                        } label: {
                            HStack(spacing: 12) {
                                Image("exercicios")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Saúde física e mental")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Liberam endorfinas que reduzem a an...")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }
                        }
                        
                        Divider()
                        
                    }
                    .padding(.horizontal)
                    
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    Exercicios()
}
