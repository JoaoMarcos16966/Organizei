//
//  TelaNovaAtividade.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 02/07/26.
//

import SwiftUI
import MCEmojiPicker
import SwiftData

struct TelaNovaAtividade: View {
    
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    
    @State private var nome: String = ""
    @State private var dias = Date()
    
    @State private var horaInicio = Date()
    @State private var horaTermino = Date() + 3600
    
    @State private var salvarAtividade: Bool = false
    
    @Binding var mostrarNovaAtividade: Bool
    
    @State private var prioridade: String = "Urgente e importante"
    let opcoesPrioridade = ["Urgente e importante", "Urgente e não importante", "Não urgente e importante", "Não urgente e não importante"]
    
    
    @State private var repetirAtividade: Bool = false
    @State private var frequenciaRepeticao: String = "Diariamente"
    let opcoesRepeticao = ["Diariamente", "Semanalmente", "Mensalmente", "Anualmente"]
    
    
    @State private var icone: String = "📖"
    @State private var mostrarEmojiPicker: Bool = false
    
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    VStack {
                        HStack {
                            Spacer()
                            VStack(spacing: 4) {
                                
                                Button {
                                    mostrarEmojiPicker.toggle()
                                } label: {
                                    Text(icone)
                                        .font(.system(size: 60))
                                        .frame(width: 120, height: 120)
                                        .background(.primary.opacity(0.10))         .cornerRadius(16)
                                        .shadow(color: .black.opacity(0.08), radius: 8, x: 0, y: 3)
                                }
                                .emojiPicker(
                                    isPresented: $mostrarEmojiPicker,
                                    selectedEmoji: $icone,
                                    arrowDirection: .up,
                                    isDismissAfterChoosing: true
                                )
                                
                                Text("Toque para mudar o ícone")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                        }
                        .padding(.top, 10)
                        .padding(.bottom, -10)
                    }
                }
                .listRowBackground(Color.clear)
                
                
                Section(header: Text("")) {
                    TextField("Nome da atividade", text: $nome)
                }
                
                Section(header: Text("Informações da Atividade")) {
                    DatePicker("Data Atividade", selection: $dias, displayedComponents: .date)
                    
                    DatePicker("Horário de Início", selection: $horaInicio, displayedComponents: .hourAndMinute)
                    
                    DatePicker("Horário de Término", selection: $horaTermino, displayedComponents: .hourAndMinute)
                    
                    Toggle("Repetir Atividade", isOn: $repetirAtividade.animation())
                    
                    if repetirAtividade {
                        Picker("Frequência", selection: $frequenciaRepeticao) {
                            ForEach(opcoesRepeticao, id: \.self) { opcao in
                                Text(opcao)
                            }
                        }
                    }
                    
                    Picker("Prioridade", selection: $prioridade) {
                        ForEach(opcoesPrioridade, id: \.self) { opcao in
                            Text(opcao)
                        }
                    }
                    
                }
            }
            
            //Parte da ToolBar
            .navigationTitle("Nova Atividade")
            
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        guard !nome.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else { return }
                        
                        let novaAtividade = AtividadeModel(
                            nome: nome,
                            data: dias,
                            horaInicio: horaInicio,
                            horaTermino: horaTermino,
                            repetirAtividade: repetirAtividade,
                            frequenciaRepeticao: repetirAtividade ? frequenciaRepeticao : "Não se repete",
                            prioridade: Prioridade(nome: prioridade),
                            icone: icone
                        )
                        
                        print(nome,icone,  dias, horaInicio, horaTermino, repetirAtividade, frequenciaRepeticao, prioridade)
                        
                        // Insere no banco de dados local
                        modelContext.insert(novaAtividade)
                        
                        salvarAtividade = true
                        mostrarNovaAtividade = false
                        dismiss()
                        
                    } label: {
                        Image(systemName: "arrow.up")
                    }
                    .tint(Color.blue)
                }
                
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        salvarAtividade = false
                        mostrarNovaAtividade = false
                        
                    } label: {
                        Image(systemName: "multiply")
                    }
                }
                
                
                
                
            }
            
        }
    }
}

#Preview {
    TelaNovaAtividade(mostrarNovaAtividade: .constant(true))
}
