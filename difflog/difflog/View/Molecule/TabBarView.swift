import SwiftUI
import Foundation

struct TabBarView: View {
    

    
    @State var selection = 1

    var body: some View {

        TabView(selection: $selection) {
            LocationListView()
                .tabItem {
                    Label("LocationList", systemImage: "location.viewfinder")
                }
                .tag(3)
            CaptreView()
                .tabItem {
                    Label("Capture", systemImage: "camera")
                }
                .tag(2)

            HomeView(HomeHeaderLabel: "Wellcome")
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(1)

           

            

        } // TabView
        .accentColor(.orange)

    } // body
} // View

#Preview {
    TabBarView(selection: 1)
}
