import XCTest
@testable import DIN5573

final class DIN5573Tests: XCTestCase {
    func testProfile() throws {

        if let profile = try? DIN5573.profile(.e, sr: 1425, width: 135, ar: 1360) {
            let points = profile.profile
            let formatter = NumberFormatter()
            formatter.minimumFractionDigits = 3
            formatter.maximumFractionDigits = 3
            for point in points {
                print("\(formatter.string(from: point.x))\t\(formatter.string(from: point.y))")
            }
        }
    }
}


extension NumberFormatter {
    fileprivate func string(from double: Double) -> String {
        string(from: NSNumber(value: double)) ?? ""
    }
}
