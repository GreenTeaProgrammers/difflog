import SwiftUI
import SwiftData

@main
struct difflogApp: App {
    // MARK: - データベースの初期化
    let sharedModelContainer: ModelContainer
    
    // MARK: - LocationUsecase
    @StateObject private var locationUsecase: LocationUsecase
    
    init() {
        do {
            let schema = Schema([
                Location.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            sharedModelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            // LocationUsecaseの初期化
            let context = sharedModelContainer.mainContext
            _locationUsecase = StateObject(wrappedValue: LocationUsecase(modelContext: context))
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    // MARK: - エントリーポイント
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.modelContext, sharedModelContainer.mainContext)
                .environmentObject(locationUsecase)
        }
    }
}
