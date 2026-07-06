//
//  TabView.swift
//  Hobby
//
//  Created by João Moraes on 25/05/26.
//

import SwiftUI

struct TABView: View {
    var body: some View {
        // MARK: Tela inicial
        TabView {
            withAnimation {
                TelaInicial()
                    .tabItem {
                        Label(
                            "Tarefas",
                            systemImage:
                                "list.bullet"
                        )
                    }
            }
//
//            // MARK: Tela do calendario
//            withAnimation {
//                Calendario()
//                    .tabItem {
//                        Label(
//                            "Calendário",
//                            systemImage:
//                                "calendar"
//                        )
//                    }
//            }
            
            //Projetos futuros
            // MARK: Tela do Pomodoro
            withAnimation {
                Pomodoro()
                    .tabItem {
                        Label(
                            "Pomodoro",
                            systemImage:
                                "timer"
                        )
                    }
            }
            // MARK: Tela do Guia
            withAnimation {
                Guia()
                    .tabItem {
                        Label(
                            "Guia",
                            systemImage:
                                "signpost.right.and.left"
                        )
                    }
            }
        }
    }
}

#Preview {
    TABView()
}
