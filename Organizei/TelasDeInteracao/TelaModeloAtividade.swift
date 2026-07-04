//
//  TelaModeloAtividade.swift
//  Organizei
//
//  Created by João vitor moraes de andrade on 01/07/26.
//

import SwiftUI


struct TelaModeloAtividade: View {
    var atividade: AtividadeModel
    @Environment(\.colorScheme) private var colorScheme
    
    func marcar() {
        withAnimation(.spring(response: 0.4, dampingFraction: 0.8)) {
            atividade.concluido.toggle()
        }
    }
    
    var corPrioridade: Color {
        switch atividade.prioridade.nome {

        case "Urgente e importante":
            return colorScheme == .light
                ? Color(red: 196/255, green: 114/255, blue: 250/255)
                : Color(red: 120/255, green: 58/255, blue: 170/255)

        case "Urgente e não importante":
            return colorScheme == .light
                ? Color(red: 187/255, green: 176/255, blue: 255/255)
                : Color(red: 103/255, green: 92/255, blue: 170/255)

        case "Não urgente e importante":
            return colorScheme == .light
                ? Color(red: 129/255, green: 205/255, blue: 255/255)
                : Color(red: 50/255, green: 120/255, blue: 180/255)

        default:
            return colorScheme == .light
                ? Color(red: 186/255, green: 240/255, blue: 255/255)
                : Color(red: 90/255, green: 145/255, blue: 170/255)
        }
    }
    
    var body: some View {

        ZStack(alignment: .leading) {
            if !atividade.concluido{
                    Rectangle()
                    .fill(corPrioridade) // alterar para Atividade.prioridade.cor
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
                                    .foregroundStyle(Color.primary)
                                    .opacity(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 118 , alignment: .leading)
                                
                                Text("\(atividade.horaInicio, format: .dateTime.hour().minute()) - \(atividade.horaTermino, format: .dateTime.hour().minute())")
                                    .font(.caption2)
                                    .foregroundStyle(Color.primary)
                                    .opacity(0.5)
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
                                    .opacity(0.4)
                                
                            }
                            .padding(10)
                            
                            VStack {
                                Text("\(atividade.nome)")
                                    .font(.title3)
                                    .opacity(0.5)
                                    .frame(width: 118 ,  alignment: .leading)
                                
                                Text("\(atividade.frequenciaRepeticao)")
                                    .font(.caption2)
                                    .foregroundStyle(Color.primary)
                                    .opacity(0.5)
                                    .multilineTextAlignment(.leading)
                                    .frame(width: 118 , alignment: .leading)
                                
                                Text("\(atividade.horaInicio, format: .dateTime.hour().minute()) - \(atividade.horaTermino, format: .dateTime.hour().minute())")
                                    .font(.caption2)
                                    .foregroundStyle(Color.primary)
                                    .opacity(0.5)
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
    TelaModeloAtividade(atividade: AtividadeModel(nome: "estudar", data: .now, horaInicio: .now, horaTermino: .now, repetirAtividade: false, frequenciaRepeticao: "Diario", prioridade: Prioridade(nome: "Não urgente e não importante"), icone: "pencil"))
}
