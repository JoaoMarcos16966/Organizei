//
//  Procrastinacao.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 01/07/26.
//

import SwiftUI

struct Procrastinacao: View {
    var body: some View {
        ZStack {
                VStack {
                    LinearGradient(
                        colors: [
                            Color.red.opacity(0.9),
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
                            Image(systemName: "clock.badge.xmark.fill")
                                .font(.system(size: 69))
                            Spacer()
                        }
                        Spacer()
                        Spacer()
                        
                        
                        Text("Procrastinação")
                            .font(.title).bold()
                        
                        Text("Hábito de adiar tarefas importantes em troca de atividades menos relevantes ou mais prazerosas")
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
                                Image("Estudos")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Elimine Distrações")
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
                                    PassoGuia(imagem: "questionmark.bubble.fill", titulo: "Frente do Card", descricao: "Coloque uma pergunta direta que force a sua recordação ativa.")
                                ]
                            )
                        } label: {
                            HStack(spacing: 12) {
                                Image("flashcards")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Matriz de Eisenhower")
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
        Procrastinacao()
    }
}
