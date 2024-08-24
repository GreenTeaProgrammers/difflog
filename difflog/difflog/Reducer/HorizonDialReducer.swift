import Foundation
import ComposableArchitecture

@Reducer
struct HorizonDial {
    @ObservableState
    struct HorizonDialState: Equatable {
        var currentSelect = "kitchen"
        var selectionNameList = ["desk", "kitchen", "shelf"]
        var longestName = ""
        
        init() {
                self.longestName = selectionNameList.max(by: { $0.count < $1.count }) ?? ""
            }
    }
    
    enum HorizonDialAction: Sendable {
        case setCurrentSelection(String)
        case getLongestText
    }

    var body: some Reducer<HorizonDialState, HorizonDialAction> {
        Reduce { state, action in
            switch action {
            case let .setCurrentSelection(selection):
                if state.selectionNameList.contains(selection) {
                    state.currentSelect = selection
                }
                return .none

            case .getLongestText:
                if let longest = state.selectionNameList.max(by: { $0.count < $1.count }) {
                    state.longestName = longest
                }
                return .none
            }
        }
    }
}

