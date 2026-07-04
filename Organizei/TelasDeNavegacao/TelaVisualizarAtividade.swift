//
//  TelaVisualizarAtividade.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 03/07/26.
//

import SwiftUI
import SwiftData

struct TelaVisualizarAtividade: View {
    let atividade: AtividadeModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    //Parte do emoji, onde fica a figura da atividade
                    HStack {
                        Spacer()
                        VStack(spacing: 12) {
                            Text(atividade.icone)
                                .font(.system(size: 60))
                                .frame(width: 120, height: 120)
                                .background(.primary.opacity(0.10))
                                .cornerRadius(16)
                                .shadow(color: .primary.opacity(0.08), radius: 8, x: 0, y: 3)
                        }
                        Spacer()
                    }
                    .padding(.vertical, 10)
                }
                .listRowBackground(Color.clear)
                
                //Detalhes da atividade
                Section(header: Text("Informações da Atividade")) {
                    
                    //Parte da data e com a hora do brasil
                    LabeledContent("Data") {
                        Text(atividade.data.formatted(.dateTime.locale(Locale(identifier: "pt_BR")).year().month(.wide).day()))
                    }
                    
                    //Hora do inicio
                    LabeledContent("Horário de Início") {
                        Text(atividade.horaInicio.formatted(date: .omitted, time: .shortened))
                    }
                    //hora que termina
                    LabeledContent("Horário de Término") {
                        Text(atividade.horaTermino.formatted(date: .omitted, time: .shortened))
                    }
                    
                    if atividade.repetirAtividade {
                        LabeledContent("Frequência") {
                            Text(atividade.frequenciaRepeticao)
                        }
                    }
                    
                    LabeledContent("Prioridade") {
                        Text(atividade.prioridade.nome)
                    }
                }
            }
            .navigationTitle(atividade.nome)
        
            
        }
    }
}


//Preview para testar
#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: AtividadeModel.self, configurations: config)

    let calendario = Calendar.current

    let dataFixa = calendario.date(from: DateComponents(year: 2026, month: 4, day: 15))!

    let inicioFixo = calendario.date(from: DateComponents(
        year: 2026,
        month: 4,
        day: 15,
        hour: 14,
        minute: 0
    ))!

    let terminoFixo = calendario.date(from: DateComponents(
        year: 2026,
        month: 4,
        day: 15,
        hour: 18,
        minute: 30
    ))!

    let atividadeExemplo = AtividadeModel(
        nome: "Estudar Redes",
        data: dataFixa,
        horaInicio: inicioFixo,
        horaTermino: terminoFixo,
        repetirAtividade: true,
        frequenciaRepeticao: "Diariamente",
        prioridade: Prioridade(nome: "Urgente e importante"),
        icone: "💻"
    )

    return NavigationStack {
        TelaVisualizarAtividade(atividade: atividadeExemplo)
    }
    .modelContainer(container)
    .environment(\.locale, Locale(identifier: "pt_BR"))
}
