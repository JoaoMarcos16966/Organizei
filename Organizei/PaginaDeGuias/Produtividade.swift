//
//  Produtividade.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 01/07/26.
//
import SwiftUI

struct Produtividade: View {
    var body: some View {
        ZStack {
                VStack {
                    LinearGradient(
                        colors: [
                            Color.yellow.opacity(0.6),
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
                            Image(systemName: "bolt.badge.checkmark")
                                .font(.system(size: 69))
                            Spacer()
                        }
                        Spacer()
                        Spacer()
                        
                        
                        Text("Produtividade")
                            .font(.title).bold()
                        
                        Text("É a arte de focar no que traz resultado real, otimizando sua energia e seu tempo!")
                            .font(.body)
                            .foregroundColor(.secondary)
                    }
                    .padding(.horizontal)
                    
                    Divider().padding(.horizontal)
                    
                    VStack(spacing: 20) {
                        
                        // Item 1: Feynman
                        NavigationLink {
                            DetalhePaginasGuias(
                                titulo: "Planejar Atividades",
                                passos: [
                                    PassoGuia(imagem: "Frame 7", titulo: "Planejamento de Tarefas", descricao: "Para otimizar seu tempo, o ideal é visualizar suas atividades do dia em uma lista com ordem de prioridade!")
                                ]
                            )
                        } label: {
                            HStack(spacing: 12) {
                                Image("planejamento")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Planejamento de tarefas")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Defina suas metas diárias e concentre...")
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
                                titulo: "Técnica Pomodoro",
                                passos: [
                                    PassoGuia(imagem: "Frame 6", titulo: "Pomodoro", descricao: "Consiste em focar em uma tarefa por 25 minutos ininterruptos seguidos por uma pausa de 5 minutos.")
                                ]
                            )
                        } label: {
                            HStack(spacing: 12) {
                                Image("foco")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Foco")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Use técnicas como blocos de tempos...")
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
        Produtividade()
    }
}

