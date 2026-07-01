//
//  Guia.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 30/06/26.
//

import SwiftUI

struct Guia: View {
    var body: some View {
        NavigationStack {
           
            
    
            List {

                //Parte de estudos
                Section("Estudos") {
                    
                    //Estudo Ativo
                    NavigationLink {
                        MetodosEstudoAtivo()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "book.closed")
                                .foregroundStyle(.blue)
                            Text("Métodos de Estudo Ativo")
                        }
                    }

                    
                    //Produtividade
                    NavigationLink {
                        Produtividade()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "bolt.badge.checkmark")
                                .foregroundStyle(.yellow)
                            Text("Produtividade")
                        }
                    }

                    
                    //Procrastinação
                    NavigationLink {
                        Procrastinacao()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "clock.badge.xmark.fill")
                                .foregroundStyle(.red)
                            
                            Text("Procrastinação")
                        }
                    }
                }

//-----------------------------------------------------//
                //Parte de Saúde e Bem Estar
                Section("Saúde e Bem-Estar Social") {

                    //Tempo de qualidade
                    NavigationLink {
                        Text("Tempo de Qualidade")
                        
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                            
                            Text("Tempo de Qualidade")
                        }
                    }

                    //Higiene do Sono
                    NavigationLink {
                        Text("Higiene do Sono")
                        
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "powersleep")
                            
                            Text("Higiene do Sono")
                        }
                    }

                    //Inteligencia Emocional
                    NavigationLink {
                        Text("Inteligência Emocional")
                        
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "brain.filled.head.profile")
                            
                            Text("Inteligência Emocional")
                        }
                    }
                    
                    //Exercícios
                    
                    NavigationLink {
                        Text("Exercícios Físicos")
                        
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "figure.run")
                            Text("Exercícios Físicos")
                        }
                    }
                    
                    
                    
                    
                }
            }
            .navigationTitle("Guia do Estudante")
            .listStyle(.insetGrouped)
            
            .scrollContentBackground(.hidden)
                        
                        .background {
                            VStack(spacing: 0) {
                                LinearGradient(
                                    colors: [
                                        Color.blue.opacity(0.6),
                                        Color(uiColor: .systemGroupedBackground)
                                    ],
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                                .frame(height: 200)
                                Color(uiColor: .systemGroupedBackground)
                            }
                            .ignoresSafeArea()
                        }
            
        }
    }
}

#Preview {
    Guia()
}
