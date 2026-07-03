//
//  ListaAtividades.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 02/07/26.
//

//Tela feita apenas para testar se o swiftData estava funcionando, não será colocada no aplicativo final (ela está inserida no botão da tela guia)


import SwiftUI
import SwiftData

struct ListaAtividades: View {
    @Query(sort: \AtividadeModel.data, order: .reverse) private var atividades: [AtividadeModel]
    
    @Environment(\.modelContext) private var modelContext
    
    var body: some View {
        NavigationStack {
            List {
                if atividades.isEmpty {
                    ContentUnavailableView(
                        "Nenhuma Atividade",
                        systemImage: "clipboard",
                        description: Text("As atividades que você criar aparecerão aqui.")
                    )
                } else {
                    ForEach(atividades) { atividade in
                        HStack(spacing: 12) {
                            // Ícone (Emoji)
                            Text(atividade.icone)
                                .font(.system(size: 30))
                                .frame(width: 50, height: 50)
                                .background(Color.gray.opacity(0.1))
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading, spacing: 4) {
                                // Nome da Atividade
                                Text(atividade.nome)
                                    .font(.headline)
                                
                                // Horário e Prioridade
                                HStack {
                                    Text(atividade.horaInicio, style: .time)
                                        .font(.subheadline)
                                        .foregroundColor(.secondary)
                                    
                                    Text("•")
                                        .foregroundColor(.secondary)
                                    
                                    Text(atividade.prioridade)
                                        .font(.caption)
                                        .padding(.horizontal, 8)
                                        .padding(.vertical, 2)
                                        .background(corDaPrioridade(atividade.prioridade).opacity(0.15))
                                        .foregroundColor(corDaPrioridade(atividade.prioridade))
                                        .cornerRadius(4)
                                }
                            }
                        }
                        .padding(.vertical, 4)
                    }
                    .onDelete(perform: deletarAtividade)
                }
            }
            .navigationTitle("Minhas Atividades")
        }
    }
    
    private func deletarAtividade(at offsets: IndexSet) {
        for index in offsets {
            let atividade = atividades[index]
            modelContext.delete(atividade)
        }
    }
    
        private func corDaPrioridade(_ prioridade: String) -> Color {
        switch prioridade {
        case "Urgente e importante": return .red
        case "Urgente e não importante": return .orange
        case "Não urgente e importante": return .blue
        default: return .gray
        }
    }
}

#Preview {
    ListaAtividades()
        .modelContainer(for: AtividadeModel.self, inMemory: true)
}
