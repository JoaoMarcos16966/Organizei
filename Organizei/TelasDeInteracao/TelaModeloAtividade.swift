//
//  TelaModeloAtividade.swift
//  Organizei
//
//  Created by João vitor moraes de andrade on 01/07/26.
//

import SwiftUI

struct TelaModeloAtividade: View {
    var body: some View {

        ZStack(alignment: .leading) {
            Rectangle()
                .fill(Color(red: 187/255, green: 176/255, blue: 255/255))
                .frame(width: 345, height: 96)
                .cornerRadius(10)
                .overlay(
                    HStack {
                        ZStack {
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 77, height: 77)
                                .cornerRadius(10)

                            Image(systemName: "pencil")
                                .font(.largeTitle)
                            
                        }
                        .padding(10)
                        
                        VStack {
                            Text("Planejamento")
                                .font(.title3)
                            
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
                        
                    Spacer()
                        
                        Button {
                            print("botao de concluir atividade foi apertado")
                            
                            //MARK: Colocar aqui acao de cicar no botao
                        } label: {
                            Circle()
                                .frame(width: 30, height: 30)
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
    TelaModeloAtividade()
}
