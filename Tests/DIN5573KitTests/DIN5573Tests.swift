import XCTest
@testable import DIN5573Kit

final class DIN5573Tests: XCTestCase {

    /// All profiles which DIN5573Kit is supporting.
    let profiles: [WheelProfile?] = {
        var returnValue = [WheelProfile?]()
        for type in WheelProfileType.allCases {
            for sr in DIN5573.validSR {
                for width in DIN5573.validWidth {
                    for ar in DIN5573.validAR {
                        returnValue.append(try? DIN5573.profile(type, sr: sr, width: width, ar: ar))
                    }
                }
            }
        }
        return returnValue
    }()



    func testCreationOfAllProfiles () {
        for profile in profiles {
            XCTAssertNotNil(profile)
        }
    }



    func testAllProfilesHaveMontonousRisingXValues() {
        for profile in profiles {
            if let points = profile?.profile {
                for index in 0..<(points.count - 1) {
                    XCTAssert(points[index].x < points[index+1].x,
                              "Failing for \(String(describing: profile)) at index \(index)")
                }
            }
        }
    }
}



extension NumberFormatter {
    fileprivate func string(from double: Double) -> String {
        string(from: NSNumber(value: double)) ?? ""
    }
}
