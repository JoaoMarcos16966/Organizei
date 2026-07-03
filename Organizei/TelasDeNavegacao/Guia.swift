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
//                        ListaAtividades()
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
                        TempoQualidade()
                        
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "clock.arrow.trianglehead.counterclockwise.rotate.90")
                                .foregroundStyle(.green)

                            
                            Text("Tempo de Qualidade")
                        }
                    }

                    //Higiene do Sono
                    NavigationLink {
                        HigieneSono()
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "powersleep")
                                .foregroundStyle(.primary)

                            Text("Higiene do Sono")
                        }
                    }

                    //Inteligencia Emocional
                    NavigationLink {
                        InteligenciaEmocional()
                        
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "brain.filled.head.profile")
                                .foregroundStyle(.purple)

                            
                            Text("Inteligência Emocional")
                        }
                    }
                    
                    //Exercícios
                    
                    NavigationLink {
                        Exercicios()
                        
                    } label: {
                        HStack(spacing: 12) {
                            Image(systemName: "figure.run")
                                .foregroundStyle(.orange)

                            Text("Exercícios Físicos")
                            
                        }
                    }
                    
                    
                    
                    
                }
            }
            .navigationTitle("Guia de Organização")
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
