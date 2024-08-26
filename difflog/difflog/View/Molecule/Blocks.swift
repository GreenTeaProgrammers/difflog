import SwiftUI

struct Blocks:View {
    let columns = 14
    let rows = 27
    var body: some View {
        VStack(spacing: 1) {
                    ForEach(0..<rows, id: \.self) { row in
                        HStack(spacing: 1) {
                            ForEach(0..<columns, id: \.self) { column in
                                OneBlockView(
                                    insideOpacity: 0.8,
                                    outsideOpacity: 0.8,
                                    size: 20
                                )
                            }
                        }
                    }
                }
            }
    }


#Preview {
    Blocks()
}
