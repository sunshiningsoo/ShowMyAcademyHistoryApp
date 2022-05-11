//
//  ShowMyAcademyHistoryAppApp.swift
//  ShowMyAcademyHistoryApp
//
//  Created by 박성수 on 2022/04/25.
//

import SwiftUI
import CoreData

@main
struct ShowMyAcademyHistoryAppApp: App {
    @StateObject var dataController = DataController()
    @StateObject var storiesClass:StoriesClass = StoriesClass()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
                .environmentObject(StoriesClass())
        }
    }
}
