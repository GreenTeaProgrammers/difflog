import SwiftUI
import SwiftData

@main
struct difflogApp: App {
    // MARK: - データベースの初期化
    let sharedModelContainer: ModelContainer
    
    init() {
        do {
            let schema = Schema([
                Location.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            sharedModelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    // MARK: - LocationUsecase
    var locationUsecase: LocationUsecase {
        LocationUsecase(modelContext: sharedModelContainer.mainContext)
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

// ContentViewの例（実際の実装に合わせて調整してください）
struct ContentView: View {
    @EnvironmentObject var locationUsecase: LocationUsecase
    @State private var locations: [Location] = []
    
    var body: some View {
        NavigationView {
            List(locations, id: \.id) { location in
                Text(location.name)
            }
            .navigationTitle("Locations")
            .onAppear {
                loadLocations()
            }
        }
    }
    
    private func loadLocations() {
        do {
            locations = try locationUsecase.getAllLocations()
        } catch {
            print("Failed to load locations: \(error)")
        }
    }
}
