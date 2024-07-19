import Foundation

struct ItemDto: Identifiable, Equatable {
    let id: UUID = UUID()
    var title: String
}
