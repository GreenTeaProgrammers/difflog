
import SwiftUI
import SwiftData

@main
struct difflogApp: App {

    //MARK: - データベースの初期化
    var sharedModelContainer: ModelContainer = {
            let schema = Schema([
                Item.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

            do {
                return try ModelContainer(for: schema, configurations: [modelConfiguration])
            } catch {
                fatalError("Could not create ModelContainer: \(error)")
            }
        }()

    //MARK: - エントリーポイント
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
