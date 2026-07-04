//
//  HigieneSono.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 01/07/26.
//

import SwiftUI

struct HigieneSono: View {
    var body: some View {
        ZStack {
                VStack {
                    LinearGradient(
                        colors: [
                            Color.primary.opacity(0.7),
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
                            Image(systemName: "powersleep")
                                .font(.system(size: 69))
                            Spacer()
                        }
                        Spacer()
                        Spacer()
                        
                        
                        Text("Higiene do Sono")
                            .font(.title).bold()
                        
                        Text("Consiste em um conjunto de hábitos diários que preparam o cérebro e o corpo para um descanso reparador")
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
                                Image("dormir")
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 60, height: 60)
                                    .clipped()
                                
                                VStack(alignment: .leading, spacing: 4) {
                                    Text("Desconecte-se")
                                        .font(.headline)
                                        .foregroundColor(.primary)
                                    Text("Desligue celulares, tablets e a TV pelo...")
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
    HigieneSono()
}
