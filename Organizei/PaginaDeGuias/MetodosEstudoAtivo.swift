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
                                    
                                    PassoGuia(imagem: "Frame 1", titulo: "Estudo Passivo", descricao: "Acontece quando você apenas absorve a informação, sem interagir com ela. É o caso de assistir a aulas ou ler livros. O cérebro faz pouco esforço."),
                                    
                                    PassoGuia(imagem: "Frame 2", titulo: "Estudo Ativo", descricao: "O estudo ativo é uma abordagem de aprendizado onde o estudante é estimulado a processar, analisar e gerar algo a partir do conteúdo."),
                                    
                                    PassoGuia(imagem: nil, titulo: "Exemplo de Estudos Ativos:", descricao: "\n \n FlashCards\n Mapas Mentais\n Resolução de Questões\n Técnica Feynman\n \n \n \n Essas técnicas de estudo ativo forçam o cérebro a recuperar e manipular informações (em vez de apenas recebê-las passivamente), o que tira você da ilusão de conhecimento. Isso consolida o conteúdo na memória de longo prazo, melhora o pensamento crítico e revela exatamente quais pontos você ainda não entendeu.")
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
                                    PassoGuia(imagem: "Frame 3", titulo: "Flashcards", descricao: "São fichas de estudo que apresentam uma pergunta, conceito ou palavra-chave de um lado, e a resposta correspondente no verso. "),
                                    
                                    PassoGuia(imagem: nil, titulo: "Como fazer?", descricao: "\n  Fazer flashcards é simples: escolha um lado para a pergunta e o verso para a resposta curta. Use papel (como fichários cortados). Seja objetivo, use palavras-chave e revise a pilha até memorizar todos. \n Eles são utilizados para testar o seu conhecimento de forma rápida, estimulando a recuperação ativa da informação na memória. Ótima técnica para você estudar ativamente 😉")
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
                                titulo: "Mapa Mental",
                                passos: [
                                    PassoGuia(imagem: "Frame 4", titulo: "Mapas Mentais", descricao: "Diagramas visuais que organizam ideias e conceitos em torno de um tema central, facilitando a memorização e o raciocínio.")
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
