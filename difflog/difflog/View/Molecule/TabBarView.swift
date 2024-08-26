import SwiftUI
import Foundation

struct TabBarView: View {

    // タブの選択項目を保持する
    @State var selection = 1

    var body: some View {

        TabView(selection: $selection) {
            LocationListView()
                .tabItem {
                    Label("LocationList", systemImage: "location.viewfinder")
                }
                .tag(1)
            CaptreView()
                .tabItem {
                    Label("Capture", systemImage: "camera")
                }
                .tag(2)

            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .tag(3)

           

            

        } // TabView
        .accentColor(.orange)

    } // body
} // View

#Preview {
    TabBarView(selection: 1)
}
