import SwiftUI

struct CustomPageIndicator<Item: RandomAccessCollection>: View {
    
    @Binding var items: Item
    @Binding var visibleIndex: Int
    
    var body: some View {
        HStack {
            ForEach(0..<items.count, id: \.self) { index in
                Circle()
                    .fill(index == visibleIndex ? .primary : Color.secondary.opacity(0.5))
                    .frame(width: 6, height: 6)
                    .scaleEffect(index == visibleIndex ? 1.25 : 0.95)
            }
        }
        .animation(.spring(duration: 0.4), value: visibleIndex)
    }
}

#Preview {
    @Previewable @State var items: [Int] = [0, 1, 2, 3, 4, 5, 6]
    @Previewable @State var visibleIndex: Int = 0
    CustomPageIndicator(items: $items, visibleIndex: $visibleIndex)
}
