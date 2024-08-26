//
//  LocationUseCase.swift
//  difflog
//
//  Created by GTProgrammer on 2024/08/26.
//

import Foundation
import SwiftData

@MainActor
class LocationUsecase: ObservableObject {
    private var modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    // MARK: - CRUD Operations
    
    func createLocation(name: String) throws -> Location {
        let newLocation = Location(name: name)
        modelContext.insert(newLocation)
        try modelContext.save()
        return newLocation
    }
    
    func getAllLocations() throws -> [Location] {
        let descriptor = FetchDescriptor<Location>(sortBy: [SortDescriptor(\.name)])
        return try modelContext.fetch(descriptor)
    }
    
    func getLocation(byId id: UUID) throws -> Location? {
        let predicate = #Predicate<Location> { $0.id == id }
        let descriptor = FetchDescriptor<Location>(predicate: predicate)
        return try modelContext.fetch(descriptor).first
    }
    
    func updateLocation(_ location: Location) throws {
        try modelContext.save()
    }
    
    func deleteLocation(_ location: Location) throws {
        modelContext.delete(location)
        try modelContext.save()
    }
    
    // MARK: - Helper Methods
    
    func locationsToStrings() throws -> [String] {
        let descriptor = FetchDescriptor<Location>(sortBy: [SortDescriptor(\.name)])
        let locations = try modelContext.fetch(descriptor)
        return locations.map { $0.name }
    }
    
    func searchLocations(byName name: String) throws -> [Location] {
        let predicate = #Predicate<Location> { $0.name.localizedStandardContains(name) }
        let descriptor = FetchDescriptor<Location>(predicate: predicate, sortBy: [SortDescriptor(\.name)])
        return try modelContext.fetch(descriptor)
    }
    
    func deleteAllLocations() throws {
        let locations = try getAllLocations()
        for location in locations {
            modelContext.delete(location)
        }
        try modelContext.save()
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
        Task {
            do {
                locations = try await locationUsecase.getAllLocations()
            } catch {
                print("Failed to load locations: \(error)")
            }
        }
    }
}
