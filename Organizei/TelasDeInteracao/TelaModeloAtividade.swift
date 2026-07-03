//
//  TelaModeloAtividade.swift
//  Organizei
//
//  Created by João vitor moraes de andrade on 01/07/26.
//

import SwiftUI


struct TelaModeloAtividade: View {
    @State var concluido: Bool = false
    var atividade: AtividadeModel
    
    func marcar() {
        concluido.toggle()
    }
    
    var body: some View {

        ZStack(alignment: .leading) {
                if !concluido{
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
                                
                                Text(atividade.icone) // alterar para Atividade.icone
                                    .font(.largeTitle)
                                
                            }
                            .padding(10)
                            
                            VStack {
                                Text("\(atividade.nome)")
                                    .font(.title3)
                                    .frame(width: 118 ,  alignment: .leading)
                                
                                Text("\(atividade.frequenciaRepeticao)")
                                    .font(.caption2)
                                    .foregroundStyle(Color.black)
                                    .opacity(0.4)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 118 , alignment: .leading)
                                
                                Text("\(atividade.horaInicio, format: .dateTime.hour().minute()) - \(atividade.horaTermino, format: .dateTime.hour().minute())")
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
                                marcar()
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
                } else {
                    Rectangle()
                        .fill(.gray) // alterar para Atividade.prioridade.cor
                    .frame(width: 345, height: 96)
                    .cornerRadius(10)
                    .overlay(
                        HStack {
                            ZStack {
                                Rectangle()
                                    .fill(Color.white)
                                    .frame(width: 77, height: 77)
                                    .cornerRadius(10)
                                
                                Text(atividade.icone) // alterar para Atividade.icone
                                    .font(.largeTitle)
                                
                            }
                            .padding(10)
                            
                            VStack {
                                Text("\(atividade.nome)")
                                    .font(.title3)
                                    .frame(width: 118 ,  alignment: .leading)
                                
                                Text("\(atividade.frequenciaRepeticao)")
                                    .font(.caption2)
                                    .foregroundStyle(Color.black)
                                    .opacity(0.4)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 118 , alignment: .leading)
                                
                                Text("\(atividade.horaInicio, format: .dateTime.hour().minute()) - \(atividade.horaTermino, format: .dateTime.hour().minute())")
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
                                marcar()
                            } label: {
                                Image(systemName: "checkmark.circle.fill")
                                    .foregroundColor(Color.green)
                                    .font(.title)
                                    .glassEffect()
                                    .frame(width: 30, height: 30)
                                    .opacity(0.8)
                                    .padding()
                            }
                            
                            
                        }
                    )
                }
            
            
        }
        .onTapGesture {
            //            //MARK: Colocar aqui botao de apertar para editar hobby
            print("cliquei na zstack")
        }

    }
}

#Preview {
    TelaModeloAtividade(atividade: AtividadeModel(nome: "estudar", data: .now, horaInicio: .now, horaTermino: .now, repetirAtividade: false, frequenciaRepeticao: "Diario", prioridade: Prioridade(nome: "Urgente e importante"), icone: "pencil"))
}
