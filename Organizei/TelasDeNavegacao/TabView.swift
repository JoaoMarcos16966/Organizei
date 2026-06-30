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

            // MARK: Tela do calendario
            withAnimation {
                TelaInicial()
                    .tabItem {
                        Label(
                            "Calendadio",
                            systemImage:
                                "list.bullet"
                        )
                    }
            }
            // MARK: Tela do Pomodoro
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
            // MARK: Tela do Guia
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
        }
    }
}

#Preview {
    TABView()
}
