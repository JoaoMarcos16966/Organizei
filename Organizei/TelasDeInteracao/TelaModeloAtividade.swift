//
//  TelaModeloAtividade.swift
//  Organizei
//
//  Created by João vitor moraes de andrade on 01/07/26.
//

import SwiftUI

struct TelaModeloAtividade: View {
    var concluido: Bool = false
    @Binding var atividade: Atividade
    
    var body: some View {

        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(
                    red: Double(atividade.prioridade.cores[0]) / 255.0,
                    green: Double(atividade.prioridade.cores[1]) / 255.0,
                    blue: Double(atividade.prioridade.cores[2]) / 255.0
                )) // alterar para Atividade.prioridade.cor
                .frame(width: 345, height: 96)
                .cornerRadius(10)
                .overlay(
                    HStack {
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 77, height: 77)
                                .cornerRadius(10)

                            Image(systemName: "\(atividade.icone)") // alterar para Atividade.icone
                                .font(.largeTitle)
                            
                        }
                        .padding(10)
                        
                        VStack {
                            Text("\(atividade.nome)")
                                .font(.title3)
                                .frame(width: 118 ,  alignment: .leading)
                            
                            Text("Seg, Ter, Qua...")
                                .font(.caption2)
                                .foregroundStyle(Color.black)
                                .opacity(0.4)
                                .multilineTextAlignment(.leading)
                                .frame(width: 118 , alignment: .leading)
                            
                            Text("7:30 - 11:30")
                                .font(.caption2)
                                .foregroundStyle(Color.black)
                                .multilineTextAlignment(.leading)
                                .frame(width: 118 , height: 5, alignment: .leading)
                            
                                }
                            .frame(width: 168 ,  alignment: .leading)
                        
                    Spacer()
                        
                        Button {
                            print("botao de concluir atividade foi apertado")
                            
                            //MARK: Colocar aqui acao de cicar no botao
                        } label: {
                            Circle()
                                .foregroundColor(Color.white)
                                .glassEffect()
                                .frame(width: 30, height: 30)
                                .opacity(0.4)
                                .padding()
                        }

                        
                    }
                )
            
            
        }
        .onTapGesture {
            //            //MARK: Colocar aqui botao de apertar para editar hobby
            print("cliquei na zstack")
        }

    }
}

#Preview {
    TelaModeloAtividade(atividade: .constant(Atividade(nome: "Estudar Circuitos", icone: "pencil", dias: [], prioridade: Prioridade(nome: "Não urgente e importante"))))
}
