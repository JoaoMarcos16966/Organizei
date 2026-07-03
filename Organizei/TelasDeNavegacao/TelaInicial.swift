//
//  ContentView.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 25/06/26.
//

import HDatePicker
import SwiftUI

struct TelaInicial: View {
    @State var selectedDay: Date = .now
  
    @State private var mostrarNovaAtividade: Bool = false
    
    var body: some View {
        @State var TituloDaNavegacao: String =
            Calendar.current.isDate(Date.now, inSameDayAs: selectedDay)
        ? "Hoje" : selectedDay.formatted(.dateTime.day().month(.wide).locale(Locale(identifier: "pt_BR")))

        NavigationStack {

            VStack {
                HDatePicker(selectedDay: $selectedDay)

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

#Preview {
    TelaInicial()
}
