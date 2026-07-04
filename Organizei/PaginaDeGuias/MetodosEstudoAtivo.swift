//
//  MetodosEstudoAtivo.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 01/07/26.
//

import SwiftUI

struct MetodosEstudoAtivo: View {
    var body: some View {
        ZStack {
                VStack {
                    LinearGradient(
                        colors: [
                            Color.blue.opacity(0.6),
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
                            Image(systemName: "book.closed")
                                .font(.system(size: 72))
                            Spacer()
                        }
                        Spacer()
                        Spacer()
                        
                        
                        Text("Métodos de Estudo Ativo")
                            .font(.title).bold()
                        
                        Text("Aprenda técnicas de estudo que trabalham ativamente o cérebro")
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
                                    PassoGuia(imagem: "Ativo", titulo: "Estudo Ativo", descricao: "O estudo ativo é uma abordagem de aprendizado onde o estudante é estimulado a processar, analisar e gerar algo a partir do conteúdo."),
                                    
                                    PassoGuia(imagem: "Passivo", titulo: "Estudo Passivo", descricao: "Acontece quando você apenas absorve a informação, sem interagir com ela. É o caso de assistir a aulas ou ler livros. O cérebro faz pouco esforço, o que facilita o esquecimento."),
                                    
                                    PassoGuia(imagem: nil, titulo: "", descricao: "Acontece quando você apenas absorve a informação, sem interagir com ela. É o caso de assistir a aulas ou ler livros. O cérebro faz pouco esforço, o que facilita o esquecimento.")
                                ]
                            )
                        } label: {
                            HStack(spacing: 12) {
                                Image("Estudos")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Estudo Ativo vs Passivo")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Duas técnicas que se diferenciam pelo...")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }
                        }
                        
                        Divider()
                        
                        // Item 2: Flashcards
                        NavigationLink {
                            DetalhePaginasGuias(
                                titulo: "Flashcards",
                                passos: [
                                    PassoGuia(imagem: "questionmark.bubble.fill", titulo: "Flashcards", descricao: "Coloque uma pergunta direta que force a sua recordação ativa.")
                                ]
                            )
                        } label: {
                            HStack(spacing: 12) {
                                Image("flashcards")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Flashcards")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Pequenos cartões que usam o sistema...")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }
                        }
                        Divider()
                        //Item 3
                        NavigationLink {
                            DetalhePaginasGuias(
                                titulo: "Técnica Feynman",
                                passos: [
                                    PassoGuia(imagem: "1.circle.fill", titulo: "Passo 1: Escolha o tema", descricao: "Escreva tudo o que você já sabe sobre o assunto em uma folha de papel em branco.")
                                ]
                            )
                        } label: {
                            HStack(spacing: 12) {
                                Image("MapaMental")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Mapas Mentais")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Técnica de estudo e organização que...")
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                        .multilineTextAlignment(.leading)
                                }
                                Spacer()
                            }
                        }
                        
                        Divider()
                        
                        //Item 4
                        NavigationLink {
                            DetalhePaginasGuias(
                                titulo: "Técnica Feynman",
                                passos: [
                                    PassoGuia(imagem: "1.circle.fill", titulo: "Passo 1: Escolha o tema", descricao: "Escreva tudo o que você já sabe sobre o assunto em uma folha de papel em branco.")
                                ]
                            )
                        } label: {
                            HStack(spacing: 12) {
                                Image("Simulados")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                    .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Resolução de Questões e Simula...")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("A resolução de questões e simulados...")
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
    NavigationStack {
        MetodosEstudoAtivo()
    }
}
