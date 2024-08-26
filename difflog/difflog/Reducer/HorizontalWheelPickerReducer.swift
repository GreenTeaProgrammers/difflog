import Foundation
import ComposableArchitecture

@Reducer
struct HorizontalWheelPickerReducer {
    @ObservableState
    struct HorizontalWheelPickerState: Equatable{
        var locations: [String] = ["zero", "one", "two", "three"]
        var currentLocation: String = "zero"
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