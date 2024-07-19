import SwiftUI

enum NetworkType {
    case `default`
    case mock
}

@Observable
final class MovieFetcher {
    
    private let type: NetworkType
    
    init(type: NetworkType = .default) {
        self.type = type
    }
    
    func fetchMovies() async -> [ItemDto] {
        switch type {
        case .mock:
            return [
                ItemDto(title: "Test"),
                ItemDto(title: "Test1"),
                ItemDto(title: "Test2"),
                ItemDto(title: "Test3"),
                ItemDto(title: "Test4"),
                ItemDto(title: "Test5"),
                ItemDto(title: "Test6"),
                ItemDto(title: "Test7"),
                ItemDto(title: "Test8"),
                ItemDto(title: "Test9"),
                ItemDto(title: "Test10"),
                ItemDto(title: "Test11")
            ]
        case .default:
            return [
                ItemDto(title: "IronMan"),
                ItemDto(title: "Captain America"),
                ItemDto(title: "Thor"),
                ItemDto(title: "Avengers"),
                ItemDto(title: "Spider-Man"),
                ItemDto(title: "Deadpool"),
                ItemDto(title: "Punisher"),
                ItemDto(title: "Hawkeye"),
                ItemDto(title: "Moonknight"),
                ItemDto(title: "X-Men"),
                ItemDto(title: "Captain Marvel"),
                ItemDto(title: "Hulk")
            ]
        }
    }
    
}
