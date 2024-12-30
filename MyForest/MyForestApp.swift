//
//  MyForestApp.swift
//  MyForest
//
//  Created by zeze kim on 12/28/24.
//

import SwiftUI

@main
struct MyForestApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
                .onAppear { // 포그라운드일 때마다 다크 모드 여부 업데이트
                    Themes.updateTheme()
                }
        }
    }
}
