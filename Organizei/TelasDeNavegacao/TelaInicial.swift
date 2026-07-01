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
    //    @State var diaDeHoje: Date = .now

    var body: some View {
        @State var TituloDaNavegacao: String =
            Calendar.current.isDate(Date.now, inSameDayAs: selectedDay)
        ? "Hoje" : "\(selectedDay.formatted(.dateTime.day().month(.wide)))"

        NavigationStack {

            VStack {
                HDatePicker(selectedDay: $selectedDay)

                Spacer()

                    .navigationTitle(TituloDaNavegacao)  // Trocar pelo dia selecionado, se dataEscolhida == date.now(), navigationTitle = Hoje

                    .toolbar {
                        ToolbarItem(placement: .topBarTrailing) {
                            NavigationLink {
                                //adicionar aqui sheet para adicionar uma nova atividade
                            } label: {
                                Image(systemName: "plus")
                            }
                        }
                    }
            }

        }
    }
}

#Preview {
    TelaInicial()
}
