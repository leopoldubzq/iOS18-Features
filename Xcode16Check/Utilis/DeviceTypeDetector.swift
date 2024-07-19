import SwiftUI

enum DeviceType {
    case iphone
    case ipad
    case unknown
}

struct DeviceTypeDetector {
    static var deviceType: DeviceType {
        if UIDevice.current.userInterfaceIdiom == .pad {
            return .ipad
        } else if UIDevice.current.userInterfaceIdiom == .phone {
            return .iphone
        } else {
            return .unknown
        }
    }
}
