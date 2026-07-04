//
//  TelaEditarAtividade.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 04/07/26.
//

import SwiftUI
import SwiftData
import MCEmojiPicker

struct TelaEditarAtividade: View {

    @Environment(\.dismiss) private var dismiss

    @Bindable var atividade: AtividadeModel

    @State private var mostrarEmojiPicker = false

    let opcoesPrioridade = [
        "Urgente e importante",
        "Urgente e não importante",
        "Não urgente e importante",
        "Não urgente e não importante"
    ]

    let opcoesRepeticao = [
        "Diariamente",
        "Semanalmente",
        "Mensalmente",
        "Anualmente"
    ]

    var body: some View {

        Form {

            Section {
                HStack {
                    Spacer()

                    VStack(spacing: 6) {

                        Button {
                            mostrarEmojiPicker.toggle()
                        } label: {
                            Text(atividade.icone)
                                .font(.system(size: 60))
                                .frame(width: 120, height: 120)
                                .background(.primary.opacity(0.10))
                                .cornerRadius(16)
                                .shadow(color: .primary.opacity(0.08),
                                        radius: 8,
                                        x: 0,
                                        y: 3)
                        }
                        .emojiPicker(
                            isPresented: $mostrarEmojiPicker,
                            selectedEmoji: $atividade.icone,
                            arrowDirection: .up,
                            isDismissAfterChoosing: true
                        )

                        Text("Toque para mudar o ícone")
                            .font(.caption)
                            .foregroundStyle(.gray)
                    }

                    Spacer()
                }
                .padding(.vertical, 10)
            }
            .listRowBackground(Color.clear)

            Section {

                TextField("Nome da atividade", text: $atividade.nome)

            }

            Section("Informações da Atividade") {

                DatePicker(
                    "Data",
                    selection: $atividade.data,
                    displayedComponents: .date
                )

                DatePicker(
                    "Horário de Início",
                    selection: $atividade.horaInicio,
                    displayedComponents: .hourAndMinute
                )

                DatePicker(
                    "Horário de Término",
                    selection: $atividade.horaTermino,
                    displayedComponents: .hourAndMinute
                )

                Toggle(
                    "Repetir Atividade",
                    isOn: $atividade.repetirAtividade.animation()
                )

                if atividade.repetirAtividade {

                    Picker(
                        "Frequência",
                        selection: $atividade.frequenciaRepeticao
                    ) {
                        ForEach(opcoesRepeticao, id: \.self) { opcao in
                            Text(opcao)
                        }
                    }

                }

                Picker(
                    "Prioridade",
                    selection: $atividade.prioridade.nome
                ) {
                    ForEach(opcoesPrioridade, id: \.self) { opcao in
                        Text(opcao)
                    }
                }

            }

        }
        .navigationTitle("Editar Atividade")
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            
            ToolbarItem(placement: .topBarTrailing) {

                Button("Salvar") {

                    if !atividade.repetirAtividade {
                        atividade.frequenciaRepeticao = "Não se repete"
                    }

                    dismiss()
                }
                .disabled(
                    atividade.nome
                        .trimmingCharacters(in: .whitespacesAndNewlines)
                        .isEmpty
                )

            }

        }
    }
}

#Preview {
    let atividade = AtividadeModel(
        nome: "Estudar Redes",
        data: .now,
        horaInicio: .now,
        horaTermino: .now,
        repetirAtividade: true,
        frequenciaRepeticao: "Diariamente",
        prioridade: Prioridade(nome: "Urgente e importante"),
        icone: "💻"
    )

    NavigationStack {
        TelaEditarAtividade(atividade: atividade)
    }
}
