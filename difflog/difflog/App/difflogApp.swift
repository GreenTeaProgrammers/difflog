import SwiftUI
import SwiftData

@main
struct difflogApp: App {
    // MARK: - データベースの初期化
    @StateObject private var locationUsecase: LocationUsecase
    
    init() {
        do {
            let schema = Schema([
                Location.self,
            ])
            let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
            let container = try ModelContainer(for: schema, configurations: [modelConfiguration])
            
            // LocationUsecaseの初期化
            let context = container.mainContext
            _locationUsecase = StateObject(wrappedValue: LocationUsecase(modelContext: context))
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }
    
    // MARK: - エントリーポイント
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(locationUsecase)
        }
    }
}

// ContentViewの完全な実装
struct ContentView: View {
    @EnvironmentObject var locationUsecase: LocationUsecase
    @State private var locations: [Location] = []
    @State private var isLoading = false
    @State private var errorMessage: String?
    
    var body: some View {
        NavigationView {
            ZStack {
                List(locations, id: \.id) { location in
                    Text(location.name)
                }
                .navigationTitle("Locations")
                .overlay(Group {
                    if isLoading {
                        ProgressView()
                    }
                })
                .alert(item: Binding<AlertItem?>(
                    get: { errorMessage.map { AlertItem(message: $0) } },
                    set: { _ in errorMessage = nil }
                )) { alertItem in
                    Alert(title: Text("Error"), message: Text(alertItem.message))
                }
            }
        }
        .onAppear {
            loadLocations()
        }
    }
    
    private func loadLocations() {
        isLoading = true
        Task {
            do {
                locations = try await locationUsecase.getAllLocations()
                isLoading = false
            } catch {
                errorMessage = "Failed to load locations: \(error.localizedDescription)"
                isLoading = false
            }
        }
    }
}

// AlertItemの定義
struct AlertItem: Identifiable {
    let id = UUID()
    let message: String
}
