//
//  ShowMyAcademyHistoryAppApp.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/25.
//

import SwiftUI

@main
struct ShowMyAcademyHistoryAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
