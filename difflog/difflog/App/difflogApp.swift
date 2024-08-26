import SwiftUI
import SwiftData

@main
struct difflogApp: App {
    // MARK: - データベースの初期化
    @StateObject private var locationUsecase: LocationUsecase
    let sharedModelContainer: ModelContainer
    
    
      init() {
           do {
               let schema = Schema([
                   Location.self,
               ])
               let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)
               sharedModelContainer = try ModelContainer(for: schema, configurations: [modelConfiguration])
               
               let context = sharedModelContainer.mainContext
               _locationUsecase = StateObject(wrappedValue: LocationUsecase(modelContext: context))
           } catch {
               fatalError("Could not create ModelContainer: \(error)")
           }
       }

       var body: some Scene {
           WindowGroup {
               ContentView()
                   .environmentObject(locationUsecase)
                   .modelContainer(sharedModelContainer)
           }
       }
   }


// ContentViewの完全な実装
struct ContentView: View {
       @EnvironmentObject var locationUsecase: LocationUsecase
       @Query private var locations: [Location]

       var body: some View {
           NavigationView {
               List(locations) { location in
                   Text(location.name)
               }
               .navigationTitle("Locations")
               .toolbar {
                   Button("Add Location") {
                       addLocation()
                   }
               }
           }
       }

       private func addLocation() {
           Task {
               do {
                   _ = try  locationUsecase.createLocation(name: "New Location")
               } catch {
                   print("Failed to add location: \(error)")
               }
           }
       }
   }
// AlertItemの定義
struct AlertItem: Identifiable {
    let id = UUID()
    let message: String
}
