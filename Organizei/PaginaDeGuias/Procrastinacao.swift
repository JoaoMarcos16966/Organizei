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
                        
                        // Item 1: Flashcards
                        NavigationLink {
                            DetalhePaginasGuias(
                                titulo: "Matriz de Eisenhower",
                                passos: [
                                    PassoGuia(imagem: "Frame 5", titulo: "Matriz de Eisenhower", descricao: "Coloque prioridades nas suas tarefas, inspirada na matriz. O OrganizEI ajuda você com isso 😉")
                                ]
                            )
                        } label: {
                            HStack(spacing: 12) {
                                Image("matriz")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Matriz de Eisenhower")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Uma matriz criada para ajudar a dividir...")
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
