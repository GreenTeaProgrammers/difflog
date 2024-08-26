import SwiftUI

struct OneBlockView: View {
    var insideOpacity: CGFloat
    var outsideOpacity: CGFloat
    var size: CGFloat
    var radius:CGFloat = 4
    
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.blue.opacity(Double(outsideOpacity)))
                .border(Color.black)
                .frame(width: size, height: size)
                .cornerRadius(size/radius-1)
            Rectangle()
                .fill(Color.black)
                .frame(width: size*0.65, height: size*0.65)
                .cornerRadius(size/radius*0.65)

            Rectangle()
                .fill(Color.orange.opacity(Double(insideOpacity)))
                
                .frame(width: size*0.6, height: size*0.6)
                .cornerRadius(size/radius*0.6)
                
        }
        
    }
}

#Preview {
    OneBlockView(
        insideOpacity: 0.8,
        outsideOpacity: 0.8,
        size: 30
    )
}
