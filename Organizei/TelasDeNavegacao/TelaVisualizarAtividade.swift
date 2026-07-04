//
//  TelaVisualizarAtividade.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 03/07/26.
//

import SwiftUI
import SwiftData

struct TelaVisualizarAtividade: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    let atividade: AtividadeModel

    @State private var mostrarConfirmacaoExcluir = false

    var body: some View {
        Form {
            Section {
                HStack {
                    Spacer()

                    Text(atividade.icone)
                        .font(.system(size: 60))
                        .frame(width: 120, height: 120)
                        .background(.primary.opacity(0.10))
                        .cornerRadius(16)
                        .shadow(color: .primary.opacity(0.08), radius: 8, x: 0, y: 3)

                    Spacer()
                }
                .padding(.vertical, 10)
            }
            .listRowBackground(Color.clear)

            Section("Informações da Atividade") {

                LabeledContent("Data") {
                    Text(
                        atividade.data.formatted(
                            .dateTime
                                .locale(Locale(identifier: "pt_BR"))
                                .year()
                                .month(.wide)
                                .day()
                        )
                    )
                }

                LabeledContent("Horário de Início") {
                    Text(atividade.horaInicio.formatted(date: .omitted, time: .shortened))
                }

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

            // Seção de exclusão
            Section {
                HStack {
                    Spacer()

                    Text("Excluir atividade")
                        .foregroundStyle(.red)
                        .onTapGesture {
                            mostrarConfirmacaoExcluir = true
                        }

                    Spacer()
                }
            }
            .listRowBackground(Color.clear)
        }
        .navigationTitle(atividade.nome)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                NavigationLink {
                    TelaEditarAtividade(atividade: atividade)
                } label: {
                    Text("Editar")
                }
            }
        }
        .alert("Excluir atividade?", isPresented: $mostrarConfirmacaoExcluir) {
            Button("Cancelar", role: .cancel) { }

            Button("Apagar", role: .destructive) {
                modelContext.delete(atividade)
                dismiss()
            }
        } message: {
            Text("Essa ação não poderá ser desfeita.")
        }    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: AtividadeModel.self, configurations: config)

    let calendario = Calendar.current

    let dataFixa = calendario.date(from: DateComponents(year: 2026, month: 4, day: 15))!
    let inicioFixo = calendario.date(from: DateComponents(year: 2026, month: 4, day: 15, hour: 14))!
    let terminoFixo = calendario.date(from: DateComponents(year: 2026, month: 4, day: 15, hour: 18, minute: 30))!

    let atividade = AtividadeModel(
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
        TelaVisualizarAtividade(atividade: atividade)
    }
    .modelContainer(container)
}
