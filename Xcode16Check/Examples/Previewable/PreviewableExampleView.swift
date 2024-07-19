import SwiftUI

struct PreviewableExampleView: View {
    
    @Binding var itemToEdit: ItemDto
    @FocusState private var textFieldFocused: Bool
    @Environment(\.dismiss) private var dismiss
    @State private var newItemTitle: String = ""
    
    var body: some View {
        VStack {
            TextField("Item title",
                      text: $itemToEdit.title)
                .focused($textFieldFocused)
                .padding()
                .background {
                    Capsule()
                        .stroke(.primary, lineWidth: 1)
                }
                .padding()
            Button("Save") { dismiss() }
                .buttonStyle(.borderedProminent)
                .fontWeight(.semibold)
                .disabled(!validToDismiss())
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.background)
        .onTapGesture {
            textFieldFocused = false
        }
        .onAppear {
            newItemTitle = itemToEdit.title
        }
    }
    
    private func validToDismiss() -> Bool {
        newItemTitle != itemToEdit.title &&
        !itemToEdit.title.isEmpty
    }
}

#Preview {
    /// new macro from SwiftUI (iOS 18)
    /// it allows you to keep the state of the variable inside #Preview block
    @Previewable @State var itemToEdit = ItemDto(title: "Test")
    PreviewableExampleView(itemToEdit: $itemToEdit)
}
