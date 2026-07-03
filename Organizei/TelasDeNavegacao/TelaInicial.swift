//
//  ContentView.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 25/06/26.
//

import HDatePicker
import SwiftData
import SwiftUI

struct TelaInicial: View {
//    @State var atividade: AtividadeModel
    @State var selectedDay: Date = .now
    @State private var mostrarNovaAtividade: Bool = false
    
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \AtividadeModel.horaInicio) var consulta: [AtividadeModel]
    //query var conulta:[atividades]
    
        //var ativddsFiltradas = conulta..filter: [para cada intem se [itens].date == selectday
    
    var body: some View {
        @State var TituloDaNavegacao: String =
            Calendar.current.isDate(Date.now, inSameDayAs: selectedDay)
        ? "Hoje" : selectedDay.formatted(.dateTime.day().month(.wide).locale(Locale(identifier: "pt_BR")))

        NavigationStack {
            HDatePicker(selectedDay: $selectedDay)
            ScrollView {
                VStack {
                    
                    
                    ForEach(consulta) { atividade in
                        let showDate = Calendar.current.isDate(atividade.data, inSameDayAs: selectedDay)
                        
                        if showDate {
                            TelaModeloAtividade(atividade: atividade)
                        }
                    }
                    Spacer()
                    
                        .navigationTitle(TituloDaNavegacao)  // Trocar pelo dia selecionado, se dataEscolhida == date.now(), navigationTitle = Hoje
                    
                        .toolbar {
                            ToolbarItem(placement: .topBarTrailing) {
                                Button {
                                    mostrarNovaAtividade = true
                                } label: {
                                    Image(systemName: "plus")
                                }
                            }
                        }
                    //Sheet para mostrar a tela de nova atividade
                        .sheet(isPresented: $mostrarNovaAtividade) {
                            TelaNovaAtividade(mostrarNovaAtividade: $mostrarNovaAtividade)
                        }
                    
                }
            }

        }
    }
}

#Preview {
    TelaInicial()
}
