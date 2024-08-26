import Foundation
import ComposableArchitecture
//TODO: 

@Reducer
struct HorizontalWheelPickerReducer {
    @ObservableState
    struct HorizontalWheelPickerState: Equatable{
        var locations: [String]
        var currentLocation: String
        
        init(locations: [String] = ["TV lack","desk", "kitchen", "shelf", "bed"]) {
                    self.locations = locations
                    self.currentLocation = locations.first ?? ""
                }
    }
    
    enum HorizontalWheelPickerAction: Sendable,Equatable{
        case updateCurrentLocation(String)
    }

    var body: some Reducer<HorizontalWheelPickerState,HorizontalWheelPickerAction> {
        Reduce { state, action in
            switch action {
            case let .updateCurrentLocation(selection):
                if state.locations.contains(selection) {
                    state.currentLocation = selection
                }
                return .none
            }
        }
    }
}
