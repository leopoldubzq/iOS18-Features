import SwiftUI

enum TabPage: String, Hashable {
    case home
    case browse
    case profile
    case settings
    case search
    
    var title: String {
        switch self {
        case .home:
            return "Start"
        case .browse:
            return "Browse"
        case .profile:
            return "Profile"
        case .settings:
            return "Settings"
        case .search:
            return "Search"
        }
    }
    
    var imageName: String {
        switch self {
        case .home:
            return "house"
        case .browse:
            return "square.grid.2x2"
        case .profile:
            return "person"
        case .settings:
            return "gearshape"
        case .search:
            return "magnifyingglass"
        }
    }
}

enum TabPageCategorySection: Hashable {
    case horror
    case comedy
    case thriller
    case scifi
    
    var title: String {
        switch self {
        case .horror:
            return "Horror"
        case .comedy:
            return "Comedy"
        case .thriller:
            return "Thriller"
        case .scifi:
            return "Sci-Fi"
        }
    }
}

struct NewTabViewExampleView: View {
    
    @State private var selectedTab: AnyHashable = TabPage.home
    @State private var toolbarHidden: Bool = false
    @AppStorage("TabViewCustomization")
    private var customization: TabViewCustomization
    
    var body: some View {
        TabView(selection: $selectedTab) {
            Tab(TabPage.home.title, systemImage: TabPage.home.imageName, value: TabPage.home) {
                ContentView()
                    .toolbarBackground(.background, for: .tabBar)
            }
            Tab(TabPage.browse.title, systemImage: TabPage.browse.imageName, value: TabPage.browse) {
                ScrollPhaseChangeExampleView()
                    .toolbarBackground(.background, for: .tabBar)
            }
            
            Tab(TabPage.profile.title, systemImage: TabPage.profile.imageName, value: TabPage.profile) {
                ScrollVisibilityExample()
                    .toolbarBackground(.background, for: .tabBar)
            }
            .customizationID(TabPage.profile.rawValue)
            Tab(TabPage.settings.title, systemImage: TabPage.settings.imageName, value: TabPage.settings) {
                ScrollPositionExampleView()
                    .toolbarBackground(.background, for: .tabBar)
            }
            .customizationID(TabPage.settings.rawValue)
            Tab(value: TabPage.search, role: .search) {
                Text("Search")
                    .toolbarBackground(.background, for: .tabBar)
            }
            
            if DeviceTypeDetector.deviceType == .ipad {
                TabSection("Categories") {
                    Tab(TabPageCategorySection.horror.title, systemImage: "", value: TabPageCategorySection.horror as AnyHashable) {
                        Text(TabPageCategorySection.horror.title)
                    }
                    Tab(TabPageCategorySection.comedy.title, systemImage: "", value: TabPageCategorySection.comedy as AnyHashable) {
                        Text(TabPageCategorySection.comedy.title)
                    }
                    Tab(TabPageCategorySection.thriller.title, systemImage: "", value: TabPageCategorySection.thriller as AnyHashable) {
                        Text(TabPageCategorySection.thriller.title)
                    }
                    Tab(TabPageCategorySection.scifi.title, systemImage: "", value: TabPageCategorySection.scifi as AnyHashable) {
                        Text(TabPageCategorySection.scifi.title)
                    }
                }
            }
        }
        .tabViewStyle(.sidebarAdaptable)
        .tabViewCustomization($customization)
        .tint(.primary)
    }
}

#Preview {
    NewTabViewExampleView()
}
