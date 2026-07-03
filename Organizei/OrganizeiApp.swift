//
//  OrganizeiApp.swift
//  Organizei
//
//  Created by João Marcos Pimentel Nascimento de Lima  on 25/06/26.
//

import SwiftUI
import SwiftData

@main
struct OrganizeiApp: App {
    var body: some Scene {
        WindowGroup {
            TABView()
        }
        .modelContainer(for: AtividadeModel.self)
    }
}
